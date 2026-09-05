import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../../data/models/candidate_models.dart';

class JobDetailsDialog extends StatefulWidget {
  final CandidateJob job;
  final bool isBookmarked;
  final bool isApplied;
  final Future<void> Function()? onBookmarkToggle;
  final Future<void> Function()? onApply;

  const JobDetailsDialog({
    super.key,
    required this.job,
    this.isBookmarked = false,
    this.isApplied = false,
    this.onBookmarkToggle,
    this.onApply,
  });

  @override
  State<JobDetailsDialog> createState() => _JobDetailsDialogState();
}

class _JobDetailsDialogState extends State<JobDetailsDialog> {
  late bool _bookmarked;
  bool _isBookmarkLoading = false;
  bool _isApplyLoading = false;

  @override
  void initState() {
    super.initState();
    _bookmarked = widget.isBookmarked;
  }

  Future<void> _handleBookmark() async {
    if (widget.onBookmarkToggle == null || _isBookmarkLoading) return;
    setState(() => _isBookmarkLoading = true);
    try {
      await widget.onBookmarkToggle!();
      if (mounted) {
        setState(() {
          _bookmarked = !_bookmarked;
        });
      }
    } finally {
      if (mounted) {
        setState(() => _isBookmarkLoading = false);
      }
    }
  }

  Future<void> _handleApply() async {
    if (widget.onApply == null || _isApplyLoading || widget.isApplied) return;
    setState(() => _isApplyLoading = true);
    try {
      await widget.onApply!();
      if (mounted) {
        Navigator.of(context).pop(true);
      }
    } finally {
      if (mounted) {
        setState(() => _isApplyLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final job = widget.job;
    final hasMarkdown = job.jobDescription != null && job.jobDescription!.trim().isNotEmpty;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 8,
      child: Container(
        width: 800,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.88,
          maxWidth: 820,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Section
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 24, 20, 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Company Icon Avatar
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    child: Center(
                      child: Text(
                        job.jobTitle.isNotEmpty ? job.jobTitle[0].toUpperCase() : 'J',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF475569),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          job.jobTitle,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E293B),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 6,
                          children: [
                            _HeaderTag(text: job.location, icon: Icons.location_on_outlined),
                            _HeaderTag(text: job.workMode, icon: Icons.business_outlined),
                            _HeaderTag(text: job.jobType, icon: Icons.schedule_outlined),
                            if (job.package != null && job.package!.isNotEmpty)
                              _HeaderTag(text: job.package!, icon: Icons.payments_outlined),
                            if (job.experience.isNotEmpty)
                              _HeaderTag(text: 'Exp: ${job.experience}', icon: Icons.work_history_outlined),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.grey),
                    tooltip: 'Close',
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: Color(0xFFE2E8F0)),

            // Scrollable Job Description Body
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (hasMarkdown) ...[
                      MarkdownBody(
                        data: job.jobDescription!,
                        selectable: true,
                        styleSheet: MarkdownStyleSheet(
                          h1: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E293B),
                            height: 1.4,
                          ),
                          h2: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E293B),
                            height: 1.4,
                          ),
                          h3: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF334155),
                            height: 1.4,
                          ),
                          p: const TextStyle(
                            fontSize: 15,
                            color: Color(0xFF475569),
                            height: 1.6,
                          ),
                          listBullet: const TextStyle(
                            fontSize: 15,
                            color: Color(0xFF6D28D9),
                          ),
                          strong: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E293B),
                          ),
                          blockSpacing: 14,
                        ),
                      ),
                    ] else ...[
                      // Fallback when no generated markdown text is found
                      _buildSection('Required Skills', job.requiredSkills),
                      _buildSection('Educational Qualification', job.educationQualification),
                      _buildSection('Experience Required', job.experience),
                      _buildSection('Location', job.location),
                      _buildSection('Work Mode', job.workMode),
                      _buildSection('Job Type', job.jobType),
                      if (job.package != null) _buildSection('Compensation', job.package!),
                    ],
                  ],
                ),
              ),
            ),

            const Divider(height: 1, color: Color(0xFFE2E8F0)),

            // Footer Actions
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
              color: const Color(0xFFF8FAFC),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Bookmark Button
                  if (widget.onBookmarkToggle != null)
                    OutlinedButton.icon(
                      onPressed: _isBookmarkLoading ? null : _handleBookmark,
                      icon: _isBookmarkLoading
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Icon(
                              _bookmarked ? Icons.bookmark : Icons.bookmark_border,
                              color: _bookmarked ? const Color(0xFFF59E0B) : const Color(0xFF6D28D9),
                              size: 18,
                            ),
                      label: Text(
                        _bookmarked ? 'Saved' : 'Save Job',
                        style: TextStyle(
                          color: _bookmarked ? const Color(0xFFF59E0B) : const Color(0xFF6D28D9),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: _bookmarked ? const Color(0xFFF59E0B) : const Color(0xFF6D28D9),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    )
                  else
                    const SizedBox.shrink(),

                  // Right-side Buttons (Close & Apply)
                  Row(
                    children: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Close', style: TextStyle(color: Colors.grey)),
                      ),
                      const SizedBox(width: 12),
                      if (widget.isApplied)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFECFDF5),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: const Color(0xFF10B981)),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.check_circle, color: Color(0xFF10B981), size: 18),
                              SizedBox(width: 6),
                              Text(
                                'Applied',
                                style: TextStyle(
                                  color: Color(0xFF047857),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )
                      else if (widget.onApply != null)
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6D28D9),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          ),
                          onPressed: _isApplyLoading ? null : _handleApply,
                          icon: _isApplyLoading
                              ? const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : const Icon(Icons.send_rounded, size: 16),
                          label: Text(_isApplyLoading ? 'Applying...' : 'Apply Now'),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF334155),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            content,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF475569),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderTag extends StatelessWidget {
  final String text;
  final IconData icon;

  const _HeaderTag({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: const Color(0xFF64748B)),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF475569),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
