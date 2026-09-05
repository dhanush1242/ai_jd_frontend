import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/auth/presentation/auth_provider.dart';
import '../core/widgets/logout_button.dart';

import '../features/chatbot/presentation/draggable_chatbot.dart';

class DashboardLayout extends ConsumerWidget {
  final Widget child;

  const DashboardLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).valueOrNull;
    final isCandidate = user?.role == 'candidate';

    final currentPath = GoRouterState.of(context).matchedLocation;

    return DraggableChatbot(
      child: Scaffold(
        body: Row(
          children: [
          // Sidebar
          Container(
            width: 260,
            color: const Color(0xFF1E1B4B), // Dark background matching the mockup
            child: Column(
              children: [
                // Logo Area
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    children: [
                      const Icon(Icons.change_history, color: Color(0xFF8B5CF6), size: 32),
                      const SizedBox(width: 12),
                      const Text(
                        'AI Job Generator',
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Navigation Links
                _NavItem(
                  icon: Icons.dashboard_outlined,
                  label: 'Dashboard',
                  isSelected: currentPath == '/home',
                  onTap: () => context.go('/home'),
                ),
                if (!isCandidate)
                  _NavItem(
                    icon: Icons.add_circle_outline,
                    label: 'Generate JD',
                    isSelected: currentPath == '/jd/create',
                    onTap: () => context.go('/jd/create'),
                  ),
                if (isCandidate)
                  _NavItem(
                    icon: Icons.search,
                    label: 'Explore Jobs',
                    isSelected: currentPath == '/candidate/explore',
                    onTap: () => context.go('/candidate/explore'),
                  ),
                if (isCandidate)
                  _NavItem(
                    icon: Icons.work_outline,
                    label: 'My Jobs',
                    isSelected: currentPath == '/candidate/jobs',
                    onTap: () => context.go('/candidate/jobs'),
                  ),
                if (isCandidate)
                  _NavItem(
                    icon: Icons.bookmark_outline,
                    label: 'Saved Jobs',
                    isSelected: currentPath == '/candidate/saved',
                    onTap: () => context.go('/candidate/saved'),
                  ),
                if (!isCandidate)
                  _NavItem(
                    icon: Icons.work_outline,
                    label: 'My JDs',
                    isSelected: currentPath == '/recruiter/jobs',
                    onTap: () => context.go('/recruiter/jobs'),
                  ),
                if (isCandidate)
                  _NavItem(
                    icon: Icons.person_outline,
                    label: 'My Profile',
                    isSelected: currentPath == '/candidate/view_profile' || currentPath == '/candidate/profile',
                    onTap: () => context.go('/candidate/view_profile'),
                  ),
                _NavItem(
                  icon: Icons.settings_outlined,
                  label: 'Settings',
                  isSelected: currentPath == (isCandidate ? '/settings' : '/recruiter/settings'),
                  onTap: () => context.go(isCandidate ? '/settings' : '/recruiter/settings'),
                ),
                _NavItem(
                  icon: Icons.logout_rounded,
                  label: 'Logout',
                  isSelected: false,
                  iconColor: Colors.redAccent.shade100,
                  textColor: Colors.redAccent.shade100,
                  onTap: () => confirmAndLogout(context, ref),
                ),
                
                const Spacer(),
                
                // User info card with quick logout
                if (user != null)
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.06),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white.withOpacity(0.1)),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: const Color(0xFF6D28D9),
                          child: Text(
                            user.name.isNotEmpty ? user.name[0].toUpperCase() : 'U',
                            style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                user.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                isCandidate ? 'Candidate' : 'Recruiter',
                                style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.logout_rounded, size: 18, color: Colors.redAccent),
                          tooltip: 'Logout',
                          onPressed: () => confirmAndLogout(context, ref),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                      ],
                    ),
                  ),
                
                // Need Help Card
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white.withOpacity(0.1)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.headset_mic_outlined, color: Colors.white70, size: 24),
                          const SizedBox(width: 12),
                          const Text('Need Help?', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text('Check our support center', style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 12)),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: BorderSide(color: Colors.white.withOpacity(0.2)),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          child: const Text('Contact Support'),
                        ),
                      ),
                    ],
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(bottom: 24.0, left: 24, right: 24),
                  child: Text(
                    '© 2024 AI Job Generator',
                    style: TextStyle(color: Colors.white.withOpacity(0.3), fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          
          // Main Content
          Expanded(
            child: child,
          ),
        ],
      ),
    ));
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? textColor;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF4C1D95) : Colors.transparent, // Purple if selected
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(icon, color: iconColor ?? (isSelected ? Colors.white : Colors.white.withOpacity(0.5)), size: 22),
              const SizedBox(width: 16),
              Text(
                label,
                style: TextStyle(
                  color: textColor ?? (isSelected ? Colors.white : Colors.white.withOpacity(0.7)),
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
