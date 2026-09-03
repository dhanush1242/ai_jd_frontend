import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'candidate_jobs_provider.dart';

class SavedJobsScreen extends ConsumerWidget {
  const SavedJobsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedJobsAsync = ref.watch(savedJobsProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Saved Jobs', style: TextStyle(color: Color(0xFF1E293B), fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text('Jobs you saved for later.', style: TextStyle(color: Colors.grey, fontSize: 12)),
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
                Expanded(child: TextField(decoration: InputDecoration(border: InputBorder.none, hintText: 'Search jobs, skills, companies...', hintStyle: TextStyle(fontSize: 14)))),
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
      body: savedJobsAsync.when(
        data: (jobs) {
          return Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('Sort by: ', style: TextStyle(color: Colors.grey)),
                    const Text('Recently Saved', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
                    const Icon(Icons.keyboard_arrow_down, size: 16),
                  ],
                ),
                
                const SizedBox(height: 24),
                
                Expanded(
                  child: jobs.isEmpty 
                      ? const Center(child: Text('No saved jobs found.'))
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
                                  // Logo Placeholder
                                  Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF8FAFC),
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: Colors.grey.withOpacity(0.2)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        job.jobTitle.isNotEmpty ? job.jobTitle[0].toUpperCase() : 'J',
                                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF64748B)),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  
                                  // Details
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Company', style: TextStyle(color: Colors.grey[600], fontSize: 13, fontWeight: FontWeight.w500)),
                                        const SizedBox(height: 4),
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
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Text('Saved recently', style: TextStyle(color: Colors.grey[400], fontSize: 12)),
                                      ],
                                    ),
                                  ),
                                  
                                  // Actions
                                  Row(
                                    children: [
                                      const Icon(Icons.bookmark, color: Color(0xFFF59E0B)),
                                      const SizedBox(width: 16),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(0xFF6D28D9),
                                          foregroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                        ),
                                        child: const Text('View Job'),
                                      ),
                                      const SizedBox(width: 16),
                                      Icon(Icons.more_vert, color: Colors.grey[400]),
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
