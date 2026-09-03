import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'candidate_jobs_provider.dart';

class MyJobsScreen extends ConsumerStatefulWidget {
  const MyJobsScreen({super.key});

  @override
  ConsumerState<MyJobsScreen> createState() => _MyJobsScreenState();
}

class _MyJobsScreenState extends ConsumerState<MyJobsScreen> {
  String _selectedTab = 'All';

  @override
  Widget build(BuildContext context) {
    final applicationsAsync = ref.watch(candidateApplicationsProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('My Jobs', style: TextStyle(color: Color(0xFF1E293B), fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text('Track and manage all the jobs you have applied to.', style: TextStyle(color: Colors.grey, fontSize: 12)),
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
      body: applicationsAsync.when(
        data: (apps) {
          final counts = {
            'All': apps.length,
            'Applied': apps.where((a) => a.status == 'Applied').length,
            'Under Review': apps.where((a) => a.status == 'Under Review' || a.status == 'Screening').length,
            'Interview': apps.where((a) => a.status == 'Interview').length,
            'Offer': apps.where((a) => a.status == 'Offer').length,
            'Rejected': apps.where((a) => a.status == 'Rejected').length,
          };

          final filteredApps = _selectedTab == 'All' 
              ? apps 
              : apps.where((a) {
                  if (_selectedTab == 'Under Review') return a.status == 'Under Review' || a.status == 'Screening';
                  return a.status == _selectedTab;
                }).toList();

          return Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: ['All', 'Applied', 'Under Review', 'Interview', 'Offer', 'Rejected'].map((tab) {
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
                    Row(
                      children: [
                        const Text('Sort by: ', style: TextStyle(color: Colors.grey)),
                        const Text('Recently Applied', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
                        const Icon(Icons.keyboard_arrow_down, size: 16),
                      ],
                    ),
                  ],
                ),
                
                const SizedBox(height: 24),
                
                Expanded(
                  child: filteredApps.isEmpty 
                      ? const Center(child: Text('No jobs found in this category.'))
                      : ListView.separated(
                          itemCount: filteredApps.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            final app = filteredApps[index];
                            
                            Color statusColor = const Color(0xFF10B981); // Green Applied
                            Color statusBg = const Color(0xFFECFDF5);
                            if (app.status == 'Under Review' || app.status == 'Screening') {
                              statusColor = const Color(0xFF3B82F6);
                              statusBg = const Color(0xFFEFF6FF);
                            } else if (app.status == 'Interview') {
                              statusColor = const Color(0xFF8B5CF6);
                              statusBg = const Color(0xFFF5F3FF);
                            } else if (app.status == 'Rejected') {
                              statusColor = const Color(0xFFEF4444);
                              statusBg = const Color(0xFFFEF2F2);
                            } else if (app.status == 'Offer') {
                              statusColor = const Color(0xFFF59E0B);
                              statusBg = const Color(0xFFFFFBEB);
                            }

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
                                        app.jobTitle.isNotEmpty ? app.jobTitle[0].toUpperCase() : 'J',
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
                                        Text(app.jobTitle, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Icon(Icons.location_on_outlined, size: 14, color: Colors.grey[500]),
                                            const SizedBox(width: 4),
                                            Text(app.location, style: TextStyle(color: Colors.grey[500], fontSize: 12)),
                                            const SizedBox(width: 12),
                                            _Tag(text: app.workMode),
                                            const SizedBox(width: 8),
                                            _Tag(text: app.jobType),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Text('Applied on ${app.createdAt.split('T').first}', style: TextStyle(color: Colors.grey[400], fontSize: 12)),
                                      ],
                                    ),
                                  ),
                                  
                                  // Status & Actions
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                        decoration: BoxDecoration(
                                          color: statusBg,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Text(app.status, style: TextStyle(color: statusColor, fontWeight: FontWeight.bold, fontSize: 12)),
                                      ),
                                      const SizedBox(width: 16),
                                      Icon(Icons.bookmark_border, color: Colors.grey[400]),
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
