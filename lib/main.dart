import 'package:flutter/material.dart';
import 'package:flutter_translator/flutter_translator.dart';
import 'package:provider/provider.dart';
import 'app_locale.dart';
import 'controller/providers/login_provider.dart';
import 'controller/utils/routes/app_router.dart';
import 'view/app_data/app_strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TranslatorGenerator _translator = TranslatorGenerator.instance;

  @override
  void initState() {
    super.initState();
    // _translator.init(
    //   supportedLanguageCodes: ['en', 'km', 'ja'],
    //   initLanguageCode: 'km',
    // );
    _translator.init(
      mapLocales: [
        MapLocale('en', AppLocale.EN),
        MapLocale('km', AppLocale.KM),
        MapLocale('ja', AppLocale.JA),
        MapLocale('hi', AppLocale.HI),
      ],
      initLanguageCode: 'en',
    );
    _translator.onTranslatedLanguage = _onTranslatedLanguage;
    _onTranslatedLanguage(_translator.currentLocale);
  }

  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<LoginProvider>(create: (_) => LoginProvider()),
        // ChangeNotifierProvider<LecParamsProvider>(
        //     create: (_) => LecParamsProvider()),
        // ListenableProvider<PendingPhotoProvider>(
        //     create: (_) => PendingPhotoProvider()),
        // ListenableProvider<ReportUploadProvider>(
        //     create: (_) => ReportUploadProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        supportedLocales: _translator.supportedLocales,
        localizationsDelegates: _translator.localizationsDelegates,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: AppStrings.routeToSplash,
        onGenerateRoute: generateRoute,
      ),
    );
  }
}


///To-Do
///File Structure - Done
///Internationalization - 
///Theme : Light and Dark- 
///Text Style - Done
///Google fonts - Done
///