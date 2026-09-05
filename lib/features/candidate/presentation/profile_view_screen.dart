import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'candidate_provider.dart';
import '../../auth/presentation/auth_provider.dart';
import '../../../core/widgets/logout_button.dart';

class ProfileViewScreen extends ConsumerWidget {
  const ProfileViewScreen({super.key});

  String? _getFullUrl(String? path) {
    if (path == null) return null;
    if (path.startsWith('http')) return path;
    return 'http://127.0.0.1:8000/$path';
  }

  Future<void> _launchUrl(String? urlString) async {
    final fullUrl = _getFullUrl(urlString);
    if (fullUrl == null) return;
    final uri = Uri.parse(fullUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailsAsync = ref.watch(candidateDetailsProvider);
    final user = ref.watch(authProvider).valueOrNull;
    final isProfileComplete = ref.watch(profileCompletedProvider).valueOrNull ?? false;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC), // Light gray background
      appBar: AppBar(
        title: const Text('My Profile Details', style: TextStyle(color: Colors.white, fontSize: 16)),
        backgroundColor: const Color(0xFF1E1B4B), // Dark theme app bar
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            tooltip: 'Refresh Profile',
            onPressed: () {
              ref.invalidate(candidateDetailsProvider);
              ref.invalidate(profileCompletedProvider);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Profile refreshed!'), duration: Duration(seconds: 1)),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: OutlinedButton.icon(
              onPressed: () => context.push('/candidate/profile'),
              icon: const Icon(Icons.edit, size: 16, color: Colors.white),
              label: const Text('Edit Profile', style: TextStyle(color: Colors.white)),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.white.withOpacity(0.3)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          IconButton(icon: const Icon(Icons.notifications_none), onPressed: () {}),
          const SizedBox(width: 8),
          const CircleAvatar(radius: 16, backgroundColor: Colors.white24, child: Icon(Icons.person, size: 20, color: Colors.white)),
          const SizedBox(width: 8),
          const AppLogoutButton(color: Colors.white70),
          const SizedBox(width: 16),
        ],
      ),
      body: detailsAsync.when(
        data: (details) {
          if (details == null) {
            return const Center(child: Text('No details found. Please complete your profile.'));
          }

          final profilePicUrl = _getFullUrl(details.profilePicture);
          final skillsText = (details.skills != null && details.skills!.isNotEmpty) 
              ? details.skills!.split(',').first.trim() 
              : 'Software Developer';
              
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- Top Header Card ---
                Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF1E1B4B), Color(0xFF4C1D95)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      // Avatar
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white.withOpacity(0.2), width: 2),
                        ),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: const Color(0xFF312E81),
                          backgroundImage: profilePicUrl != null ? NetworkImage(profilePicUrl) : null,
                          child: profilePicUrl == null ? const Icon(Icons.person, size: 50, color: Colors.white) : null,
                        ),
                      ),
                      const SizedBox(width: 24),
                      
                      // Name and details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(user?.name ?? 'Candidate', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
                            const SizedBox(height: 4),
                            Text(
                              '$skillsText / Professional',
                              style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 16),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                _ContactChip(icon: Icons.email_outlined, text: user?.email ?? 'N/A'),
                                const SizedBox(width: 12),
                                _ContactChip(icon: Icons.phone_outlined, text: user?.mobileNumber ?? 'N/A'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      
                      // Completeness & Action
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('Profile completeness', style: TextStyle(color: Colors.white)),
                              const SizedBox(width: 16),
                              Text(isProfileComplete ? '100%' : '50%', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24)),
                            ],
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: 200,
                            child: LinearProgressIndicator(
                              value: isProfileComplete ? 1.0 : 0.5,
                              backgroundColor: Colors.white.withOpacity(0.2),
                              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF8B5CF6)),
                              borderRadius: BorderRadius.circular(4),
                              minHeight: 8,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            isProfileComplete ? 'Great! Your profile is complete.' : 'Your profile is incomplete.',
                            style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 12),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton.icon(
                            onPressed: () => context.push('/candidate/profile'),
                            icon: const Icon(Icons.edit, size: 16),
                            label: const Text('Edit Profile'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF6D28D9),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // --- Two Column Layout ---
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // LEFT COLUMN (Main Details)
                    Expanded(
                      flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Professional Details Box
                          Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Colors.grey.withOpacity(0.1)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF5F3FF),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Icon(Icons.badge_rounded, color: Color(0xFF6D28D9), size: 24),
                                    ),
                                    const SizedBox(width: 12),
                                    const Text('Professional Details', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                const Text('Your professional information used for generating better job recommendations', style: TextStyle(color: Colors.grey)),
                                const SizedBox(height: 24),
                                
                                GridView.count(
                                  crossAxisCount: 2,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  childAspectRatio: 2.3,
                                  mainAxisSpacing: 16,
                                  crossAxisSpacing: 16,
                                  children: [
                                    _GridCard(
                                      icon: Icons.school_rounded,
                                      title: 'Education',
                                      value: details.educationQualification ?? 'Not provided',
                                      iconColor: const Color(0xFF4F46E5),
                                      bgColor: const Color(0xFFEEF2FF),
                                    ),
                                    _GridCard(
                                      icon: Icons.work_history_rounded,
                                      title: 'Experience',
                                      value: '${details.experience ?? 0} years',
                                      iconColor: const Color(0xFF0284C7),
                                      bgColor: const Color(0xFFE0F2FE),
                                    ),
                                    _GridCard(
                                      icon: Icons.laptop_chromebook_rounded,
                                      title: 'Work Mode',
                                      value: details.preferredWorkMode ?? 'Not provided',
                                      iconColor: const Color(0xFF0D9488),
                                      bgColor: const Color(0xFFCCFBF1),
                                    ),
                                    _GridCard(
                                      icon: Icons.cases_rounded,
                                      title: 'Job Type',
                                      value: details.preferredJobType ?? 'Not provided',
                                      iconColor: const Color(0xFFD97706),
                                      bgColor: const Color(0xFFFEF3C7),
                                    ),
                                    _GridCard(
                                      icon: Icons.psychology_rounded,
                                      title: 'Skills',
                                      value: details.skills ?? 'Not provided',
                                      iconColor: const Color(0xFF7C3AED),
                                      bgColor: const Color(0xFFF5F3FF),
                                    ),
                                    _GridCard(
                                      icon: Icons.location_on_rounded,
                                      title: 'Location',
                                      value: details.preferredWorkLocation ?? 'Not provided',
                                      iconColor: const Color(0xFFE11D48),
                                      bgColor: const Color(0xFFFFE4E6),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          
                          const SizedBox(height: 24),
                          
                          // Resume / CV Box
                          Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Colors.grey.withOpacity(0.1)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF5F3FF),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Icon(Icons.description_rounded, color: Color(0xFF6D28D9), size: 24),
                                    ),
                                    const SizedBox(width: 12),
                                    const Text('Resume / CV', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                const Text('Your latest resume used for better job matching', style: TextStyle(color: Colors.grey)),
                                const SizedBox(height: 24),
                                
                                if (details.resume != null)
                                  Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF8FAFC),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: Colors.grey.withOpacity(0.1)),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF6D28D9),
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: const Text('PDF', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Text('Resume / CV', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                              const SizedBox(height: 4),
                                              Text('Click to view or download', style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                                            ],
                                          ),
                                        ),
                                        OutlinedButton.icon(
                                          onPressed: () => _launchUrl(details.resume),
                                          icon: const Icon(Icons.remove_red_eye_outlined, size: 16),
                                          label: const Text('View'),
                                          style: OutlinedButton.styleFrom(
                                            foregroundColor: const Color(0xFF6D28D9),
                                            side: const BorderSide(color: Color(0xFF6D28D9)),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        ElevatedButton.icon(
                                          onPressed: () => _launchUrl(details.resume),
                                          icon: const Icon(Icons.download_outlined, size: 16),
                                          label: const Text('Download'),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: const Color(0xFF6D28D9),
                                            foregroundColor: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                else
                                  const Text('No resume attached.', style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(width: 24),
                    
                    // RIGHT COLUMN (Summary & Actions)
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Quick Summary Box
                          _SidebarCard(
                            title: 'Quick Summary',
                            icon: Icons.assessment_rounded,
                            child: Column(
                              children: [
                                _SummaryRow(
                                  icon: Icons.school_rounded,
                                  label: 'Education',
                                  value: details.educationQualification ?? 'N/A',
                                  iconColor: const Color(0xFF4F46E5),
                                  bgColor: const Color(0xFFEEF2FF),
                                ),
                                _SummaryRow(
                                  icon: Icons.work_history_rounded,
                                  label: 'Experience',
                                  value: '${details.experience ?? 0} years',
                                  iconColor: const Color(0xFF0284C7),
                                  bgColor: const Color(0xFFE0F2FE),
                                ),
                                _SummaryRow(
                                  icon: Icons.laptop_chromebook_rounded,
                                  label: 'Work Mode',
                                  value: details.preferredWorkMode ?? 'N/A',
                                  iconColor: const Color(0xFF0D9488),
                                  bgColor: const Color(0xFFCCFBF1),
                                ),
                                _SummaryRow(
                                  icon: Icons.cases_rounded,
                                  label: 'Job Type',
                                  value: details.preferredJobType ?? 'N/A',
                                  iconColor: const Color(0xFFD97706),
                                  bgColor: const Color(0xFFFEF3C7),
                                ),
                                _SummaryRow(
                                  icon: Icons.location_on_rounded,
                                  label: 'Location',
                                  value: details.preferredWorkLocation ?? 'N/A',
                                  iconColor: const Color(0xFFE11D48),
                                  bgColor: const Color(0xFFFFE4E6),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          
                          // Contact Box
                          _SidebarCard(
                            title: 'Contact',
                            icon: Icons.contact_mail_rounded,
                            child: Column(
                              children: [
                                _SummaryRow(
                                  icon: Icons.email_rounded,
                                  label: 'Email',
                                  value: user?.email ?? 'N/A',
                                  iconColor: const Color(0xFF6D28D9),
                                  bgColor: const Color(0xFFF5F3FF),
                                ),
                                _SummaryRow(
                                  icon: Icons.phone_rounded,
                                  label: 'Phone',
                                  value: user?.mobileNumber ?? 'N/A',
                                  iconColor: const Color(0xFF0D9488),
                                  bgColor: const Color(0xFFCCFBF1),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          
                          // Profile Actions Box
                          _SidebarCard(
                            title: 'Profile Actions',
                            icon: Icons.bolt_rounded,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton.icon(
                                    onPressed: () => context.push('/candidate/profile'),
                                    icon: const Icon(Icons.edit, size: 16),
                                    label: const Text('Edit Profile'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF6D28D9),
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(vertical: 16),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                SizedBox(
                                  width: double.infinity,
                                  child: OutlinedButton.icon(
                                    onPressed: () {
                                      if (details.resume != null) _launchUrl(details.resume);
                                    },
                                    icon: const Icon(Icons.download_outlined, size: 16),
                                    label: const Text('Download Resume'),
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor: const Color(0xFF6D28D9),
                                      side: const BorderSide(color: Color(0xFF6D28D9)),
                                      padding: const EdgeInsets.symmetric(vertical: 16),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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

class _ContactChip extends StatelessWidget {
  final IconData icon;
  final String text;

  const _ContactChip({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white70, size: 16),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 13)),
        ],
      ),
    );
  }
}

class _GridCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color iconColor;
  final Color bgColor;

  const _GridCard({
    required this.icon,
    required this.title,
    required this.value,
    this.iconColor = const Color(0xFF6D28D9),
    this.bgColor = const Color(0xFFF5F3FF),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: iconColor.withValues(alpha: 0.18), width: 1.5),
            ),
            child: Icon(icon, color: iconColor, size: 30),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title.toUpperCase(),
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.8,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color(0xFF1E293B),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SidebarCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;

  const _SidebarCard({required this.title, required this.icon, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F3FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: const Color(0xFF6D28D9), size: 20),
              ),
              const SizedBox(width: 12),
              Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 24),
          child,
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? iconColor;
  final Color? bgColor;

  const _SummaryRow({
    required this.icon,
    required this.label,
    required this.value,
    this.iconColor,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveColor = iconColor ?? const Color(0xFF6D28D9);
    final effectiveBg = bgColor ?? const Color(0xFFF5F3FF);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: effectiveBg,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 18, color: effectiveColor),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 84,
            child: Text(label, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF1E293B)),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}

