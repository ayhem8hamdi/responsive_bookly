import 'package:bookly/core/utils/app_colors.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/home/data/repos/home_repo_implementation.dart';
import 'package:bookly/features/home/presentation/view_model/best_seller_cubit/cubit/best_seller_cubit.dart';
import 'package:bookly/features/home/presentation/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/search/data/SearchRepo/search_repo_impl.dart';
import 'package:bookly/features/search/presentation/view_model/cubit/search_cubit_cubit.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() {
  setup();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(getIt.get<HomeRepoImplementation>())
                ..fetchFeauturedBooks(),
        ),
        BlocProvider(
          create: (context) =>
              BestSellerCubit(getIt.get<HomeRepoImplementation>())
                ..fetchBestSellerBooks(),
        ),
        BlocProvider(
          create: (context) => SearchCubitCubit(getIt.get<SearchRepoImpl>()),
        ),
      ],
      child: GetMaterialApp(
        theme: ThemeData().copyWith(
          scaffoldBackgroundColor: AppColors.kBgColor,
        ),
        debugShowCheckedModeBanner: false,
        getPages: AppRouter.getViews(),
      ),
    );
  }
}
