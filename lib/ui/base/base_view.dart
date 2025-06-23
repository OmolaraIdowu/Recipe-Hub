import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_hub/locator.dart';
import 'package:recipe_hub/ui/base/base_viewmodel.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Function(T)? onModelReady;
  final Function(T)? onDisposeModel;
  const BaseView({
    super.key,
    this.onModelReady,
    this.onDisposeModel,
    required this.builder,
  });

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  // get the viewmodel
  T model = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady!(model);
    }
    super.initState();
  }

  @override
  void dispose() {
    if (widget.onDisposeModel != null) {
      widget.onDisposeModel!(model);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
