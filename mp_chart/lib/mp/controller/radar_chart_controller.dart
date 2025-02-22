import 'package:flutter/painting.dart';
import 'package:mp_chart/mp/chart/radar_chart.dart';
import 'package:mp_chart/mp/controller/pie_radar_controller.dart';
import 'package:mp_chart/mp/core/axis/y_axis.dart';
import 'package:mp_chart/mp/core/common_interfaces.dart';
import 'package:mp_chart/mp/core/data/radar_data.dart';
import 'package:mp_chart/mp/core/description.dart';
import 'package:mp_chart/mp/core/enums/axis_dependency.dart';
import 'package:mp_chart/mp/core/functions.dart';
import 'package:mp_chart/mp/core/marker/i_marker.dart';
import 'package:mp_chart/mp/core/marker/radar_chart_marker.dart';
import 'package:mp_chart/mp/painter/radar_chart_painter.dart';

class RadarChartController extends PieRadarController<RadarChartPainter> {
  double webLineWidth;
  double innerWebLineWidth;
  Color? webColor;
  Color? webColorInner;
  int webAlpha;
  bool drawWeb;
  int skipWebLineCount;
  YAxis? yAxis;
  Color? backgroundColor;

  YAxisSettingFunction? yAxisSettingFunction;

  RadarChartController({
    this.webLineWidth = 1.5,
    this.innerWebLineWidth = 0.75,
    this.webColor,
    this.webColorInner,
    this.webAlpha = 150,
    this.drawWeb = true,
    this.skipWebLineCount = 0,
    this.yAxis,
    this.backgroundColor,
    this.yAxisSettingFunction,
    IMarker? marker,
    Description? description,
    XAxisSettingFunction? xAxisSettingFunction,
    LegendSettingFunction? legendSettingFunction,
    DataRendererSettingFunction? rendererSettingFunction,
    OnChartValueSelectedListener? selectionListener,
    double rotationAngle = 270,
    double rawRotationAngle = 270,
    bool rotateEnabled = true,
    double minOffset = 30.0,
    double maxHighlightDistance = 100.0,
    bool highLightPerTapEnabled = true,
    double extraTopOffset = 0.0,
    double extraRightOffset = 0.0,
    double extraBottomOffset = 0.0,
    double extraLeftOffset = 0.0,
    String noDataText = "No chart data available.",
    bool drawMarkers = true,
    bool resolveGestureHorizontalConflict = false,
    bool resolveGestureVerticalConflict = false,
    double descTextSize = 12,
    double infoTextSize = 12,
    Color? descTextColor,
    Color? infoTextColor,
    Color? infoBgColor,
  }) : super(
            marker: marker,
            noDataText: noDataText,
            xAxisSettingFunction: xAxisSettingFunction,
            legendSettingFunction: legendSettingFunction,
            rendererSettingFunction: rendererSettingFunction,
            description: description,
            selectionListener: selectionListener,
            maxHighlightDistance: maxHighlightDistance,
            highLightPerTapEnabled: highLightPerTapEnabled,
            extraTopOffset: extraTopOffset,
            extraRightOffset: extraRightOffset,
            extraBottomOffset: extraBottomOffset,
            extraLeftOffset: extraLeftOffset,
            drawMarkers: drawMarkers,
            resolveGestureHorizontalConflict: resolveGestureHorizontalConflict,
            resolveGestureVerticalConflict: resolveGestureVerticalConflict,
            descTextSize: descTextSize,
            infoTextSize: infoTextSize,
            descTextColor: descTextColor,
            infoTextColor: infoTextColor,
            infoBgColor: infoBgColor,
            rotationAngle: rotationAngle,
            rawRotationAngle: rawRotationAngle,
            rotateEnabled: rotateEnabled,
            minOffset: minOffset);

  @override
  IMarker initMarker() => RadarChartMarker();

  YAxis initYAxis() => YAxis(position: AxisDependency.LEFT);

  RadarData? get data => super.data as RadarData?;

  RadarChartPainter? get painter => super.painter;

  RadarChartState? get state => super.state as RadarChartState?;

  @override
  void initialPainter() {
    painter = RadarChartPainter(
      data: data,
      animator: animator,
      viewPortHandler: viewPortHandler,
      maxHighlightDistance: maxHighlightDistance,
      highLightPerTapEnabled: highLightPerTapEnabled,
      extraLeftOffset: extraLeftOffset,
      extraTopOffset: extraTopOffset,
      extraRightOffset: extraRightOffset,
      extraBottomOffset: extraBottomOffset,
      marker: marker,
      desc: description,
      drawMarkers: drawMarkers,
      infoBgColor: infoBgColor,
      infoPainter: infoPaint,
      descPainter: descPaint,
      xAxis: xAxis,
      legend: legend,
      legendRenderer: legendRenderer,
      rendererSettingFunction: rendererSettingFunction,
      selectedListener: selectionListener,
      rotationAngle: rotationAngle,
      rawRotationAngle: rawRotationAngle,
      rotateEnabled: rotateEnabled,
      minOffset: minOffset,
      webLineWidth: webLineWidth,
      innerWebLineWidth: innerWebLineWidth,
      webColor: webColor,
      webColorInner: webColorInner,
      webAlpha: webAlpha,
      drawWeb: drawWeb,
      skipWebLineCount: skipWebLineCount,
      yAxis: yAxis,
      backgroundColor: backgroundColor,
    );
  }

  @override
  void doneBeforePainterInit() {
    super.doneBeforePainterInit();
    webColor ??= Color.fromARGB(255, 122, 122, 122);
    webColorInner ??= Color.fromARGB(255, 122, 122, 122);
    yAxis = initYAxis();
    if (yAxisSettingFunction != null) {
      yAxisSettingFunction!(yAxis, this);
    }
  }

  @override
  RadarChartState createRealState() {
    return RadarChartState();
  }
}
