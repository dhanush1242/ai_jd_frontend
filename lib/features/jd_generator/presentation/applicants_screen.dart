import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'jd_provider.dart';
import '../data/jd_repository.dart';

class ApplicantsScreen extends ConsumerStatefulWidget {
  final int jobId;
  
  const ApplicantsScreen({super.key, required this.jobId});

  @override
  ConsumerState<ApplicantsScreen> createState() => _ApplicantsScreenState();
}

class _ApplicantsScreenState extends ConsumerState<ApplicantsScreen> {
  String _selectedTab = 'All';

  Future<void> _updateStatus(int applicationId, String newStatus) async {
    try {
      await ref.read(jdRepositoryProvider).updateApplicationStatus(applicationId, newStatus);
      // Refresh the list
      ref.invalidate(recruiterApplicationsProvider(widget.jobId));
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Status updated to $newStatus')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to update status: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final applicationsAsync = ref.watch(recruiterApplicationsProvider(widget.jobId));

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.go('/recruiter/jobs'),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Applicants', style: TextStyle(color: Color(0xFF1E293B), fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text('Review and manage candidates for this job.', style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.notifications_none, color: Colors.grey), onPressed: () {}),
          const SizedBox(width: 16),
          const CircleAvatar(radius: 16, backgroundColor: Color(0xFF6D28D9), child: Icon(Icons.person, size: 20, color: Colors.white)),
          const SizedBox(width: 24),
        ],
      ),
      body: applicationsAsync.when(
        data: (applications) {
          final counts = {
            'All': applications.length,
            'Applied': applications.where((a) => a.status == 'Applied').length,
            'Under Review': applications.where((a) => a.status == 'Under Review' || a.status == 'Screening').length,
            'Interview': applications.where((a) => a.status == 'Interview').length,
            'Offer': applications.where((a) => a.status == 'Offer').length,
            'Rejected': applications.where((a) => a.status == 'Rejected').length,
          };

          final filteredApps = _selectedTab == 'All' 
              ? applications 
              : applications.where((a) {
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
                  ],
                ),
                
                const SizedBox(height: 24),
                
                Expanded(
                  child: filteredApps.isEmpty 
                      ? const Center(child: Text('No applicants found in this category.'))
                      : ListView.separated(
                          itemCount: filteredApps.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            final app = filteredApps[index];
                            
                            return Container(
                              padding: const EdgeInsets.all(24),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey.withOpacity(0.1)),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 24,
                                    backgroundColor: const Color(0xFFE0E7FF),
                                    child: Text(app.candidateName.isNotEmpty ? app.candidateName[0].toUpperCase() : 'C', style: const TextStyle(color: Color(0xFF4F46E5), fontWeight: FontWeight.bold, fontSize: 20)),
                                  ),
                                  const SizedBox(width: 20),
                                  
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(app.candidateName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
                                        const SizedBox(height: 4),
                                        Text(app.candidateEmail, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                                        const SizedBox(height: 12),
                                        Row(
                                          children: [
                                            const Icon(Icons.work_outline, size: 14, color: Colors.grey),
                                            const SizedBox(width: 4),
                                            Text(app.experience ?? 'N/A', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                                            const SizedBox(width: 16),
                                            const Icon(Icons.school_outlined, size: 14, color: Colors.grey),
                                            const SizedBox(width: 4),
                                            Text(app.educationQualification ?? 'N/A', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Text('Skills: ${app.skills ?? 'None listed'}', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                                      ],
                                    ),
                                  ),
                                  
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text('Applied ${app.createdAt.split('T').first}', style: TextStyle(color: Colors.grey[400], fontSize: 12)),
                                      const SizedBox(height: 16),
                                      Row(
                                        children: [
                                          OutlinedButton.icon(
                                            onPressed: () {
                                              // In a real app we'd launch url_launcher
                                            },
                                            icon: const Icon(Icons.description_outlined, size: 16),
                                            label: const Text('Resume'),
                                          ),
                                          const SizedBox(width: 12),
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 12),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(4),
                                              border: Border.all(color: Colors.grey.withOpacity(0.3)),
                                            ),
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton<String>(
                                                value: app.status,
                                                items: ['Applied', 'Under Review', 'Interview', 'Offer', 'Rejected']
                                                    .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                                                    .toList(),
                                                onChanged: (newStatus) {
                                                  if (newStatus != null && newStatus != app.status) {
                                                    _updateStatus(app.applicationId, newStatus);
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
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
