import 'package:core/presentation/core_view.dart';
import 'package:dashboard/page/explorer/viewmodel/explorer_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie/widget/movie_tile_widget.dart';

class ExplorerView extends StatefulWidget {
  const ExplorerView({super.key});

  @override
  State<ExplorerView> createState() => _ExplorerViewState();
}

class _ExplorerViewState extends State<ExplorerView> {
  late ExplorerViewModel viewModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CoreView<ExplorerViewModel>(
      viewModel: ExplorerViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        viewModel = model;
      },
      onPageBuilder: (context, value) => _page(),
    );
  }

  final int columns = 11;
  final int rows = 11;
  final double spacing = 4;
  final double posterHeight = 200;
  final TransformationController _transformationController = TransformationController();

  Widget _page() {
    return Observer(
      builder: (_) {
        if (viewModel.randomMovieWithCategoryPartList.isNotEmpty) {
          final double posterWidth = posterHeight * (133 / 200);
          final size = MediaQuery.of(context).size;
          final double gridWidth = (posterWidth * columns) + ((columns - 1) * spacing);
          final double gridHeight = (posterHeight * rows) + ((rows - 1) * spacing);
          final dx = (gridWidth - size.width) / 2;
          final dy = (gridHeight - size.height) / 2;
          _transformationController.value = Matrix4.identity()
            ..scale(1.3)
            ..translate(-dx, -dy);
          return Scaffold(
            body: InteractiveViewer(
              panEnabled: true,
              scaleEnabled: true,
              transformationController: _transformationController,
              constrained: false,
              child: SizedBox(
                width: gridWidth,
                height: gridHeight,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    mainAxisSpacing: spacing,
                    crossAxisSpacing: spacing,
                    childAspectRatio: 133 / 200,
                  ),
                  itemCount: viewModel.randomMovieWithCategoryPartList.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                        height: posterHeight,
                        child: MovieTileWidget(
                          movie: viewModel.randomMovieWithCategoryPartList[index],
                          onTap: () {},
                        ));
                  },
                ),
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
