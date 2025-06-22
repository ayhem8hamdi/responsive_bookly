// ignore_for_file: use_build_context_synchronously

import 'package:bookly/core/utils/ui_errors_handler.dart';
import 'package:bookly/features/home/data/models/book_model/book_model/item.dart';
import 'package:bookly/features/home/presentation/views/widgets/button_action_section.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PricingRow extends StatelessWidget {
  const PricingRow({super.key, required this.item});
  final Item item;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 35),
        child: Row(
          children: [
            LeftPricingWidget(
              onTap: () => _handleDownload(context),
            ),
            RightPricingWidget(
              onTap: () => _handlePreview(context),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handlePreview(BuildContext context) async {
    if (item.volumeInfo!.previewLink == null ||
        item.volumeInfo!.previewLink!.isEmpty) {
      UIErrorHandler.showAwesomeDialog(context, 'No Preview Link Available');
      return;
    }

    final url = Uri.parse(item.volumeInfo!.previewLink!);
    if (!await launchUrl(url)) {
      UIErrorHandler.showAwesomeDialog(context, 'Could not launch preview');
    }
  }

  Future<void> _handleDownload(BuildContext context) async {
    // Check if PDF download is available
    final downloadLink = item.accessInfo?.pdf?.downloadLink;

    if (downloadLink == null || downloadLink.isEmpty) {
      // Check if EPUB is available as fallback
      final epubLink = item.accessInfo?.epub?.downloadLink;

      if (epubLink == null || epubLink.isEmpty) {
        UIErrorHandler.showAwesomeDialog(
            context,
            'This book is not available for download. '
            'Only public domain books can be downloaded for free.');
        return;
      }

      // Launch EPUB download if available
      final epubUrl = Uri.parse(epubLink);
      if (!await launchUrl(epubUrl)) {
        UIErrorHandler.showAwesomeDialog(
            context, 'Could not launch EPUB download');
      }
      return;
    }

    // Launch PDF download
    final pdfUrl = Uri.parse(downloadLink);
    if (!await launchUrl(pdfUrl)) {
      UIErrorHandler.showAwesomeDialog(
          context, 'Could not launch PDF download');
    }
  }
}
