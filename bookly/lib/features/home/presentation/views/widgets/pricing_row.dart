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
              onTap: () => _handleInfoLink(context),
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
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      UIErrorHandler.showAwesomeDialog(context, 'Could not launch preview');
    }
  }

  Future<void> _handleInfoLink(BuildContext context) async {
    if (item.volumeInfo!.infoLink == null ||
        item.volumeInfo!.infoLink!.isEmpty) {
      UIErrorHandler.showAwesomeDialog(
          context, 'No Additional Information Available');
      return;
    }

    final url = Uri.parse(item.volumeInfo!.infoLink!);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      UIErrorHandler.showAwesomeDialog(
          context, 'Could not open book information');
    }
  }
}
