import 'package:core/constant/color_constant.dart';
import 'package:core/presentation/core_view.dart';
import 'package:dashboard/page/main/view/main_dashboard_view.dart';
import 'package:dashboard/page/orchestrator/viewmodel/orchestrator_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:search/presentation/search_dashboard/view/search_dashboard_page_view.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class OrchestratorPageView extends StatefulWidget {
  const OrchestratorPageView({super.key});

  @override
  State<OrchestratorPageView> createState() => OorchestratorPageViewState();
}

class OorchestratorPageViewState extends State<OrchestratorPageView> {
  late OrchestratorPageViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return CoreView<OrchestratorPageViewModel>(
      viewModel: OrchestratorPageViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        viewModel = model;
      },
      onPageBuilder: (context, value) => Scaffold(
        body: Column(
          children: [
            Observer(builder: (context) {
              if (viewModel.currentIndex == 0) {
                return Expanded(child: MainDashboardView());
              }
              return Expanded(child: (SearchDashboardPageView()));
            }),
            Observer(builder: (context) {
              return StylishBottomBar(
                backgroundColor: ColorConstant.PRIMARY_COLOR,
                items: [
                  BottomBarItem(
                    icon: const Icon(Icons.home),
                    title: const Text('Home'),
                    backgroundColor: viewModel.currentIndex == 0 ? ColorConstant.APP_WHITE : ColorConstant.SECONDARY_TEXT_COLOR,
                    selectedIcon: const Icon(Icons.home),
                  ),
                  BottomBarItem(
                    icon: const Icon(Icons.search),
                    title: const Text('Search'),
                    backgroundColor: viewModel.currentIndex == 1 ? ColorConstant.APP_WHITE : ColorConstant.SECONDARY_TEXT_COLOR,
                  ),
                ],
                currentIndex: viewModel.currentIndex,
                onTap: (value) {
                  viewModel.changeIndex(value);
                },
                option: DotBarOptions(
                  dotStyle: DotStyle.tile,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
