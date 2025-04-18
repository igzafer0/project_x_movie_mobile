import 'package:core/core.dart';
import 'package:core/enum/text_size.dart';
import 'package:core/extension/ui_extension.dart';
import 'package:core/presentation/widget/text_field/global_fake_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:search/presentation/search_dashboard/section/genre_list_section.dart';
import 'package:search/presentation/search_dashboard/view_model/search_dashboard_page_viewmodel.dart';

class SearchDashboardPageView extends StatefulWidget {
  const SearchDashboardPageView({super.key});

  @override
  State<SearchDashboardPageView> createState() => _SearchDashboardPageViewState();
}

class _SearchDashboardPageViewState extends State<SearchDashboardPageView> {
  late SearchDashboardPageViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return CoreView<SearchDashboardPageViewModel>(
      viewModel: SearchDashboardPageViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        viewModel = model;
      },
      onPageBuilder: (context, value) => _scaffoldBody(),
    );
  }

  _scaffoldBody() {
    return Scaffold(
      body: Padding(
        padding: context.MidHorizontalSpacer,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Gap(MediaQuery.of(context).padding.top),
            Gap(context.SmallSpacer),
            GlobalLabelTextWidget(text: "Deep Search for\nWhatever you want", size: TextSize.BIG_TITLE),
            Gap(context.SmallSpacer),
            GlobalLabelTextWidget(text: "eg, a love story that takes place on another planet...", size: TextSize.SMALL_PARAGRAPH),
            Gap(context.MidSpacer),
            GlobalFakeTextFieldWidget(),
            Gap(context.MidSpacer),
            _genrePart(),
            Gap(context.MidSpacer),
            GlobalLabelTextWidget(text: "How Deep Search Works?", size: TextSize.TITLE),
            Gap(context.SmallSpacer),
            GlobalLabelTextWidget(
                text:
                    "Your words are transformed into meaning-based vectors and compared with thousands of films. The deeper your input, the sharper the match.",
                size: TextSize.SMALL_PARAGRAPH),
          ],
        ),
      ),
    );
  }

  _genrePart() {
    return Observer(builder: (_) {
      if (viewModel.genreList.isNotEmpty) {
        return Padding(
          padding: context.MidHorizontalSpacer,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlobalLabelTextWidget(
                text: "Genres",
                size: TextSize.BIG_TITLE,
              ),
              Gap(context.MidSpacer),
              SizedBox(height: 100, child: GenreListSection(viewModel.genreList)),
            ],
          ),
        );
      }
      return const SizedBox.shrink();
    });
  }
}
