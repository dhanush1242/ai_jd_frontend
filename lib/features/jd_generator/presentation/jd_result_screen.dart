import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Version ${jd.versionNumber}',
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF6200EA),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                ref.read(jdGeneratorProvider.notifier).regenerate(jd.jobId);
                              },
                              icon: const Icon(Icons.refresh, size: 18),
                              label: const Text('Regenerate'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF00E5FF),
                                foregroundColor: Colors.black87,
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              ),
                            ),
                            const SizedBox(width: 8),
                            IconButton(icon: const Icon(Icons.copy), onPressed: () {}),
                            IconButton(icon: const Icon(Icons.download), onPressed: () {}),
                          ],
                        ),
                      ],
                    ),
                    const Divider(height: 32),
                    SelectableText(
                      jd.generatedJd, 
                      style: const TextStyle(height: 1.5, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
