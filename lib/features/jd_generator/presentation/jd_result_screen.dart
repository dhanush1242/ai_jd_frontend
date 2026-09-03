import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:go_router/go_router.dart';
import 'jd_provider.dart';

class JdResultScreen extends ConsumerWidget {
  const JdResultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final generatorState = ref.watch(jdGeneratorProvider);
    final jd = generatorState.valueOrNull;

    if (jd == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Result')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('No JD generated yet.'),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: () => context.pop(), child: const Text('Go Back')),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Generated Job Description'),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF6200EA),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            ref.read(jdGeneratorProvider.notifier).clear();
            context.pop(); // Go back to history/form
          },
        ),
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.check, color: Colors.green),
            label: const Text('Publish JD', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
          ),
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
                child: MarkdownBody(
                  data: jd.generatedJd,
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
