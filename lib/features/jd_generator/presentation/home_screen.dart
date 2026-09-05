import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../auth/presentation/auth_provider.dart';
import '../../candidate/presentation/candidate_provider.dart';
import '../../candidate/presentation/candidate_jobs_provider.dart';
import '../presentation/jd_provider.dart';
import '../../../core/widgets/logout_button.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).valueOrNull;
    final isCandidate = user?.role == 'candidate';

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(isCandidate ? 'Candidate Dashboard' : 'Recruiter Dashboard', style: const TextStyle(color: Color(0xFF1E293B), fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text('Track your job search and manage your applications', style: TextStyle(color: Colors.grey, fontSize: 12)),
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
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.grey),
            tooltip: 'Refresh',
            onPressed: () {
              if (isCandidate) {
                ref.invalidate(candidateApplicationsProvider);
                ref.invalidate(candidateBookmarksProvider);
                ref.invalidate(candidateDetailsProvider);
                ref.invalidate(candidateJobsProvider);
              } else {
                ref.invalidate(recruiterJobsProvider);
                ref.invalidate(recruiterStatsProvider);
                ref.invalidate(recruiterAllApplicationsProvider);
              }
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Dashboard refreshed!'), duration: Duration(seconds: 1)),
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
      body: isCandidate ? _buildCandidateDashboard(context, ref) : _buildRecruiterDashboard(context, ref),
    );
  }

  Widget _buildCandidateDashboard(BuildContext context, WidgetRef ref) {
    final applicationsAsync = ref.watch(candidateApplicationsProvider);
    final bookmarksAsync = ref.watch(candidateBookmarksProvider);
    final profileCompletedAsync = ref.watch(profileCompletedProvider);
    
    final apps = applicationsAsync.valueOrNull ?? [];
    final underReview = apps.where((a) {
      final s = a.status.toLowerCase().trim();
      return s == 'under review' || s == 'under_review' || s == 'screening';
    }).length;
    final interviews = apps.where((a) => a.status.toLowerCase().trim() == 'interview').length;
    final savedJobsCount = bookmarksAsync.valueOrNull?.length ?? 0;
    final isProfileComplete = profileCompletedAsync.valueOrNull ?? false;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F3FF), // Light purple
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFEDE9FE)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(color: Color(0xFF6D28D9), shape: BoxShape.circle),
                  child: const Text('👋', style: TextStyle(fontSize: 32)),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(fontSize: 24, color: Color(0xFF1E293B), fontWeight: FontWeight.w600),
                          children: [
                            TextSpan(text: 'Good morning, '),
                            TextSpan(text: 'Candidate', style: TextStyle(color: Color(0xFF6D28D9))),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text('Find your next opportunity and track your applications.', style: TextStyle(color: Color(0xFF475569))),
                    ],
                  ),
                ),
                // Illustration placeholder
                const Icon(Icons.work_outline, size: 80, color: Color(0xFFC4B5FD)),
              ],
            ),
          ),
          
          const SizedBox(height: 32),
          
          // Stats Row
          Row(
            children: [
              Expanded(child: _StatCard(icon: Icons.description_outlined, iconColor: const Color(0xFF8B5CF6), iconBg: const Color(0xFFF5F3FF), title: 'Applications', count: apps.length.toString(), subtitle: 'Total applied')),
              const SizedBox(width: 16),
              Expanded(child: _StatCard(icon: Icons.access_time, iconColor: const Color(0xFF3B82F6), iconBg: const Color(0xFFEFF6FF), title: 'Under Review', count: underReview.toString(), subtitle: 'In progress')),
              const SizedBox(width: 16),
              Expanded(child: _StatCard(icon: Icons.calendar_today, iconColor: const Color(0xFF10B981), iconBg: const Color(0xFFECFDF5), title: 'Interviews', count: interviews.toString(), subtitle: 'Scheduled')),
              const SizedBox(width: 16),
              Expanded(child: _StatCard(icon: Icons.bookmark_outline, iconColor: const Color(0xFFF59E0B), iconBg: const Color(0xFFFFFBEB), title: 'Saved Jobs', count: savedJobsCount.toString(), subtitle: 'Jobs saved')),
            ],
          ),
          
          const SizedBox(height: 32),
          
          // Bottom Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Application Activity
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey.withOpacity(0.1))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.auto_awesome, color: Color(0xFF6D28D9)),
                              SizedBox(width: 8),
                              Text('Application Activity', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          TextButton(onPressed: () => context.go('/candidate/jobs'), child: const Text('View all', style: TextStyle(color: Color(0xFF6D28D9)))),
                        ],
                      ),
                      const SizedBox(height: 24),
                      if (apps.isEmpty)
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 32),
                          child: Center(child: Text('No application activity yet.', style: TextStyle(color: Colors.grey))),
                        )
                      else
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: apps.length > 3 ? 3 : apps.length,
                          itemBuilder: (context, index) {
                            final app = apps[index];
                            Color statusColor = const Color(0xFF10B981);
                            IconData statusIcon = Icons.check_circle;
                            if (app.status == 'Under Review') {
                              statusColor = const Color(0xFF3B82F6);
                              statusIcon = Icons.access_time;
                            } else if (app.status == 'Interview') {
                              statusColor = const Color(0xFF8B5CF6);
                              statusIcon = Icons.calendar_today;
                            }
                            
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 24.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(color: statusColor, shape: BoxShape.circle),
                                    child: Icon(statusIcon, color: Colors.white, size: 20),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(app.status, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                        const SizedBox(height: 4),
                                        Text('${app.jobTitle} at ${app.location}', style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                                      ],
                                    ),
                                  ),
                                  Text(app.createdAt.split('T').first, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                                ],
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 32),
              
              // Profile Strength
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey.withOpacity(0.1))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.track_changes, color: Color(0xFF6D28D9)),
                              SizedBox(width: 8),
                              Text('Profile Strength', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Text(isProfileComplete ? '100%' : '50%', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF6D28D9))),
                        ],
                      ),
                      const SizedBox(height: 24),
                      LinearProgressIndicator(
                        value: isProfileComplete ? 1.0 : 0.5,
                        backgroundColor: const Color(0xFFF1F5F9),
                        valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF8B5CF6)),
                        minHeight: 8,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      const SizedBox(height: 16),
                      Text(isProfileComplete ? 'Great job! Your profile looks strong.' : 'Complete your profile to stand out to recruiters.', style: TextStyle(color: Colors.grey[600])),
                      const SizedBox(height: 24),
                      if (!isProfileComplete)
                        TextButton(
                          onPressed: () => context.go('/candidate/profile'),
                          style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: const Size(0, 0), tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Complete profile', style: TextStyle(color: Color(0xFF6D28D9), fontWeight: FontWeight.bold)),
                              SizedBox(width: 4),
                              Icon(Icons.arrow_forward, size: 16, color: Color(0xFF6D28D9)),
                            ],
                          ),
                        )
                      else
                        TextButton(
                          onPressed: () => context.go('/candidate/view_profile'),
                          style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: const Size(0, 0), tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('View profile', style: TextStyle(color: Color(0xFF6D28D9), fontWeight: FontWeight.bold)),
                              SizedBox(width: 4),
                              Icon(Icons.arrow_forward, size: 16, color: Color(0xFF6D28D9)),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRecruiterDashboard(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(recruiterStatsProvider);
    final user = ref.watch(authProvider).valueOrNull;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F3FF),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFEDE9FE)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(color: Color(0xFF6D28D9), shape: BoxShape.circle),
                  child: const Text('👋', style: TextStyle(fontSize: 32)),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(fontSize: 24, color: Color(0xFF1E293B), fontWeight: FontWeight.w600),
                          children: [
                            const TextSpan(text: 'Welcome back, '),
                            TextSpan(text: user?.name.isNotEmpty == true ? user!.name : 'Recruiter', style: const TextStyle(color: Color(0xFF6D28D9))),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text('Here is what is happening with your job postings today.', style: TextStyle(color: Color(0xFF475569))),
                    ],
                  ),
                ),
                const Icon(Icons.analytics_outlined, size: 80, color: Color(0xFFC4B5FD)),
              ],
            ),
          ),
          
          const SizedBox(height: 32),
          
          // Stats Row
          statsAsync.when(
            data: (stats) => Row(
              children: [
                Expanded(
                  child: _StatCard(
                    icon: Icons.work_outline,
                    iconColor: const Color(0xFF8B5CF6),
                    iconBg: const Color(0xFFF5F3FF),
                    title: 'Total Jobs',
                    count: '${stats.totalJobs}',
                    subtitle: 'Created so far',
                    onTap: () => context.go('/recruiter/jobs?tab=All'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _StatCard(
                    icon: Icons.publish,
                    iconColor: const Color(0xFF10B981),
                    iconBg: const Color(0xFFECFDF5),
                    title: 'Active Postings',
                    count: '${stats.activePostings}',
                    subtitle: 'Currently published',
                    onTap: () => context.go('/recruiter/jobs?tab=Published'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _StatCard(
                    icon: Icons.people_outline,
                    iconColor: const Color(0xFF3B82F6),
                    iconBg: const Color(0xFFEFF6FF),
                    title: 'Total Applications',
                    count: '${stats.totalApplications}',
                    subtitle: 'Across all jobs',
                    onTap: () => context.go('/recruiter/applications'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _StatCard(
                    icon: Icons.fiber_new_outlined,
                    iconColor: const Color(0xFFF59E0B),
                    iconBg: const Color(0xFFFFFBEB),
                    title: 'New Candidates',
                    count: '${stats.newCandidates}',
                    subtitle: 'This week',
                    onTap: () => context.go('/recruiter/applications?tab=new'),
                  ),
                ),
              ],
            ),
            loading: () => const Center(child: Padding(padding: EdgeInsets.all(32), child: CircularProgressIndicator())),
            error: (e, _) => Center(child: Text('Error loading stats: $e')),
          ),
          
          const SizedBox(height: 32),
          
          // Recent Activity Area
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey.withOpacity(0.1))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.history, color: Color(0xFF6D28D9)),
                        SizedBox(width: 8),
                        Text('Recent Activity', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    TextButton(onPressed: () => context.go('/recruiter/jobs'), child: const Text('View all jobs', style: TextStyle(color: Color(0xFF6D28D9)))),
                  ],
                ),
                const SizedBox(height: 24),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Column(
                      children: [
                        const Text('Check your job postings for recent applications and status changes.', style: TextStyle(color: Colors.grey)),
                        const SizedBox(height: 16),
                        OutlinedButton.icon(
                          onPressed: () => context.go('/recruiter/jobs'),
                          icon: const Icon(Icons.work_outline, size: 16),
                          label: const Text('Go to My JDs'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final String title;
  final String count;
  final String subtitle;
  final VoidCallback? onTap;

  const _StatCard({
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.title,
    required this.count,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.withOpacity(0.1))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle), child: Icon(icon, color: iconColor, size: 24)),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: const TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500)),
                      Text(count, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 16),
            Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
