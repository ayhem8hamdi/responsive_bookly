import 'package:bookly/features/search/data/SearchRepo/search_repo_impl.dart';
import 'package:bookly/features/search/presentation/view_model/cubit/search_cubit_cubit.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/core/utils/service_locator.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchCubitCubit>(
      create: (context) => SearchCubitCubit(getIt.get<SearchRepoImpl>()),
      child: const Scaffold(
        body: SafeArea(
          child: SearchViewBody(),
        ),
      ),
    );
  }
}
