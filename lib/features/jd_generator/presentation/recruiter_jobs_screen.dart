import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'jd_provider.dart';
import '../data/jd_repository.dart';

class RecruiterJobsScreen extends ConsumerStatefulWidget {
  const RecruiterJobsScreen({super.key});

  @override
  ConsumerState<RecruiterJobsScreen> createState() => _RecruiterJobsScreenState();
}

class _RecruiterJobsScreenState extends ConsumerState<RecruiterJobsScreen> {
  String _selectedTab = 'All';

  @override
  Widget build(BuildContext context) {
    final jobsAsync = ref.watch(recruiterJobsProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('My JDs', style: TextStyle(color: Color(0xFF1E293B), fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text('Manage your job descriptions and view applicants.', style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
        actions: [
          Container(
            width: 300,
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              children: [
                Icon(Icons.search, color: Colors.grey, size: 20),
                SizedBox(width: 8),
                Expanded(child: TextField(decoration: InputDecoration(border: InputBorder.none, hintText: 'Search jobs...', hintStyle: TextStyle(fontSize: 14)))),
              ],
            ),
          ),
          const SizedBox(width: 16),
          IconButton(icon: const Icon(Icons.notifications_none, color: Colors.grey), onPressed: () {}),
          const SizedBox(width: 16),
          const CircleAvatar(radius: 16, backgroundColor: Color(0xFF6D28D9), child: Icon(Icons.person, size: 20, color: Colors.white)),
          const SizedBox(width: 24),
        ],
      ),
      body: jobsAsync.when(
        data: (jobs) {
          final counts = {
            'All': jobs.length,
            'Published': jobs.length, // Assume all are published for now based on current backend
            'Drafts': 0,
            'Closed': 0,
          };

          return Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: ['All', 'Published', 'Drafts', 'Closed'].map((tab) {
                        final isSelected = _selectedTab == tab;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: InkWell(
                            onTap: () => setState(() => _selectedTab = tab),
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: isSelected ? const Color(0xFFF5F3FF) : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: isSelected ? const Color(0xFF8B5CF6) : Colors.grey.withOpacity(0.2)),
                              ),
                              child: Row(
                                children: [
                                  Text(tab, style: TextStyle(color: isSelected ? const Color(0xFF6D28D9) : Colors.grey[700], fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: isSelected ? const Color(0xFFE0E7FF) : const Color(0xFFF1F5F9),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(counts[tab].toString(), style: TextStyle(color: isSelected ? const Color(0xFF4F46E5) : Colors.grey[600], fontSize: 10, fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    ElevatedButton.icon(
                      onPressed: () => context.go('/jd/create'),
                      icon: const Icon(Icons.add),
                      label: const Text('New JD'),
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF6D28D9), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                    ),
                  ],
                ),
                
                const SizedBox(height: 24),
                
                Expanded(
                  child: jobs.isEmpty 
                      ? const Center(child: Text('No jobs found.'))
                      : ListView.separated(
                          itemCount: jobs.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            final job = jobs[index];

                            return Container(
                              padding: const EdgeInsets.all(24),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey.withOpacity(0.1)),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(job.jobTitle, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Icon(Icons.location_on_outlined, size: 14, color: Colors.grey[500]),
                                            const SizedBox(width: 4),
                                            Text(job.location, style: TextStyle(color: Colors.grey[500], fontSize: 12)),
                                            const SizedBox(width: 12),
                                            _Tag(text: job.workMode),
                                            const SizedBox(width: 8),
                                            _Tag(text: job.jobType),
                                            const SizedBox(width: 12),
                                            Text(job.publishedAt != null ? 'Published on ${job.publishedAt!.split('T').first}' : 'Draft', style: TextStyle(color: Colors.grey[400], fontSize: 12)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFECFDF5), // Published green
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: const Text('Published', style: TextStyle(color: Color(0xFF10B981), fontWeight: FontWeight.bold, fontSize: 12)),
                                      ),
                                      const SizedBox(width: 16),
                                      OutlinedButton(
                                        onPressed: () {},
                                        child: const Text('Edit'),
                                      ),
                                      const SizedBox(width: 16),
                                      OutlinedButton(
                                        onPressed: () async {
                                          try {
                                            final versions = await ref.read(jdRepositoryProvider).getJobVersions(job.jobId);
                                            if (versions.isNotEmpty) {
                                              ref.read(jdGeneratorProvider.notifier).setJd(versions.last);
                                              if (context.mounted) context.go('/jd/result');
                                            } else {
                                              if (context.mounted) {
                                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No JD generated for this job yet.')));
                                              }
                                            }
                                          } catch (e) {
                                            if (context.mounted) {
                                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to load JD: $e')));
                                            }
                                          }
                                        },
                                        child: const Text('View JD'),
                                      ),
                                      const SizedBox(width: 16),
                                      ElevatedButton(
                                        onPressed: () => context.go('/recruiter/jobs/${job.jobId}/applicants'),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(0xFF6D28D9),
                                          foregroundColor: Colors.white,
                                        ),
                                        child: const Text('View Applicants'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final String text;

  const _Tag({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 4, height: 4, decoration: const BoxDecoration(color: Colors.grey, shape: BoxShape.circle)),
        const SizedBox(width: 4),
        Text(text, style: TextStyle(color: Colors.grey[500], fontSize: 12)),
      ],
    );
  }
}
