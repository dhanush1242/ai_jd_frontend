import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../auth/presentation/auth_provider.dart';
import 'jd_provider.dart';
import '../../candidate/presentation/candidate_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authProvider).valueOrNull;
    final isCandidate = user?.role == 'candidate';

    return Scaffold(
      appBar: AppBar(
        title: Text(isCandidate ? 'Candidate Dashboard' : 'Recruiter Dashboard', style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF6200EA),
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              ref.read(authProvider.notifier).logout();
            },
          ),
        ],
      ),
      floatingActionButton: isCandidate ? null : FloatingActionButton.extended(
        onPressed: () {
          context.push('/jd/create');
        },
        backgroundColor: const Color(0xFF00E5FF),
        foregroundColor: Colors.black87,
        icon: const Icon(Icons.add),
        label: const Text('Generate New JD', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: isCandidate ? _buildCandidateBody() : _buildRecruiterBody(),
    );
  }

  Widget _buildCandidateBody() {
    final isProfileComplete = ref.watch(profileCompletedProvider);

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Premium Welcome Header
              Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF6200EA), Color(0xFF00E5FF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF6200EA).withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const CircleAvatar(
                        radius: 46,
                        backgroundColor: Color(0xFF1F2937),
                        foregroundColor: Colors.white,
                        child: Icon(Icons.person, size: 48),
                      ),
                    ),
                    const SizedBox(width: 32),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Welcome back, Candidate!',
                            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: -0.5),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  isProfileComplete ? Icons.check_circle : Icons.warning_amber_rounded,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  isProfileComplete ? 'Profile Status: 100% Complete' : 'Profile Status: Incomplete',
                                  style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              
              // Action Buttons
              Row(
                children: [
                  if (!isProfileComplete)
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => context.push('/candidate/profile'),
                        icon: const Icon(Icons.edit_document),
                        label: const Text('Complete Your Profile to Apply'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  else ...[
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                        label: const Text('Search & Apply for Jobs'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00E5FF),
                          foregroundColor: const Color(0xFF1F2937),
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => context.push('/candidate/profile'),
                        icon: const Icon(Icons.edit),
                        label: const Text('Edit Profile'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF6200EA),
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          side: const BorderSide(color: Color(0xFF6200EA), width: 2),
                          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 48),
              
              // Applications Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Recent Applications', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1F2937))),
                  TextButton(onPressed: () {}, child: const Text('View All', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                ],
              ),
              const SizedBox(height: 24),
              
              if (!isProfileComplete)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(48.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: const Color(0xFFE5E7EB)),
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.lock_outline, size: 64, color: Colors.grey.shade400),
                      const SizedBox(height: 16),
                      const Text(
                        'Unlock Job Applications',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF374151)),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Complete your profile to start tracking your job applications here.',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ],
                  ),
                )
              else ...[
                _ApplicationCard(jobTitle: 'Flutter Developer', company: 'TechCorp', status: 'Under Review', statusColor: Colors.blue),
                _ApplicationCard(jobTitle: 'Senior Frontend Engineer', company: 'Innovate AI', status: 'Applied', statusColor: Colors.orange),
                _ApplicationCard(jobTitle: 'Mobile App Developer', company: 'Startup Inc', status: 'Interviewing', statusColor: Colors.green),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecruiterBody() {
    final historyAsync = ref.watch(jdHistoryProvider);

    return historyAsync.when(
      data: (jds) {
        return Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Recruiter Analytics', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF1F2937))),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(child: _StatCard(title: 'Total JDs Generated', value: '${jds.length}', icon: Icons.description)),
                      const SizedBox(width: 16),
                      Expanded(child: _StatCard(title: 'Total Applicants', value: '${jds.length * 12}', icon: Icons.people)),
                      const SizedBox(width: 16),
                      const Expanded(child: _StatCard(title: 'Active Jobs', value: '3', icon: Icons.work_outline)),
                    ],
                  ),
                  const SizedBox(height: 48),
                  const Text('Generated Job Descriptions', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1F2937))),
                  const SizedBox(height: 24),
                  if (jds.isEmpty)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(48.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: const Color(0xFFE5E7EB)),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.description_outlined, size: 64, color: Colors.grey.shade300),
                          const SizedBox(height: 16),
                          const Text('No Job Descriptions generated yet.', style: TextStyle(color: Colors.grey, fontSize: 18)),
                        ],
                      ),
                    )
                  else
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: jds.length,
                      itemBuilder: (context, index) {
                        final jd = jds[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 4)),
                            ],
                            border: Border.all(color: Colors.grey.withOpacity(0.1)),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(16),
                              onTap: () {},
                              hoverColor: Colors.grey.withOpacity(0.02),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(color: const Color(0xFFF3F4F6), borderRadius: BorderRadius.circular(12)),
                                      child: const Icon(Icons.description, color: Color(0xFF6200EA), size: 28),
                                    ),
                                    const SizedBox(width: 24),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(jd.jobTitle, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF1F2937))),
                                          const SizedBox(height: 6),
                                          Row(
                                            children: [
                                              const Icon(Icons.location_on, size: 16, color: Colors.grey),
                                              const SizedBox(width: 4),
                                              Text(jd.generatedContent.location, style: const TextStyle(color: Colors.grey, fontSize: 14)),
                                              const SizedBox(width: 16),
                                              const Icon(Icons.work, size: 16, color: Colors.grey),
                                              const SizedBox(width: 4),
                                              Text(jd.generatedContent.workMode, style: const TextStyle(color: Colors.grey, fontSize: 14)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Icon(Icons.chevron_right, color: Colors.grey),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Failed to load history: $err')),
    );
  }
}

class _ApplicationCard extends StatelessWidget {
  final String jobTitle;
  final String company;
  final String status;
  final Color statusColor;

  const _ApplicationCard({required this.jobTitle, required this.company, required this.status, required this.statusColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {},
          hoverColor: Colors.grey.withOpacity(0.02),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F4F6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.work_outline, color: Color(0xFF6200EA), size: 28),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(jobTitle, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF1F2937))),
                      const SizedBox(height: 4),
                      Text(company, style: const TextStyle(color: Colors.grey, fontSize: 15)),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: statusColor.withOpacity(0.2)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: statusColor),
                      ),
                      const SizedBox(width: 8),
                      Text(status, style: TextStyle(color: statusColor, fontWeight: FontWeight.bold, fontSize: 14)),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                const Icon(Icons.chevron_right, color: Colors.grey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _StatCard({required this.title, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.white, Color(0xFFF9FAFB)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF6200EA).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 36, color: const Color(0xFF6200EA)),
            ),
            const SizedBox(height: 24),
            Text(value, style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Color(0xFF1F2937), letterSpacing: -1)),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 15, color: Color(0xFF6B7280), fontWeight: FontWeight.w600), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
