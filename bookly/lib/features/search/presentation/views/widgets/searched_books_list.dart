import 'package:bookly/features/home/data/models/book_model/book_model/volume_info.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';

class SearchedBookList extends StatelessWidget {
  const SearchedBookList({super.key, required this.volumeInfo});
  final List<VolumeInfo> volumeInfo;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: volumeInfo.length,
      itemBuilder: (context, index) =>
          BestSellerItem(volumeInfo: volumeInfo[index]),
    );
  }
}
