import 'package:flutter/material.dart';
import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';
import 'package:return_url/screens/return.dart';

//Needed to load faster
//https://github.com/flutter/flutter/issues/76009#issuecomment-1042073205
void main() {
  //https://github.com/flutter/flutter/issues/33245#issuecomment-705095853
  configureApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    // Using MultiProvider is convenient when providing multiple objects.
    return MaterialApp(
      title: 'Don\'t worry about it!',
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: _themeMode,
      initialRoute: '/',
      routes: {
        //'/': (context) => const MyHome(),
        '/return': (context) => const MyReturn(),
        //'/cart': (context) => const MyCart(),
        //'/builder': (context) => const MyBuilder(),
      },
      //https://stackoverflow.com/questions/67092113/flutter-on-web-using-query-params-in-url-redirects-to-inital-route
      onGenerateRoute: (RouteSettings settings) {
        Widget? pageView;
        if (settings.name != null) {
          var uriData = Uri.parse(settings.name!);
          //uriData.path will be your path and uriData.queryParameters will hold query-params values
          switch (uriData.path) {
            case '/return':
              pageView = const MyReturn();
              break;
          }
        }
        if (pageView != null) {
          return MaterialPageRoute(
              builder: (BuildContext context) => pageView!);
        }
        return null;
      },
    );
  }

  //https://stackoverflow.com/questions/60232070/how-to-implement-dark-mode-in-flutter
  void changeTheme() {
    setState(() {
      _themeMode =
      _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  bool isLightMode() {
    return _themeMode == ThemeMode.light ? true : false;
  }
}