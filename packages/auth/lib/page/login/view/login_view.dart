import 'package:auth/page/login/view_model/login_viewmodel.dart';
import 'package:auth/widget/button/apple_button.dart';
import 'package:auth/widget/button/google_button.dart';
import 'package:core/constant/color_constant.dart';
import 'package:core/core.dart';
import 'package:core/enum/text_size.dart';
import 'package:core/extension/ui_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return CoreView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        viewModel = model;
      },
      onPageBuilder: (context, value) => _scaffoldBody(),
    );
  }

  Widget _scaffoldBody() {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Klavye açılınca ekran yukarı itilir

      body: SafeArea(
        bottom: true,
        top: false,
        child: LayoutBuilder(builder: (context, cons) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: cons.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Gap(context.MidSpacer),
                    GlobalLabelTextWidget(text: "screenHUB", size: TextSize.EXTREME_BIG, color: ColorConstant.APP_WHITE),
                    Gap(context.MidSpacer),
                    GlobalLabelTextWidget(text: "All we do is screen.", size: TextSize.PARAGRAPH),
                    Gap(context.LargeSpacer),
                    Padding(
                      padding: context.MidHorizontalSpacer,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GlobalLabelTextWidget(text: "How should i call you?", size: TextSize.PARAGRAPH),
                          Gap(context.LargeSpacer),
                          Container(
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(color: ColorConstant.SECONDARY_COLOR, borderRadius: context.MidRadius),
                            padding: context.MidHorizontalSpacer,
                            child: GlobalTextFieldWidget(
                              hintText: "Name",
                              newText: (e) {},
                            ),
                          ),
                          Gap(context.LargeSpacer),
                          SizedBox(
                            height: 50,
                            child: GlobalCommonButtonWidget(
                              onTap: () {},
                              title: "Enter",
                              color: ColorConstant.SECONDARY_COLOR,
                            ),
                          ),
                          Gap(context.LargeSpacer),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: ColorConstant.SECONDARY_COLOR,
                                ),
                              ),
                              Gap(context.LargeSpacer),
                              GlobalLabelTextWidget(text: "or", size: TextSize.BIG_PARAGRAPH),
                              Gap(context.LargeSpacer),
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: ColorConstant.SECONDARY_COLOR,
                                ),
                              )
                            ],
                          ),
                          Gap(context.LargeSpacer),
                          SizedBox(height: 50, child: GoogleButton()),
                          Gap(context.LargeSpacer),
                          SizedBox(height: 50, child: AppleButton()),
                          Gap(context.MidSpacer),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
