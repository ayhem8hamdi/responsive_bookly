import 'package:bookly/core/utils/ui_errors_handler.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_item_list.dart';
import 'package:bookly/features/home/presentation/views/widgets/bottom_section_title.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_scroll_view_horizontal_book_list.dart';
import 'package:bookly/features/search/presentation/view_model/cubit/search_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsBottomSection extends StatelessWidget {
  const BookDetailsBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BottomSectionTitle(),
          SizedBox(height: 20),
          BottomSectionListViewHoriz(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class BottomSectionListViewHoriz extends StatelessWidget {
  const BottomSectionListViewHoriz({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubitCubit, SearchCubitState>(
      listener: (context, state) {
        if (state is SearchCubitFailure) {
          UIErrorHandler.showError(context, state.failure);
        }
      },
      builder: (context, state) {
        if (state is SearchCubitLoading) {
          return const MayAlsoLikeBooksSizedBox(widget: BookItemListShimmer());
        } else if (state is SearchCubitSucces) {
          return MayAlsoLikeBooksSizedBox(
            widget: BookItemList(items: state.books),
          );
        } else {
          return const MayAlsoLikeBooksSizedBox(
            widget: Center(child: Text('No Data')),
          );
        }
      },
    );
  }
}

class MayAlsoLikeBooksSizedBox extends StatelessWidget {
  const MayAlsoLikeBooksSizedBox({super.key, required this.widget});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.20 < 115
          ? 105
          : MediaQuery.of(context).size.height * 0.20,
      child: widget,
    );
  }
}
