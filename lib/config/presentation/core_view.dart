import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

base class CoreView<T extends Store> extends StatefulWidget {
  final Widget Function(BuildContext context, T value) onPageBuilder;
  final T viewModel;
  final void Function(T model) onModelReady;
  final VoidCallback? onDispose;

  const CoreView(
      {Key? key,
      required this.viewModel,
      required this.onPageBuilder,
      required this.onModelReady,
      this.onDispose})
      : super(key: key);

  @override
  State<CoreView> createState() => _CoreViewState<T>();
}

base class _CoreViewState<T extends Store> extends State<CoreView<T>> {
  late T viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = widget.viewModel;
    widget.onModelReady(viewModel);
  }

  @override
  void dispose() {
    super.dispose();

    if (widget.onDispose != null) widget.onDispose?.call();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, viewModel);
  }
}
