import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'candidate_jobs_provider.dart';
import '../data/models/candidate_models.dart';
import '../../../core/widgets/logout_button.dart';
import 'widgets/job_details_dialog.dart';

class ExploreJobsScreen extends ConsumerStatefulWidget {
  const ExploreJobsScreen({super.key});

  @override
  ConsumerState<ExploreJobsScreen> createState() => _ExploreJobsScreenState();
}

class _ExploreJobsScreenState extends ConsumerState<ExploreJobsScreen> {
  final _searchController = TextEditingController();
  final _locationController = TextEditingController();
  String? _selectedExperience;

  @override
  void dispose() {
    _searchController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  void _applyFilters() {
    ref.read(candidateJobFilterProvider.notifier).state = JobFilter(
      skills: _searchController.text.trim().isEmpty ? null : _searchController.text.trim(),
      location: _locationController.text.trim().isEmpty ? null : _locationController.text.trim(),
      experience: _selectedExperience,
    );
  }

  void _clearFilters() {
    _searchController.clear();
    _locationController.clear();
    setState(() {
      _selectedExperience = null;
    });
    ref.read(candidateJobFilterProvider.notifier).state = const JobFilter();
  }

  void _showJobDetails(CandidateJob job, bool isBookmarked, bool isApplied, CandidateActions actions) {
    showDialog(
      context: context,
      builder: (ctx) => JobDetailsDialog(
        job: job,
        isBookmarked: isBookmarked,
        isApplied: isApplied,
        onBookmarkToggle: () async {
          await actions.toggleBookmark(job.jobId, isBookmarked);
        },
        onApply: isApplied
            ? null
            : () async {
                await actions.applyForJob(job.jobId);
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Applied successfully!')),
                  );
                }
              },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final jobsAsync = ref.watch(candidateJobsProvider);
    final bookmarksAsync = ref.watch(candidateBookmarksProvider);
    final applicationsAsync = ref.watch(candidateApplicationsProvider);
    final actions = ref.read(candidateActionsProvider);
    final currentFilter = ref.watch(candidateJobFilterProvider);

    final bookmarkedJobIds = bookmarksAsync.valueOrNull?.map((b) => b.jobId).toSet() ?? {};
    final appliedJobIds = applicationsAsync.valueOrNull?.map((a) => a.jobId).toSet() ?? {};

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Explore Jobs', style: TextStyle(color: Color(0xFF1E293B), fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text('Find your next big opportunity.', style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
        actions: [
          Container(
            width: 320,
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.symmetric(horizontal: 14),
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
                    controller: _searchController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search skills or job title...',
                      hintStyle: TextStyle(fontSize: 13),
                    ),
                    onSubmitted: (_) => _applyFilters(),
                  ),
                ),
                if (_searchController.text.isNotEmpty)
                  IconButton(
                    icon: const Icon(Icons.clear, size: 16, color: Colors.grey),
                    onPressed: () {
                      _searchController.clear();
                      _applyFilters();
                    },
                  )
                else
                  IconButton(
                    icon: const Icon(Icons.arrow_forward, size: 16, color: Color(0xFF6D28D9)),
                    onPressed: _applyFilters,
                  ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.grey),
            tooltip: 'Refresh Jobs',
            onPressed: () {
              ref.invalidate(candidateJobsProvider);
              ref.invalidate(candidateBookmarksProvider);
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
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Filter Bar with Location and Experience
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.withOpacity(0.1)),
              ),
              child: Row(
                children: [
                  // Location Filter
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: _locationController,
                      decoration: const InputDecoration(
                        isDense: true,
                        prefixIcon: Icon(Icons.location_on_outlined, size: 18),
                        hintText: 'Filter by Location (e.g. Remote, Bangalore)',
                        hintStyle: TextStyle(fontSize: 13),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      ),
                      onSubmitted: (_) => _applyFilters(),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Experience Filter
                  Expanded(
                    flex: 1,
                    child: DropdownButtonFormField<String>(
                      isDense: true,
                      value: _selectedExperience,
                      decoration: const InputDecoration(
                        isDense: true,
                        prefixIcon: Icon(Icons.work_outline, size: 18),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      ),
                      hint: const Text('Experience', style: TextStyle(fontSize: 13)),
                      items: const [
                        DropdownMenuItem(value: null, child: Text('All Experience')),
                        DropdownMenuItem(value: '0-1 years', child: Text('0-1 years')),
                        DropdownMenuItem(value: '1-3 years', child: Text('1-3 years')),
                        DropdownMenuItem(value: '3-5 years', child: Text('3-5 years')),
                        DropdownMenuItem(value: '5+ years', child: Text('5+ years')),
                      ],
                      onChanged: (val) {
                        setState(() => _selectedExperience = val);
                        _applyFilters();
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6D28D9),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    onPressed: _applyFilters,
                    icon: const Icon(Icons.filter_list, size: 16),
                    label: const Text('Filter'),
                  ),
                  if (currentFilter.hasFilters) ...[
                    const SizedBox(width: 8),
                    TextButton.icon(
                      style: TextButton.styleFrom(foregroundColor: Colors.redAccent),
                      onPressed: _clearFilters,
                      icon: const Icon(Icons.close, size: 16),
                      label: const Text('Clear'),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Job List Area
            Expanded(
              child: jobsAsync.when(
                data: (jobs) {
                  if (jobs.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.search_off_outlined, size: 48, color: Colors.grey[400]),
                          const SizedBox(height: 12),
                          const Text('No jobs found matching your criteria.', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF475569))),
                          const SizedBox(height: 6),
                          Text('Try changing your search terms or clearing filters.', style: TextStyle(color: Colors.grey[500])),
                        ],
                      ),
                    );
                  }

                  return ListView.separated(
                    itemCount: jobs.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final job = jobs[index];
                      final isBookmarked = bookmarkedJobIds.contains(job.jobId);
                      final isApplied = appliedJobIds.contains(job.jobId);

                      return InkWell(
                        onTap: () => _showJobDetails(job, isBookmarked, isApplied, actions),
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey.withOpacity(0.1)),
                          ),
                          child: Row(
                            children: [
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
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(job.jobTitle, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
                                    const SizedBox(height: 4),
                                    Text('Skills: ${job.requiredSkills}', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        _Tag(text: job.location, icon: Icons.location_on_outlined),
                                        const SizedBox(width: 8),
                                        _Tag(text: job.experience, icon: Icons.work_outline),
                                        const SizedBox(width: 8),
                                        _Tag(text: job.workMode),
                                        const SizedBox(width: 8),
                                        _Tag(text: job.jobType),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(isBookmarked ? Icons.bookmark : Icons.bookmark_border),
                                    color: isBookmarked ? const Color(0xFFF59E0B) : Colors.grey[400],
                                    tooltip: isBookmarked ? 'Remove Bookmark' : 'Bookmark Job',
                                    onPressed: () async {
                                      try {
                                        await actions.toggleBookmark(job.jobId, isBookmarked);
                                      } catch (e) {
                                        if (context.mounted) {
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
                                        }
                                      }
                                    },
                                  ),
                                  const SizedBox(width: 12),
                                  OutlinedButton(
                                    onPressed: () => _showJobDetails(job, isBookmarked, isApplied, actions),
                                    style: OutlinedButton.styleFrom(
                                      side: const BorderSide(color: Color(0xFF6D28D9)),
                                      foregroundColor: const Color(0xFF6D28D9),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                    ),
                                    child: const Text('Details'),
                                  ),
                                  const SizedBox(width: 12),
                                  if (isApplied)
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFECFDF5),
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color: const Color(0xFF10B981)),
                                      ),
                                      child: const Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(Icons.check_circle, color: Color(0xFF10B981), size: 16),
                                          SizedBox(width: 6),
                                          Text(
                                            'Applied',
                                            style: TextStyle(
                                              color: Color(0xFF047857),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  else
                                    ElevatedButton(
                                      onPressed: () async {
                                        try {
                                          await actions.applyForJob(job.jobId);
                                          if (context.mounted) {
                                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Applied successfully!')));
                                          }
                                        } catch (e) {
                                          if (context.mounted) {
                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error applying: $e')));
                                          }
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFF6D28D9),
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                      ),
                                      child: const Text('Apply Now'),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, st) => Center(child: Text('Error: $e')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final String text;
  final IconData? icon;
  const _Tag({required this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12, color: const Color(0xFF64748B)),
            const SizedBox(width: 4),
          ],
          Text(text, style: const TextStyle(color: Color(0xFF475569), fontSize: 12, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
