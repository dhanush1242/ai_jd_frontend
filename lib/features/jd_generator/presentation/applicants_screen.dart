import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'jd_provider.dart';
import '../data/jd_repository.dart';
import '../data/models/recruiter_models.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/widgets/logout_button.dart';

class ApplicantsScreen extends ConsumerStatefulWidget {
  final int jobId;
  final String? initialTab;
  
  const ApplicantsScreen({super.key, required this.jobId, this.initialTab});

  @override
  ConsumerState<ApplicantsScreen> createState() => _ApplicantsScreenState();
}

class _ApplicantsScreenState extends ConsumerState<ApplicantsScreen> {
  late String _selectedTab;

  @override
  void initState() {
    super.initState();
    if (widget.initialTab == 'new') {
      _selectedTab = 'Applied';
    } else {
      _selectedTab = widget.initialTab ?? 'All';
    }
  }

  bool _matchesStatus(String status, String tab) {
    final s = status.toLowerCase().trim();
    switch (tab) {
      case 'All':
        return true;
      case 'Applied':
        return s == 'applied';
      case 'Under Review':
        return s == 'under review' || s == 'under_review' || s == 'screening';
      case 'Shortlisted':
        return s == 'shortlisted';
      case 'Interview':
        return s == 'interview';
      case 'Offer':
        return s == 'offer';
      case 'Rejected':
        return s == 'rejected';
      default:
        return s == tab.toLowerCase();
    }
  }

  String _normalizeStatus(String status) {
    final s = status.toLowerCase().trim();
    if (s == 'applied') return 'Applied';
    if (s == 'under review' || s == 'under_review' || s == 'screening') return 'Under Review';
    if (s == 'shortlisted') return 'Shortlisted';
    if (s == 'interview') return 'Interview';
    if (s == 'offer') return 'Offer';
    if (s == 'rejected') return 'Rejected';
    return 'Applied';
  }

  Future<void> _updateStatus(int applicationId, String newStatus) async {
    try {
      await ref.read(jdRepositoryProvider).updateApplicationStatus(applicationId, newStatus);
      if (widget.jobId > 0) {
        ref.invalidate(recruiterApplicationsProvider(widget.jobId));
      }
      ref.invalidate(recruiterAllApplicationsProvider);
      ref.invalidate(recruiterStatsProvider);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Status updated to $newStatus')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to update status: $e')));
      }
    }
  }

  void _showNotesDialog(int applicationId, String candidateName) {
    showDialog(
      context: context,
      builder: (ctx) => _NotesDialog(
        applicationId: applicationId,
        candidateName: candidateName,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isAllApplications = widget.jobId <= 0;
    final applicationsAsync = isAllApplications
        ? ref.watch(recruiterAllApplicationsProvider)
        : ref.watch(recruiterApplicationsProvider(widget.jobId));

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/recruiter/jobs');
            }
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isAllApplications ? 'All Applications' : 'Applicants',
              style: const TextStyle(color: Color(0xFF1E293B), fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              isAllApplications
                  ? 'Review and manage candidates across all your job postings.'
                  : 'Review and manage candidates for this job.',
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.grey),
            tooltip: 'Refresh Applicants',
            onPressed: () {
              if (widget.jobId > 0) {
                ref.invalidate(recruiterApplicationsProvider(widget.jobId));
              }
              ref.invalidate(recruiterAllApplicationsProvider);
              ref.invalidate(recruiterStatsProvider);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Applicants refreshed!'), duration: Duration(seconds: 1)),
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
      body: applicationsAsync.when(
        data: (applications) {
          final counts = {
            'All': applications.length,
            'Applied': applications.where((a) => _matchesStatus(a.status, 'Applied')).length,
            'Under Review': applications.where((a) => _matchesStatus(a.status, 'Under Review')).length,
            'Shortlisted': applications.where((a) => _matchesStatus(a.status, 'Shortlisted')).length,
            'Interview': applications.where((a) => _matchesStatus(a.status, 'Interview')).length,
            'Offer': applications.where((a) => _matchesStatus(a.status, 'Offer')).length,
            'Rejected': applications.where((a) => _matchesStatus(a.status, 'Rejected')).length,
          };

          final filteredApps = _selectedTab == 'All' 
              ? applications 
              : applications.where((a) => _matchesStatus(a.status, _selectedTab)).toList();

          return Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: ['All', 'Applied', 'Under Review', 'Shortlisted', 'Interview', 'Offer', 'Rejected'].map((tab) {
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
                  ],
                ),
                
                const SizedBox(height: 24),
                
                Expanded(
                  child: filteredApps.isEmpty 
                      ? const Center(child: Text('No applicants found in this category.'))
                      : ListView.separated(
                          itemCount: filteredApps.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            final app = filteredApps[index];
                            
                            return Container(
                              padding: const EdgeInsets.all(24),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey.withOpacity(0.1)),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 24,
                                    backgroundColor: const Color(0xFFE0E7FF),
                                    child: Text(app.candidateName.isNotEmpty ? app.candidateName[0].toUpperCase() : 'C', style: const TextStyle(color: Color(0xFF4F46E5), fontWeight: FontWeight.bold, fontSize: 20)),
                                  ),
                                  const SizedBox(width: 20),
                                  
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                         Text(app.candidateName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            Text(app.candidateEmail, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                                            if (isAllApplications) ...[
                                              const SizedBox(width: 8),
                                              Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                                decoration: BoxDecoration(
                                                  color: const Color(0xFFF5F3FF),
                                                  borderRadius: BorderRadius.circular(6),
                                                  border: Border.all(color: const Color(0xFFDDD6FE)),
                                                ),
                                                child: Text('Job #${app.jobId}', style: const TextStyle(color: Color(0xFF6D28D9), fontSize: 11, fontWeight: FontWeight.bold)),
                                              ),
                                            ],
                                          ],
                                        ),
                                        const SizedBox(height: 12),
                                        Row(
                                          children: [
                                            const Icon(Icons.work_outline, size: 14, color: Colors.grey),
                                            const SizedBox(width: 4),
                                            Text(app.experience ?? 'N/A', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                                            const SizedBox(width: 16),
                                            const Icon(Icons.school_outlined, size: 14, color: Colors.grey),
                                            const SizedBox(width: 4),
                                            Text(app.educationQualification ?? 'N/A', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Text('Skills: ${app.skills ?? 'None listed'}', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                                      ],
                                    ),
                                  ),
                                  
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text('Applied ${app.createdAt.split('T').first}', style: TextStyle(color: Colors.grey[400], fontSize: 12)),
                                      const SizedBox(height: 16),
                                      Row(
                                        children: [
                                          OutlinedButton.icon(
                                            onPressed: () async {
                                              try {
                                                final resumeUrl = await ref.read(jdRepositoryProvider).getApplicationResume(app.applicationId);
                                                if (resumeUrl.isNotEmpty) {
                                                  final Uri url = Uri.parse(resumeUrl);
                                                  if (await canLaunchUrl(url)) {
                                                    await launchUrl(url);
                                                  } else {
                                                    if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Could not open resume.')));
                                                  }
                                                } else {
                                                  if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No resume available.')));
                                                }
                                              } catch (e) {
                                                if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
                                              }
                                            },
                                            icon: const Icon(Icons.description_outlined, size: 16),
                                            label: const Text('Resume'),
                                          ),
                                          const SizedBox(width: 8),
                                          OutlinedButton.icon(
                                            onPressed: () => _showNotesDialog(app.applicationId, app.candidateName),
                                            icon: const Icon(Icons.sticky_note_2_outlined, size: 16),
                                            label: const Text('Notes'),
                                          ),
                                          const SizedBox(width: 12),
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 12),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(4),
                                              border: Border.all(color: Colors.grey.withOpacity(0.3)),
                                            ),
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton<String>(
                                                value: _normalizeStatus(app.status),
                                                items: ['Applied', 'Under Review', 'Shortlisted', 'Interview', 'Offer', 'Rejected']
                                                    .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                                                    .toList(),
                                                onChanged: (newStatus) {
                                                  if (newStatus != null && newStatus != _normalizeStatus(app.status)) {
                                                    _updateStatus(app.applicationId, newStatus);
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
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

class _NotesDialog extends ConsumerStatefulWidget {
  final int applicationId;
  final String candidateName;

  const _NotesDialog({
    required this.applicationId,
    required this.candidateName,
  });

  @override
  ConsumerState<_NotesDialog> createState() => _NotesDialogState();
}

class _NotesDialogState extends ConsumerState<_NotesDialog> {
  final _noteController = TextEditingController();
  late Future<List<ApplicationNote>> _notesFuture;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  void _loadNotes() {
    _notesFuture = ref.read(jdRepositoryProvider).getApplicationNotes(widget.applicationId);
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _addNote() async {
    final text = _noteController.text.trim();
    if (text.isEmpty) return;

    setState(() => _isSubmitting = true);
    try {
      await ref.read(jdRepositoryProvider).addApplicationNote(widget.applicationId, text);
      _noteController.clear();
      setState(() {
        _loadNotes();
        _isSubmitting = false;
      });
    } catch (e) {
      setState(() => _isSubmitting = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to add note: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 520,
        height: 520,
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Application Notes',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Candidate: ${widget.candidateName}',
                        style: TextStyle(color: Colors.grey[600], fontSize: 13),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const Divider(height: 24),
            Expanded(
              child: FutureBuilder<List<ApplicationNote>>(
                future: _notesFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error loading notes: ${snapshot.error}'));
                  }
                  final notes = snapshot.data ?? [];
                  if (notes.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.notes_outlined, size: 48, color: Colors.grey[400]),
                          const SizedBox(height: 8),
                          Text('No notes added yet for this applicant.', style: TextStyle(color: Colors.grey[500])),
                        ],
                      ),
                    );
                  }

                  return ListView.separated(
                    itemCount: notes.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final note = notes[index];
                      final dateStr = note.createdAt.contains('T')
                          ? note.createdAt.split('T').first
                          : note.createdAt;
                      return Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8FAFC),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.withOpacity(0.15)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              note.note,
                              style: const TextStyle(fontSize: 14, color: Color(0xFF334155)),
                            ),
                            const SizedBox(height: 6),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                dateStr,
                                style: TextStyle(fontSize: 11, color: Colors.grey[500]),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const Divider(height: 24),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _noteController,
                    decoration: InputDecoration(
                      hintText: 'Add an internal note...',
                      hintStyle: const TextStyle(fontSize: 13),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    onSubmitted: (_) => _addNote(),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _isSubmitting ? null : _addNote,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6D28D9),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: _isSubmitting
                      ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                      : const Icon(Icons.send, size: 18),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
