import 'package:flutter/material.dart';

mixin CoreViewModel {
  late BuildContext viewModelContext;
  void setContext(BuildContext context);
  void init();
}
