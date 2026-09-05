import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'jd_provider.dart';
import '../data/jd_repository.dart';
import '../../candidate/data/models/candidate_models.dart';
import '../../../core/widgets/logout_button.dart';

class RecruiterJobsScreen extends ConsumerStatefulWidget {
  final String? initialTab;
  const RecruiterJobsScreen({super.key, this.initialTab});

  @override
  ConsumerState<RecruiterJobsScreen> createState() => _RecruiterJobsScreenState();
}

class _RecruiterJobsScreenState extends ConsumerState<RecruiterJobsScreen> {
  late String _selectedTab;
  String _searchQuery = '';
  int? _loadingJobId;

  @override
  void initState() {
    super.initState();
    _selectedTab = widget.initialTab ?? 'All';
  }

  @override
  void didUpdateWidget(covariant RecruiterJobsScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialTab != null && widget.initialTab != oldWidget.initialTab) {
      _selectedTab = widget.initialTab!;
    }
  }

  Future<void> _viewJob(CandidateJob job) async {
    setState(() => _loadingJobId = job.jobId);
    try {
      final versions = await ref.read(jdRepositoryProvider).getJobVersions(job.jobId);
      if (versions.isNotEmpty) {
        versions.sort((a, b) => b.versionNumber.compareTo(a.versionNumber));
        final latestVersion = versions.first;
        ref.read(jdGeneratorProvider.notifier).setJd(latestVersion);
        if (mounted) {
          context.push('/jd/result', extra: latestVersion);
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No JD generated for this job yet.')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load JD: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _loadingJobId = null);
    }
  }

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
            child: Row(
              children: [
                const Icon(Icons.search, color: Colors.grey, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    onChanged: (val) => setState(() => _searchQuery = val.trim().toLowerCase()),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search jobs...',
                      hintStyle: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.grey),
            tooltip: 'Refresh Jobs',
            onPressed: () {
              ref.invalidate(recruiterJobsProvider);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Jobs refreshed!'), duration: Duration(seconds: 1)),
              );
            },
          ),
          IconButton(icon: const Icon(Icons.notifications_none, color: Colors.grey), onPressed: () {}),
          const SizedBox(width: 16),
          const CircleAvatar(radius: 16, backgroundColor: Color(0xFF6D28D9), child: Icon(Icons.person, size: 20, color: Colors.white)),
          const SizedBox(width: 8),
          const AppLogoutButton(),
          const SizedBox(width: 16),
        ],
      ),
      body: jobsAsync.when(
        data: (jobs) {
          final publishedJobs = jobs.where((j) => j.publishedAt != null).toList();
          final draftJobs = jobs.where((j) => j.publishedAt == null).toList();

          final counts = {
            'All': jobs.length,
            'Published': publishedJobs.length,
            'Drafts': draftJobs.length,
            'Closed': 0,
          };

          List<CandidateJob> filteredJobs = jobs;
          if (_selectedTab == 'Published') {
            filteredJobs = publishedJobs;
          } else if (_selectedTab == 'Drafts') {
            filteredJobs = draftJobs;
          } else if (_selectedTab == 'Closed') {
            filteredJobs = [];
          }

          if (_searchQuery.isNotEmpty) {
            filteredJobs = filteredJobs.where((j) {
              return j.jobTitle.toLowerCase().contains(_searchQuery) ||
                  j.location.toLowerCase().contains(_searchQuery) ||
                  j.workMode.toLowerCase().contains(_searchQuery);
            }).toList();
          }

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
                  child: filteredJobs.isEmpty 
                      ? Center(
                          child: Text(
                            _searchQuery.isNotEmpty
                                ? 'No jobs match "$_searchQuery"'
                                : 'No ${_selectedTab == "All" ? "" : _selectedTab.toLowerCase()} jobs found.',
                            style: const TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        )
                      : ListView.separated(
                          itemCount: filteredJobs.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            final job = filteredJobs[index];
                            final isPublished = job.publishedAt != null;
                            final isLoading = _loadingJobId == job.jobId;

                            return Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () => _viewJob(job),
                                borderRadius: BorderRadius.circular(12),
                                hoverColor: const Color(0xFFF5F3FF).withOpacity(0.4),
                                child: Container(
                                  padding: const EdgeInsets.all(24),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: Colors.grey.withOpacity(0.12)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.02),
                                        blurRadius: 4,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  job.jobTitle,
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xFF1E293B),
                                                  ),
                                                ),
                                                if (isLoading) ...[
                                                  const SizedBox(width: 12),
                                                  const SizedBox(
                                                    width: 16,
                                                    height: 16,
                                                    child: CircularProgressIndicator(strokeWidth: 2),
                                                  ),
                                                ],
                                              ],
                                            ),
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
                                                Text(
                                                  isPublished
                                                      ? 'Published on ${job.publishedAt!.split('T').first}'
                                                      : 'Draft',
                                                  style: TextStyle(
                                                    color: isPublished ? Colors.grey[500] : const Color(0xFFD97706),
                                                    fontSize: 12,
                                                    fontWeight: isPublished ? FontWeight.normal : FontWeight.w600,
                                                  ),
                                                ),
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
                                              color: isPublished ? const Color(0xFFECFDF5) : const Color(0xFFFFFBEB),
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            child: Text(
                                              isPublished ? 'Published' : 'Draft',
                                              style: TextStyle(
                                                color: isPublished ? const Color(0xFF10B981) : const Color(0xFFD97706),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 16),
                                          IconButton(
                                            icon: const Icon(Icons.delete_outline, color: Colors.red),
                                            tooltip: 'Delete Job',
                                            onPressed: () async {
                                              final confirm = await showDialog<bool>(
                                                context: context,
                                                builder: (c) => AlertDialog(
                                                  title: const Text('Delete Job'),
                                                  content: const Text('Are you sure you want to delete this job posting?'),
                                                  actions: [
                                                    TextButton(onPressed: () => Navigator.pop(c, false), child: const Text('Cancel')),
                                                    TextButton(onPressed: () => Navigator.pop(c, true), child: const Text('Delete', style: TextStyle(color: Colors.red))),
                                                  ],
                                                ),
                                              );
                                              if (confirm == true) {
                                                try {
                                                  await ref.read(recruiterActionsProvider).deleteJob(job.jobId);
                                                  if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Job deleted.')));
                                                } catch (e) {
                                                  if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
                                                }
                                              }
                                            },
                                          ),
                                          const SizedBox(width: 8),
                                          OutlinedButton(
                                            onPressed: () => _viewJob(job),
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
                                ),
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
