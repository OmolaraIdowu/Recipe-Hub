import 'package:flutter/material.dart';

enum ViewState { idle, loading, success, error }

class BaseViewModel extends ChangeNotifier {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  ViewState _viewState = ViewState.loading;

  ViewState get viewState => _viewState;

  set viewState(ViewState newState) {
    _viewState = newState;
    _viewState == ViewState.loading ? isLoading = true : isLoading = false;
    notifyListeners();
  }

  startLoader() {
    if (!isLoading) {
      isLoading = true;
      viewState = ViewState.loading;
      notifyListeners();
    }
  }

  stopLoader() {
    if (isLoading) {
      isLoading = false;
      viewState = ViewState.idle;
      notifyListeners();
    }
  }
}
