import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:file_picker/file_picker.dart';
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

  String _workMode = 'ANY';
  String _jobType = 'ANY';

  PlatformFile? _profilePicture;
  PlatformFile? _resume;
  
  String? _existingProfilePic;
  String? _existingResume;

  @override
  void initState() {
    super.initState();
    // Delay to let riverpod initialize
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadDetails();
    });
  }

  Future<void> _loadDetails() async {
    final details = await ref.read(candidateDetailsProvider.future);
    if (details != null) {
      if (mounted) {
        setState(() {
          _skillsController.text = details.skills ?? '';
          _educationController.text = details.educationQualification ?? '';
          _locationController.text = details.preferredWorkLocation ?? '';
          _experienceController.text = details.experience ?? '';
          if (['ANY', 'REMOTE', 'HYBRID', 'ONSITE'].contains(details.preferredWorkMode)) {
            _workMode = details.preferredWorkMode!;
          }
          if (['ANY', 'FULL_TIME', 'PART_TIME', 'CONTRACT', 'INTERNSHIP', 'FREELANCE'].contains(details.preferredJobType)) {
            _jobType = details.preferredJobType!;
          }
          _existingProfilePic = details.profilePicture;
          _existingResume = details.resume;
        });
      }
    }
  }

  Future<void> _pickProfilePicture() async {
    final result = await FilePicker.pickFiles(type: FileType.image, withData: true);
    if (result != null) {
      setState(() {
        _profilePicture = result.files.first;
      });
    }
  }

  Future<void> _pickResume() async {
    final result = await FilePicker.pickFiles(type: FileType.custom, allowedExtensions: ['pdf'], withData: true);
    if (result != null) {
      setState(() {
        _resume = result.files.first;
      });
    }
  }

  @override
  void dispose() {
    _skillsController.dispose();
    _educationController.dispose();
    _locationController.dispose();
    _experienceController.dispose();
    super.dispose();
  }

  void _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      await ref.read(candidateControllerProvider.notifier).saveProfile(
        skills: _skillsController.text,
        education: _educationController.text,
        location: _locationController.text,
        experience: _experienceController.text,
        workMode: _workMode,
        jobType: _jobType,
        profilePicture: _profilePicture,
        resume: _resume,
      );
      
      // Refresh details
      ref.invalidate(candidateDetailsProvider);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile saved successfully!'), backgroundColor: Colors.green),
        );
        context.pop();
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
                              label: _profilePicture != null 
                                  ? _profilePicture!.name 
                                  : (_existingProfilePic != null ? 'Profile Photo Attached' : 'Upload Profile Photo'),
                              onPressed: _pickProfilePicture,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _UploadButton(
                              icon: Icons.upload_file,
                              label: _resume != null 
                                  ? _resume!.name 
                                  : (_existingResume != null ? 'Resume Attached' : 'Upload Resume (PDF)'),
                              onPressed: _pickResume,
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
                              items: ['ANY', 'REMOTE', 'HYBRID', 'ONSITE'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                              onChanged: (v) => setState(() => _workMode = v!),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: _jobType,
                              decoration: const InputDecoration(labelText: 'Job Type *', prefixIcon: Icon(Icons.access_time)),
                              items: ['ANY', 'FULL_TIME', 'PART_TIME', 'CONTRACT', 'INTERNSHIP', 'FREELANCE'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                              onChanged: (v) => setState(() => _jobType = v!),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: Consumer(
                          builder: (context, ref, child) {
                            final state = ref.watch(candidateControllerProvider);
                            return ElevatedButton.icon(
                              onPressed: state.isLoading ? null : _saveProfile,
                              icon: state.isLoading 
                                  ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                                  : const Icon(Icons.save),
                              label: Text(state.isLoading ? 'Saving...' : 'Save Profile'),
                            );
                          }
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
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF374151)), overflow: TextOverflow.ellipsis, maxLines: 1),
          ],
        ),
      ),
    );
  }
}
