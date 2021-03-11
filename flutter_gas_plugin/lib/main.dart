import 'package:flutter/material.dart';

import 'routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (router) => generateRoutes(context, router.name),
      home: _getDefaultWidget(),
    );
  }
}

Widget _getDefaultWidget() {
  return DefaultHomePage();
}

class DefaultHomePage extends StatefulWidget {
  DefaultHomePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DefaultState();
  }
}

class DefaultState extends State<DefaultHomePage> with RouteAware {
  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didPopNext() {
    super.didPopNext();
  }
}
