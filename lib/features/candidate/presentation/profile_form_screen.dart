import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'candidate_provider.dart';

class ProfileFormScreen extends ConsumerStatefulWidget {
  const ProfileFormScreen({super.key});

  @override
  ConsumerState<ProfileFormScreen> createState() => _ProfileFormScreenState();
}

class _ProfileFormScreenState extends ConsumerState<ProfileFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final _skillsController = TextEditingController();
  final _educationController = TextEditingController();
  final _locationController = TextEditingController();
  final _experienceController = TextEditingController();

  String _workMode = 'HYBRID';
  String _jobType = 'FULL_TIME';

  @override
  void dispose() {
    _skillsController.dispose();
    _educationController.dispose();
    _locationController.dispose();
    _experienceController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile saved successfully! (Mocked)'), backgroundColor: Colors.green),
      );
      ref.read(profileCompletedProvider.notifier).state = true;
      if (context.canPop()) {
        context.pop();
      } else {
        context.go('/home');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complete Your Profile'),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF6200EA),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Candidate Profile', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: const Color(0xFF6200EA))),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: _UploadButton(
                              icon: Icons.person_outline,
                              label: 'Upload Profile Photo',
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _UploadButton(
                              icon: Icons.upload_file,
                              label: 'Upload Resume (PDF)',
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      TextFormField(
                        controller: _skillsController,
                        decoration: const InputDecoration(labelText: 'Skills (comma separated) *', prefixIcon: Icon(Icons.star_outline)),
                        validator: (v) => v!.isEmpty ? 'Required' : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _educationController,
                        decoration: const InputDecoration(labelText: 'Highest Education *', prefixIcon: Icon(Icons.school_outlined)),
                        validator: (v) => v!.isEmpty ? 'Required' : null,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _locationController,
                              decoration: const InputDecoration(labelText: 'Preferred Work Location *', prefixIcon: Icon(Icons.location_city)),
                              validator: (v) => v!.isEmpty ? 'Required' : null,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              controller: _experienceController,
                              decoration: const InputDecoration(labelText: 'Years of Experience *', prefixIcon: Icon(Icons.timeline)),
                              keyboardType: TextInputType.number,
                              validator: (v) => v!.isEmpty ? 'Required' : null,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: _workMode,
                              decoration: const InputDecoration(labelText: 'Interested Work Mode *', prefixIcon: Icon(Icons.computer)),
                              items: ['REMOTE', 'HYBRID', 'ONSITE'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                              onChanged: (v) => setState(() => _workMode = v!),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: _jobType,
                              decoration: const InputDecoration(labelText: 'Job Type *', prefixIcon: Icon(Icons.access_time)),
                              items: ['FULL_TIME', 'PART_TIME', 'CONTRACT', 'INTERNSHIP', 'FREELANCE'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                              onChanged: (v) => setState(() => _jobType = v!),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: _saveProfile,
                          icon: const Icon(Icons.save),
                          label: const Text('Save Profile'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _UploadButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _UploadButton({required this.icon, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFD1D5DB)),
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xFFF9FAFB),
        ),
        child: Column(
          children: [
            Icon(icon, size: 40, color: const Color(0xFF6200EA)),
            const SizedBox(height: 12),
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF374151))),
          ],
        ),
      ),
    );
  }
}
