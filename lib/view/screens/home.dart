import 'package:flutter/material.dart';
import 'package:flutter_translator/flutter_translator.dart';

import '../../app_locale.dart';
import '../app_data/app_colors.dart';
import '../app_data/app_text_style.dart';
import '../widgets/custom_buttom.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TranslatorGenerator _translator = TranslatorGenerator.instance;
  double? _height, _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SizedBox(
          height: _height,
          width: _width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: CustomButton(
                        buttonHeight: 50,
                        buttonWidth: 120,
                        buttonColor: AppColors.orange,
                        onClick: () {},
                        text: FittedBox(
                          child: Text(_translator.getString(AppLocale.name),
                              style: AppTextStyle.font12OpensansWhiteExtrabold),
                        )),
                  ),
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: CustomButton(
                        buttonHeight: 50,
                        buttonWidth: 120,
                        buttonColor: AppColors.orange,
                        onClick: () {},
                        text: FittedBox(
                          child: Text(_translator.getString(AppLocale.title),
                              style: AppTextStyle.font12OpensansWhiteExtrabold),
                        )),
                  ),
                ],
              ),
              Container(
                height: 200,
                margin: EdgeInsets.only(top: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomButton(
                      buttonWidth: 80,
                      buttonHeight: 35,
                      text: const Text('English'),
                      onClick: () {
                        _translator.translate('en');
                        setState(() {});
                      },
                    ),
                    CustomButton(
                      buttonWidth: 80,
                      buttonHeight: 35,
                      text: const Text('Khmer'),
                      onClick: () {
                        _translator.translate('km');
                        setState(() {});
                      },
                    ),
                    CustomButton(
                      buttonWidth: 80,
                      buttonHeight: 35,
                      text: FittedBox(child: const Text('Japanese')),
                      onClick: () {
                        _translator.translate('ja', save: false);
                        setState(() {});
                      },
                    ),
                    CustomButton(
                      buttonWidth: 80,
                      buttonHeight: 35,
                      text: const Text('Hindi'),
                      onClick: () {
                        _translator.translate('hi');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
