import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mp_flutter_chart/chart/mp/chart/line_chart.dart';
import 'package:mp_flutter_chart/chart/mp/core/data.dart';
import 'package:mp_flutter_chart/chart/mp/core/description.dart';
import 'package:mp_flutter_chart/chart/mp/core/interfaces.dart';
import 'package:mp_flutter_chart/chart/mp/core/legend.dart';
import 'package:mp_flutter_chart/chart/mp/core/limit.dart';
import 'package:mp_flutter_chart/chart/mp/mode.dart';
import 'package:mp_flutter_chart/chart/mp/painter/line_chart_painter.dart';
import 'package:mp_flutter_chart/chart/mp/util.dart';
import 'package:mp_flutter_chart/demo/line_chart/basic.dart';
import 'package:mp_flutter_chart/demo/res/styles.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mp_flutter_chart Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'mp_flutter_chart example'),
      routes: <String, WidgetBuilder>{
        // 这里可以定义静态路由，不能传递参数
        '/line_chart/basic': (_) => LineChartBasic(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: CustomScrollView(shrinkWrap: false, slivers: [
        new SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
          sliver: new SliverList(
            delegate: new SliverChildListDelegate(
              <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.all(15.0),
                          child: Center(
                              child: Text(
                            "Line Charts",
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ColorUtils.BLACK,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ))),
                      Gaps.line
                    ],
                  ),
                ),
                InkWell(
                    onTap: () =>
                        Navigator.of(context).pushNamed('/line_chart/basic'),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Basic",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorUtils.BLACK,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 15),
                              child: Text(
                                "Simple line chart.",
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorUtils.BLACK, fontSize: 12),
                              ),
                            ),
                            Gaps.line
                          ],
                        ),
                      ),
                    )),
                InkWell(
                    onTap: () => {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Mutiple",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorUtils.BLACK,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 15),
                              child: Text(
                                "Show mutiple data sets.",
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorUtils.BLACK, fontSize: 12),
                              ),
                            ),
                            Gaps.line
                          ],
                        ),
                      ),
                    )),
                InkWell(
                    onTap: () => {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Dual Axis",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorUtils.BLACK,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 15),
                              child: Text(
                                "Line chart with dual y-axes.",
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorUtils.BLACK, fontSize: 12),
                              ),
                            ),
                            Gaps.line
                          ],
                        ),
                      ),
                    )),
                InkWell(
                    onTap: () => {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Inverted Axis",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorUtils.BLACK,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 15),
                              child: Text(
                                "Inverted y-axis.",
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorUtils.BLACK, fontSize: 12),
                              ),
                            ),
                            Gaps.line
                          ],
                        ),
                      ),
                    )),
                InkWell(
                    onTap: () => {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Cubic",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorUtils.BLACK,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 15),
                              child: Text(
                                "Line chart with a cubic line shape.",
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorUtils.BLACK, fontSize: 12),
                              ),
                            ),
                            Gaps.line
                          ],
                        ),
                      ),
                    )),
                InkWell(
                    onTap: () => {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Colorful",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorUtils.BLACK,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 15),
                              child: Text(
                                "Colorful line chart",
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorUtils.BLACK, fontSize: 12),
                              ),
                            ),
                            Gaps.line
                          ],
                        ),
                      ),
                    )),
                InkWell(
                    onTap: () => {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Performance",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorUtils.BLACK,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 15),
                              child: Text(
                                "Render 30.000 data points smoothly.",
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorUtils.BLACK, fontSize: 12),
                              ),
                            ),
                            Gaps.line
                          ],
                        ),
                      ),
                    )),
                InkWell(
                    onTap: () => {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Filled",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorUtils.BLACK,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 15),
                              child: Text(
                                "Colored area between two lines.",
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorUtils.BLACK, fontSize: 12),
                              ),
                            ),
                            Gaps.line
                          ],
                        ),
                      ),
                    )),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.all(15.0),
                          child: Center(
                              child: Text(
                            "Bar Charts",
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ColorUtils.BLACK,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ))),
                      Gaps.line
                    ],
                  ),
                ),
                InkWell(
                    onTap: () => {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Basic",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorUtils.BLACK,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 15),
                              child: Text(
                                "Simple bar chart.",
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorUtils.BLACK, fontSize: 12),
                              ),
                            ),
                            Gaps.line
                          ],
                        ),
                      ),
                    )),
                InkWell(
                    onTap: () => {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Basic 2",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorUtils.BLACK,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 15),
                              child: Text(
                                "Variation of the simple bar chart.",
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorUtils.BLACK, fontSize: 12),
                              ),
                            ),
                            Gaps.line
                          ],
                        ),
                      ),
                    )),
                InkWell(
                    onTap: () => {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Multiple",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorUtils.BLACK,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 15),
                              child: Text(
                                "Show multiple data sets.",
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorUtils.BLACK, fontSize: 12),
                              ),
                            ),
                            Gaps.line
                          ],
                        ),
                      ),
                    )),
                InkWell(
                    onTap: () => {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Horizontal",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorUtils.BLACK,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 15),
                              child: Text(
                                "Render bar chart horizontally.",
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorUtils.BLACK, fontSize: 12),
                              ),
                            ),
                            Gaps.line
                          ],
                        ),
                      ),
                    )),
                InkWell(
                    onTap: () => {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Stacked",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorUtils.BLACK,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 15),
                              child: Text(
                                "Stacked bar chart.",
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorUtils.BLACK, fontSize: 12),
                              ),
                            ),
                            Gaps.line
                          ],
                        ),
                      ),
                    )),
                InkWell(
                    onTap: () => {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Negative",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorUtils.BLACK,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 15),
                              child: Text(
                                "Positive and negative values with unique colors.",
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorUtils.BLACK, fontSize: 12),
                              ),
                            ),
                            Gaps.line
                          ],
                        ),
                      ),
                    )),
                InkWell(
                    onTap: () => {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Stacked 2",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorUtils.BLACK,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 15),
                              child: Text(
                                "Stacked bar chart with negative values.",
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorUtils.BLACK, fontSize: 12),
                              ),
                            ),
                            Gaps.line
                          ],
                        ),
                      ),
                    )),
                InkWell(
                    onTap: () => {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Sine",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorUtils.BLACK,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 15),
                              child: Text(
                                "Sine function in bar chart format.",
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorUtils.BLACK, fontSize: 12),
                              ),
                            ),
                            Gaps.line
                          ],
                        ),
                      ),
                    )),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.all(15.0),
                          child: Center(
                              child: Text(
                            "Pie Charts",
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ColorUtils.BLACK,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ))),
                      Gaps.line
                    ],
                  ),
                ),
                InkWell(
                    onTap: () => {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Basic",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorUtils.BLACK,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 15),
                              child: Text(
                                "Simple pie chart.",
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorUtils.BLACK, fontSize: 12),
                              ),
                            ),
                            Gaps.line
                          ],
                        ),
                      ),
                    )),
                InkWell(
                    onTap: () => {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Value lines",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorUtils.BLACK,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 15),
                              child: Text(
                                "Stylish lines drawn outward from slices.",
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorUtils.BLACK, fontSize: 12),
                              ),
                            ),
                            Gaps.line
                          ],
                        ),
                      ),
                    )),
                InkWell(
                    onTap: () => {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Half Pie",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorUtils.BLACK,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 15),
                              child: Text(
                                "180° (half) pie chart.",
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorUtils.BLACK, fontSize: 12),
                              ),
                            ),
                            Gaps.line
                          ],
                        ),
                      ),
                    )),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.all(15.0),
                          child: Center(
                              child: Text(
                            "Other Charts",
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ColorUtils.BLACK,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ))),
                      Gaps.line
                    ],
                  ),
                ),
                InkWell(
                    onTap: () => {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Combined Chart",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorUtils.BLACK,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 15),
                              child: Text(
                                "Bar and line chart together.",
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorUtils.BLACK, fontSize: 12),
                              ),
                            ),
                            Gaps.line
                          ],
                        ),
                      ),
                    )),
                InkWell(
                    onTap: () => {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Scatter Plot",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorUtils.BLACK,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 15),
                              child: Text(
                                "Simple scatter plot.",
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorUtils.BLACK, fontSize: 12),
                              ),
                            ),
                            Gaps.line
                          ],
                        ),
                      ),
                    )),
                InkWell(
                    onTap: () => {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Bubble Chart",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorUtils.BLACK,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 15),
                              child: Text(
                                "Simple Bubble chart.",
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorUtils.BLACK, fontSize: 12),
                              ),
                            ),
                            Gaps.line
                          ],
                        ),
                      ),
                    )),
                InkWell(
                    onTap: () => {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Candlestick",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorUtils.BLACK,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 15),
                              child: Text(
                                "Simple financial chart.",
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorUtils.BLACK, fontSize: 12),
                              ),
                            ),
                            Gaps.line
                          ],
                        ),
                      ),
                    )),
                InkWell(
                    onTap: () => {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Redar Chart",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorUtils.BLACK,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 15),
                              child: Text(
                                "Simple web chart.",
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorUtils.BLACK, fontSize: 12),
                              ),
                            ),
                            Gaps.line
                          ],
                        ),
                      ),
                    )),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.all(15.0),
                          child: Center(
                              child: Text(
                            "Scrolling Charts",
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ColorUtils.BLACK,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ))),
                      Gaps.line
                    ],
                  ),
                ),
                InkWell(
                    onTap: () => {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Mutiple",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorUtils.BLACK,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 15),
                              child: Text(
                                "Various types of charts.",
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorUtils.BLACK, fontSize: 12),
                              ),
                            ),
                            Gaps.line
                          ],
                        ),
                      ),
                    )),
                InkWell(
                    onTap: () => {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "View Pager",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorUtils.BLACK,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 15),
                              child: Text(
                                "Swipe through different charts.",
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorUtils.BLACK, fontSize: 12),
                              ),
                            ),
                            Gaps.line
                          ],
                        ),
                      ),
                    )),
                InkWell(
                    onTap: () => {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Tall Bar Chart",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorUtils.BLACK,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 15),
                              child: Text(
                                "Bars bigger than your screen.",
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorUtils.BLACK, fontSize: 12),
                              ),
                            ),
                            Gaps.line
                          ],
                        ),
                      ),
                    )),
                InkWell(
                    onTap: () => {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Many Bar Charts",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorUtils.BLACK,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 15),
                              child: Text(
                                "More bars than your screen can handle!.",
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorUtils.BLACK, fontSize: 12),
                              ),
                            ),
                            Gaps.line
                          ],
                        ),
                      ),
                    )),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.all(15.0),
                          child: Center(
                              child: Text(
                            "Even More Line Charts",
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ColorUtils.BLACK,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ))),
                      Gaps.line
                    ],
                  ),
                ),
                InkWell(
                    onTap: () => {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Dynamic",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorUtils.BLACK,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 15),
                              child: Text(
                                "Build a line chart by adding points and sets.",
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorUtils.BLACK, fontSize: 12),
                              ),
                            ),
                            Gaps.line
                          ],
                        ),
                      ),
                    )),
                InkWell(
                    onTap: () => {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Realtime",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorUtils.BLACK,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 15),
                              child: Text(
                                "Add data points in realtime.",
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorUtils.BLACK, fontSize: 12),
                              ),
                            ),
                            Gaps.line
                          ],
                        ),
                      ),
                    )),
                InkWell(
                    onTap: () => {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Hourly",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorUtils.BLACK,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 15),
                              child: Text(
                                "Uses the current time to add a data point for each hour.",
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorUtils.BLACK, fontSize: 12),
                              ),
                            ),
                            Gaps.line
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
        )
      ]),
    );
  }
}

class A implements IFillFormatter {
  LineChartPainter painter;

  A(this.painter);

  @override
  double getFillLinePosition(
      ILineDataSet dataSet, LineDataProvider dataProvider) {
    return painter.mAxisLeft.getAxisMinimum();
  }
}
