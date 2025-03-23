import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie/data/usecase/movie_usecase.dart';

final movieUseCase = GetIt.I<MovieUseCase>();

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Future<void> fetchPopular() async {
    final result = await movieUseCase.movies();
    debugPrint("test ${result.data?.first.description}");
  }

  @override
  Widget build(BuildContext context) {
    fetchPopular();
    return const Placeholder();
  }
}
