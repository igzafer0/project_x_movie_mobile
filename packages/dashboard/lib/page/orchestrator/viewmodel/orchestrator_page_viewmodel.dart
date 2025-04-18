import 'package:core/presentation/core_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'orchestrator_page_viewmodel.g.dart';

class OrchestratorPageViewModel = _OrchestratorPageViewModelBase with _$OrchestratorPageViewModel;

abstract class _OrchestratorPageViewModelBase with Store, CoreViewModel {
  @override
  void init() {}

  @observable
  int currentIndex = 0;
  @action
  void changeIndex(int index) {
    currentIndex = index;
  }

  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }
}
