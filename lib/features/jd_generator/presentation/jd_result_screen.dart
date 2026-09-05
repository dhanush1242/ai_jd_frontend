import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:go_router/go_router.dart';
import 'jd_provider.dart';
import '../data/jd_repository.dart';
import '../data/models/jd_models.dart';
import '../../../core/widgets/logout_button.dart';

class JdResultScreen extends ConsumerStatefulWidget {
  final JobDescriptionResponse? initialJd;
  const JdResultScreen({super.key, this.initialJd});

  @override
  ConsumerState<JdResultScreen> createState() => _JdResultScreenState();
}

class _JdResultScreenState extends ConsumerState<JdResultScreen> {
  bool _isEditing = false;
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    if (widget.initialJd != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(jdGeneratorProvider.notifier).setJd(widget.initialJd!);
      });
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final generatorState = ref.watch(jdGeneratorProvider);
    final jd = generatorState.valueOrNull ?? widget.initialJd;

    if (jd == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Result')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('No JD generated yet.'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.go('/recruiter/jobs');
                  }
                },
                child: const Text('Go Back'),
              ),
            ],
          ),
        ),
      );
    }

    if (_textController.text.isEmpty && _isEditing) {
      _textController.text = jd.updatedJd ?? jd.generatedJd;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Generated Job Description'),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF6200EA),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/recruiter/jobs');
            }
          },
        ),
        actions: [
          if (!_isEditing)
            TextButton.icon(
              onPressed: () async {
                try {
                  final newJd = await ref.read(jdRepositoryProvider).regenerateJd(jd.jobId);
                  ref.read(jdGeneratorProvider.notifier).setJd(newJd);
                  if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Regenerated successfully!')));
                } catch (e) {
                  if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
                }
              },
              icon: const Icon(Icons.refresh, color: Colors.blue),
              label: const Text('Regenerate', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
            ),
          const SizedBox(width: 8),
          if (!_isEditing)
            TextButton.icon(
              onPressed: () {
                setState(() {
                  _isEditing = true;
                  _textController.text = jd.updatedJd ?? jd.generatedJd;
                });
              },
              icon: const Icon(Icons.edit, color: Colors.orange),
              label: const Text('Edit Text', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
            )
          else
            TextButton.icon(
              onPressed: () async {
                try {
                  final update = JobDescriptionUpdate(updatedJd: _textController.text);
                  final newJd = await ref.read(jdRepositoryProvider).updateJdVersion(jd.jobId, jd.versionNumber, update);
                  ref.read(jdGeneratorProvider.notifier).setJd(newJd);
                  setState(() => _isEditing = false);
                  if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Saved successfully!')));
                } catch (e) {
                  if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
                }
              },
              icon: const Icon(Icons.save, color: Colors.green),
              label: const Text('Save', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
            ),
          const SizedBox(width: 8),
          if (!_isEditing && !jd.isPublished)
            TextButton.icon(
              onPressed: () async {
                try {
                  final newJd = await ref.read(jdRepositoryProvider).publishJdVersion(jd.jobId, jd.versionNumber);
                  ref.read(jdGeneratorProvider.notifier).setJd(newJd);
                  if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Published successfully!')));
                } catch (e) {
                  if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
                }
              },
              icon: const Icon(Icons.publish, color: Colors.green),
              label: const Text('Publish JD', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
            )
          else if (jd.isPublished)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(child: Text('Published', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold))),
            ),
          const SizedBox(width: 8),
          const AppLogoutButton(),
          const SizedBox(width: 16),
        ],
      ),
      backgroundColor: const Color(0xFFF8FAFC),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(48.0),
                child: _isEditing
                    ? TextField(
                        controller: _textController,
                        maxLines: null,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Edit your markdown here...',
                        ),
                        style: const TextStyle(fontSize: 16, color: Color(0xFF475569), height: 1.6),
                      )
                    : MarkdownBody(
                        data: jd.updatedJd ?? jd.generatedJd,
                        selectable: true,
                        styleSheet: MarkdownStyleSheet(
                          h1: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                          h2: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                          h3: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                          p: const TextStyle(fontSize: 16, color: Color(0xFF475569), height: 1.6),
                          listBullet: const TextStyle(fontSize: 16, color: Color(0xFF475569)),
                          strong: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
