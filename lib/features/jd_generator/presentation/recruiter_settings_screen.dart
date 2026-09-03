import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../auth/presentation/auth_provider.dart';

class RecruiterSettingsScreen extends ConsumerStatefulWidget {
  const RecruiterSettingsScreen({super.key});

  @override
  ConsumerState<RecruiterSettingsScreen> createState() => _RecruiterSettingsScreenState();
}

class _RecruiterSettingsScreenState extends ConsumerState<RecruiterSettingsScreen> {
  String _selectedTab = 'Account';

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authProvider).valueOrNull;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Settings', style: TextStyle(color: Color(0xFF1E293B), fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text('Manage your account preferences and company settings.', style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.notifications_none, color: Colors.grey), onPressed: () {}),
          const SizedBox(width: 16),
          const CircleAvatar(radius: 16, backgroundColor: Color(0xFF6D28D9), child: Icon(Icons.person, size: 20, color: Colors.white)),
          const SizedBox(width: 24),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Navigation
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _SettingsNavItem(icon: Icons.person_outline, label: 'Account', isSelected: _selectedTab == 'Account', onTap: () => setState(() => _selectedTab = 'Account')),
                  _SettingsNavItem(icon: Icons.business, label: 'Company Profile', isSelected: _selectedTab == 'Company Profile', onTap: () => setState(() => _selectedTab = 'Company Profile')),
                  _SettingsNavItem(icon: Icons.notifications_none, label: 'Notifications', isSelected: _selectedTab == 'Notifications', onTap: () => setState(() => _selectedTab = 'Notifications')),
                  _SettingsNavItem(icon: Icons.lock_outline, label: 'Privacy', isSelected: _selectedTab == 'Privacy', onTap: () => setState(() => _selectedTab = 'Privacy')),
                  _SettingsNavItem(icon: Icons.group_add_outlined, label: 'Team Members', isSelected: _selectedTab == 'Team Members', onTap: () => setState(() => _selectedTab = 'Team Members')),
                  _SettingsNavItem(icon: Icons.vpn_key_outlined, label: 'Change Password', isSelected: _selectedTab == 'Change Password', onTap: () => setState(() => _selectedTab = 'Change Password')),
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 16),
                  _SettingsNavItem(icon: Icons.warning_amber_rounded, label: 'Danger Zone', isSelected: _selectedTab == 'Danger Zone', onTap: () => setState(() => _selectedTab = 'Danger Zone'), isDanger: true),
                ],
              ),
            ),
            
            const SizedBox(width: 48),
            
            // Right Content Area
            Expanded(
              flex: 5,
              child: SingleChildScrollView(
                child: Builder(
                  builder: (context) {
                    if (_selectedTab != 'Account') {
                      return Center(child: Text('$_selectedTab settings coming soon!', style: const TextStyle(fontSize: 18, color: Colors.grey)));
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Account Information', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
                                SizedBox(height: 4),
                                Text('Update your personal and contact information.', style: TextStyle(color: Colors.grey, fontSize: 13)),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF6D28D9), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                              child: const Text('Edit'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        
                        // Profile Card
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey.withOpacity(0.1))),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: const Color(0xFFE0E7FF),
                                child: Text(user?.name.isNotEmpty == true ? user!.name[0].toUpperCase() : 'R', style: const TextStyle(fontSize: 32, color: Color(0xFF4F46E5), fontWeight: FontWeight.bold)),
                              ),
                              const SizedBox(width: 32),
                              Expanded(
                                child: Column(
                                  children: [
                                    _InfoRow(label: 'Full Name', value: user?.name ?? 'Not provided'),
                                    const SizedBox(height: 16),
                                    _InfoRow(label: 'Email', value: user?.email ?? 'Not provided'),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    _InfoRow(label: 'Phone', value: user?.mobileNumber ?? 'Not provided'),
                                    const SizedBox(height: 16),
                                    _InfoRow(label: 'Role', value: 'Recruiter'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 40),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Company Profile', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
                                SizedBox(height: 4),
                                Text('Manage how your company appears to candidates.', style: TextStyle(color: Colors.grey, fontSize: 13)),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF6D28D9), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                              child: const Text('Edit'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey.withOpacity(0.1))),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _InfoRow(label: 'Company Name', value: 'Awesome Tech Inc.', vertical: true),
                                    SizedBox(height: 24),
                                    _InfoRow(label: 'Website', value: 'https://awesometech.com', vertical: true),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _InfoRow(label: 'Industry', value: 'Software & Technology', vertical: true),
                                    const SizedBox(height: 24),
                                    _InfoRow(label: 'Team Size', value: '50-200 employees', vertical: true),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isDanger;

  const _SettingsNavItem({required this.icon, required this.label, required this.isSelected, required this.onTap, this.isDanger = false});

  @override
  Widget build(BuildContext context) {
    final color = isDanger ? Colors.red : (isSelected ? const Color(0xFF6D28D9) : Colors.grey[700]);
    final bgColor = isSelected ? const Color(0xFFF5F3FF) : Colors.transparent;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: const EdgeInsets.only(bottom: 4),
        decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 16),
            Text(label, style: TextStyle(color: color, fontWeight: isSelected ? FontWeight.bold : FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final bool vertical;

  const _InfoRow({required this.label, required this.value, this.vertical = false});

  @override
  Widget build(BuildContext context) {
    if (vertical) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(color: Color(0xFF1E293B), fontWeight: FontWeight.w500)),
        ],
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 100, child: Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13))),
        Expanded(child: Text(value, style: const TextStyle(color: Color(0xFF1E293B), fontWeight: FontWeight.w500))),
      ],
    );
  }
}
