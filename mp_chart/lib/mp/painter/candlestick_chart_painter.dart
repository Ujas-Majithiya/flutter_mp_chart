import 'package:flutter/rendering.dart';
import 'package:mp_chart/mp/core/animator.dart';
import 'package:mp_chart/mp/core/axis/x_axis.dart';
import 'package:mp_chart/mp/core/axis/y_axis.dart';
import 'package:mp_chart/mp/core/common_interfaces.dart';
import 'package:mp_chart/mp/core/data/candle_data.dart';
import 'package:mp_chart/mp/core/data_provider/candle_data_provider.dart';
import 'package:mp_chart/mp/core/description.dart';
import 'package:mp_chart/mp/core/functions.dart';
import 'package:mp_chart/mp/core/legend/legend.dart';
import 'package:mp_chart/mp/core/marker/i_marker.dart';
import 'package:mp_chart/mp/core/render/candle_stick_chart_renderer.dart';
import 'package:mp_chart/mp/core/render/legend_renderer.dart';
import 'package:mp_chart/mp/core/render/x_axis_renderer.dart';
import 'package:mp_chart/mp/core/render/y_axis_renderer.dart';
import 'package:mp_chart/mp/core/chart_trans_listener.dart';
import 'package:mp_chart/mp/core/transformer/transformer.dart';
import 'package:mp_chart/mp/core/view_port.dart';
import 'package:mp_chart/mp/painter/bar_line_chart_painter.dart';

class CandlestickChartPainter extends BarLineChartBasePainter<CandleData?>
    implements CandleDataProvider {
  CandlestickChartPainter({
    CandleData? data,
    Animator? animator,
    ViewPortHandler? viewPortHandler,
    double? maxHighlightDistance,
    bool highLightPerTapEnabled = false,
    double extraLeftOffset = 0,
    double extraTopOffset = 0,
    double extraRightOffset = 0,
    double extraBottomOffset = 0,
    IMarker? marker,
    Description? desc,
    bool drawMarkers = false,
    Color? infoBgColor,
    TextPainter? infoPainter,
    TextPainter? descPainter,
    XAxis? xAxis,
    Legend? legend,
    LegendRenderer? legendRenderer,
    DataRendererSettingFunction? rendererSettingFunction,
    OnChartValueSelectedListener? selectedListener,
    required int maxVisibleCount,
    bool autoScaleMinMaxEnabled = false,
    bool pinchZoomEnabled = true,
    bool doubleTapToZoomEnabled = false,
    bool highlightPerDragEnabled = false,
    bool dragXEnabled = true,
    bool dragYEnabled = true,
    bool scaleXEnabled = true,
    bool scaleYEnabled = true,
    Paint? gridBackgroundPaint,
    Paint? backgroundPaint,
    Paint? borderPaint,
    bool drawGridBackground = false,
    bool drawBorders = false,
    bool clipValuesToContent = true,
    required double minOffset,
    bool keepPositionOnRotation = false,
    OnDrawListener? drawListener,
    YAxis? axisLeft,
    YAxis? axisRight,
    YAxisRenderer? axisRendererLeft,
    YAxisRenderer? axisRendererRight,
    Transformer? leftAxisTransformer,
    Transformer? rightAxisTransformer,
    XAxisRenderer? xAxisRenderer,
    Matrix4? zoomMatrixBuffer,
    bool customViewPortEnabled = false,
    ChartTransListener? chartTransListener,
  }) : super(
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
          desc: desc,
          drawMarkers: drawMarkers,
          infoBgColor: infoBgColor,
          infoPainter: infoPainter,
          descPainter: descPainter,
          xAxis: xAxis,
          legend: legend,
          legendRenderer: legendRenderer,
          rendererSettingFunction: rendererSettingFunction,
          selectedListener: selectedListener,
          maxVisibleCount: maxVisibleCount,
          autoScaleMinMaxEnabled: autoScaleMinMaxEnabled,
          pinchZoomEnabled: pinchZoomEnabled,
          doubleTapToZoomEnabled: doubleTapToZoomEnabled,
          highlightPerDragEnabled: highlightPerDragEnabled,
          dragXEnabled: dragXEnabled,
          dragYEnabled: dragYEnabled,
          scaleXEnabled: scaleXEnabled,
          scaleYEnabled: scaleYEnabled,
          gridBackgroundPaint: gridBackgroundPaint,
          borderPaint: borderPaint,
          drawGridBackground: drawGridBackground,
          drawBorders: drawBorders,
          clipValuesToContent: clipValuesToContent,
          minOffset: minOffset,
          keepPositionOnRotation: keepPositionOnRotation,
          drawListener: drawListener,
          axisLeft: axisLeft,
          axisRight: axisRight,
          axisRendererLeft: axisRendererLeft,
          axisRendererRight: axisRendererRight,
          leftAxisTransformer: leftAxisTransformer,
          rightAxisTransformer: rightAxisTransformer,
          xAxisRenderer: xAxisRenderer,
          zoomMatrixBuffer: zoomMatrixBuffer,
          customViewPortEnabled: customViewPortEnabled,
          backgroundPaint: backgroundPaint,
          chartTransListener: chartTransListener,
        );

  @override
  void initDefaultWithData() {
    super.initDefaultWithData();
    renderer = CandleStickChartRenderer(this, animator, viewPortHandler);
    xAxis!.spaceMin = (0.5);
    xAxis!.spaceMax = (0.5);
  }

  @override
  CandleData? getCandleData() {
    return getData() as CandleData?;
  }
}
