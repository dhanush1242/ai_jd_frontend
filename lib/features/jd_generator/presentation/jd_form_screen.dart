import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../data/models/jd_models.dart';
import 'jd_provider.dart';
import '../../../core/widgets/logout_button.dart';

class JdFormScreen extends ConsumerStatefulWidget {
  const JdFormScreen({super.key});

  @override
  ConsumerState<JdFormScreen> createState() => _JdFormScreenState();
}

class _JdFormScreenState extends ConsumerState<JdFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _skillsController = TextEditingController(); // Comma separated for now
  final _experienceController = TextEditingController();
  final _educationController = TextEditingController();
  final _salaryController = TextEditingController();
  final _locationController = TextEditingController();
  final _openingsController = TextEditingController();
  final _departmentController = TextEditingController();
  final _instructionsController = TextEditingController();

  String _workMode = 'HYBRID';
  String _jobType = 'FULL_TIME';

  @override
  void dispose() {
    _titleController.dispose();
    _skillsController.dispose();
    _experienceController.dispose();
    _educationController.dispose();
    _salaryController.dispose();
    _locationController.dispose();
    _openingsController.dispose();
    _departmentController.dispose();
    _instructionsController.dispose();
    super.dispose();
  }

  void _generate() {
    if (_formKey.currentState!.validate()) {
      final createParams = JobParameterCreate(
        jobTitle: _titleController.text,
        requiredSkills: _skillsController.text,
        experience: _experienceController.text,
        educationQualification: _educationController.text,
        package: _salaryController.text,
        workMode: _workMode,
        jobType: _jobType,
        location: _locationController.text,
        passedoutYear: int.tryParse(_openingsController.text),
      );

      ref.read(jdGeneratorProvider.notifier).generate(createParams);
    }
  }

  @override
  Widget build(BuildContext context) {
    final generatorState = ref.watch(jdGeneratorProvider);

    ref.listen(jdGeneratorProvider, (previous, next) {
      if (next is AsyncError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(next.error.toString()), backgroundColor: Colors.red));
      } else if (next is AsyncData && next.value != null) {
        context.push('/jd/result'); // Navigate to result
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate Job Description'),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF6200EA),
        actions: const [
          AppLogoutButton(),
          SizedBox(width: 16),
        ],
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
                      Text('Job Details', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: const Color(0xFF6200EA))),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _titleController,
                              decoration: const InputDecoration(labelText: 'Job Title *', prefixIcon: Icon(Icons.work_outline)),
                              validator: (v) => v!.isEmpty ? 'Required' : null,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              controller: _departmentController,
                              decoration: const InputDecoration(labelText: 'Department', prefixIcon: Icon(Icons.business)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _skillsController,
                        decoration: const InputDecoration(labelText: 'Skills (comma separated) *', prefixIcon: Icon(Icons.star_outline)),
                        validator: (v) => v!.isEmpty ? 'Required' : null,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _experienceController,
                              decoration: const InputDecoration(labelText: 'Experience Required *', prefixIcon: Icon(Icons.timeline)),
                              validator: (v) => v!.isEmpty ? 'Required' : null,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              controller: _educationController,
                              decoration: const InputDecoration(labelText: 'Education *', prefixIcon: Icon(Icons.school_outlined)),
                              validator: (v) => v!.isEmpty ? 'Required' : null,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _salaryController,
                              decoration: const InputDecoration(labelText: 'Salary Range *', prefixIcon: Icon(Icons.attach_money)),
                              validator: (v) => v!.isEmpty ? 'Required' : null,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              controller: _locationController,
                              decoration: const InputDecoration(labelText: 'Location *', prefixIcon: Icon(Icons.location_city)),
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
                              decoration: const InputDecoration(labelText: 'Work Mode *', prefixIcon: Icon(Icons.computer)),
                              items: ['REMOTE', 'HYBRID', 'ONSITE'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                              onChanged: (v) => setState(() => _workMode = v!),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: _jobType,
                              decoration: const InputDecoration(labelText: 'Job Type *', prefixIcon: Icon(Icons.access_time)),
                              items: ['FULL_TIME', 'PART_TIME', 'CONTRACT', 'INTERNSHIP', 'TEMPORARY'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                              onChanged: (v) => setState(() => _jobType = v!),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              controller: _openingsController,
                              decoration: const InputDecoration(labelText: 'Passed out year', prefixIcon: Icon(Icons.calendar_today)),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: generatorState.isLoading ? null : _generate,
                          icon: generatorState.isLoading
                              ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                              : const Icon(Icons.auto_awesome),
                          label: Text(generatorState.isLoading ? 'Generating JD...' : 'Generate Job Description'),
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
