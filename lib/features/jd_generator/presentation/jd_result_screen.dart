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

    final content = jd.generatedContent;

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
                            jd.jobTitle,
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
                                ref.read(jdGeneratorProvider.notifier).clear();
                                context.pop(); // Go back to form
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
                    _SectionTitle(title: 'Job Summary'),
                    Text(content.jobSummary, style: const TextStyle(height: 1.5, fontSize: 16)),
                    
                    const SizedBox(height: 24),
                    _SectionTitle(title: 'Key Responsibilities'),
                    ...content.responsibilities.map((r) => _BulletPoint(text: r)),

                    const SizedBox(height: 24),
                    _SectionTitle(title: 'Required Skills'),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: content.requiredSkills.map((s) => Chip(
                        label: Text(s),
                        backgroundColor: const Color(0xFFE0E7FF),
                        side: BorderSide.none,
                      )).toList(),
                    ),

                    const SizedBox(height: 24),
                    _SectionTitle(title: 'Required Qualifications'),
                    ...content.requiredQualifications.map((q) => _BulletPoint(text: q)),

                    if (content.preferredQualifications.isNotEmpty) ...[
                      const SizedBox(height: 24),
                      _SectionTitle(title: 'Preferred Qualifications'),
                      ...content.preferredQualifications.map((q) => _BulletPoint(text: q)),
                    ],

                    const SizedBox(height: 24),
                    _SectionTitle(title: 'Details'),
                    _DetailRow(icon: Icons.timeline, label: 'Experience:', value: content.experience),
                    _DetailRow(icon: Icons.attach_money, label: 'Salary:', value: content.salary),
                    _DetailRow(icon: Icons.location_on, label: 'Location:', value: content.location),
                    _DetailRow(icon: Icons.computer, label: 'Work Mode:', value: content.workMode),
                    _DetailRow(icon: Icons.work, label: 'Job Type:', value: content.jobType),

                    if (content.benefits.isNotEmpty) ...[
                      const SizedBox(height: 24),
                      _SectionTitle(title: 'Benefits'),
                      ...content.benefits.map((b) => _BulletPoint(text: b)),
                    ],

                    const SizedBox(height: 24),
                    const Divider(),
                    const SizedBox(height: 16),
                    Text(
                      content.equalOpportunityStatement,
                      style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
                      textAlign: TextAlign.center,
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

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: const Color(0xFF374151)),
      ),
    );
  }
}

class _BulletPoint extends StatelessWidget {
  final String text;
  const _BulletPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 20, color: Color(0xFF6200EA))),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 16, height: 1.5))),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DetailRow({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey[700]),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(width: 8),
          Text(value, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
