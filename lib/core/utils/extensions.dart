import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_assessment/core/utils/size_config.dart';

extension PaddingExtension on Widget {
  Widget padAll(double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: this,
    );
  }

  Widget padSymmetric({double horizontal = 0.0, double vertical = 0.0}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: this,
    );
  }

  Widget padOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        top: top,
        right: right,
        bottom: bottom,
      ),
      child: this,
    );
  }
}

extension AlignmentExtension on Widget {
  Widget alignCenterLeft({
    double? widthFactor,
    double? heightFactor,
  }) {
    return Align(
      alignment: Alignment.centerLeft,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
    );
  }

  Widget alignCenterRight({
    double? widthFactor,
    double? heightFactor,
  }) {
    return Align(
      alignment: Alignment.centerRight,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
    );
  }

  Widget alignTopLeft({
    double? widthFactor,
    double? heightFactor,
  }) {
    return Align(
      alignment: Alignment.topLeft,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
    );
  }

  Widget alignTopRight({
    double? widthFactor,
    double? heightFactor,
  }) {
    return Align(
      alignment: Alignment.topRight,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
    );
  }

  Widget alignBottomLeft({
    double? widthFactor,
    double? heightFactor,
  }) {
    return Align(
      alignment: Alignment.bottomLeft,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
    );
  }

  Widget alignBottomRight({
    double? widthFactor,
    double? heightFactor,
  }) {
    return Align(
      alignment: Alignment.bottomRight,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
    );
  }

  Widget debugBorder({Color? color}) {
    if (kDebugMode) {
      return DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: color ?? Colors.red, width: 4),
        ),
        child: this,
      );
    } else {
      return this;
    }
  }

  Widget onTapWidget(
      {VoidCallback? onTap,
      VoidCallback? onLongPress,
      required String tooltip}) {
    return Tooltip(
      message: tooltip,
      child: GestureDetector(
        onTap: onTap,
        onLongPress: onLongPress,
        child: this,
      ),
    );
  }
}

extension ColumnChildrenSpacing on List<Widget> {
  List<Widget> columnInPadding(double height) {
    return expand(
      (element) => [
        element,
        SizedBox(
          height: height,
        )
      ],
    ).toList();
  }

  List<Widget> rowInPadding(double width) {
    return expand(
      (element) => [
        element,
        SizedBox(
          width: width,
        )
      ],
    ).toList();
  }
}

extension MediaQuerySizeExtension on BuildContext {
  double sizeWidth(double w) {
    return MediaQuery.sizeOf(this).width * w;
  }

  double sizeHeight(double h) {
    return MediaQuery.sizeOf(this).height * h;
  }

  Offset center(Offset f) {
    return MediaQuery.sizeOf(this).center(f);
  }

  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  TextTheme get textTheme => theme.textTheme;
}

extension WidgetAnimation on Widget {
  Animate fadeInFromTop({
    Duration? delay,
    Duration? animationDuration,
    Offset? offset,
  }) =>
      animate(delay: delay ?? 300.ms)
          .move(
            duration: animationDuration ?? 300.ms,
            begin: offset ?? const Offset(0, -10),
          )
          .fade(duration: animationDuration ?? 300.ms);

  Animate fadeInFromBottom({
    Duration? delay,
    Duration? animationDuration,
    Offset? offset,
  }) =>
      animate(delay: delay ?? 300.ms)
          .move(
            duration: animationDuration ?? 300.ms,
            begin: offset ?? const Offset(0, 10),
          )
          .fade(duration: animationDuration ?? 300.ms);

  // write fadeInFromRight

  Animate fadeInFromLeft({
    Duration? delay,
    Duration? animationDuration,
    Offset? offset,
  }) =>
      animate(delay: delay ?? 300.ms)
          .move(
            duration: animationDuration ?? 300.ms,
            begin: offset ?? const Offset(-10, 0),
          )
          .fade(duration: animationDuration ?? 300.ms);

  Animate fadeInFromRight({
    Duration? delay,
    Duration? animationDuration,
    Offset? offset,
  }) =>
      animate(delay: delay ?? 300.ms)
          .move(
            duration: animationDuration ?? 300.ms,
            begin: offset ?? const Offset(10, 0),
          )
          .fade(duration: animationDuration ?? 300.ms);

  Animate fadeIn({
    Duration? delay,
    Duration? animationDuration,
    Curve? curve,
  }) =>
      animate(delay: delay ?? 300.ms).fade(
        duration: animationDuration ?? 300.ms,
        curve: curve ?? Curves.decelerate,
      );

  Animate scale({
    Duration? delay,
    Duration? animationDuration,
    Curve? curve,
  }) =>
      animate(
        delay: delay ?? 300.ms,
      ).scale(
        duration: animationDuration ?? 300.ms,
        curve: curve ?? Curves.easeOut,
      );

  Animate scaleFromLeft({
    Duration? delay,
    Duration? animationDuration,
    Curve? curve,
  }) =>
      animate(
        delay: delay ?? 300.ms,
      ).scale(
        duration: animationDuration ?? 3100.ms,
        curve: curve ?? Curves.easeOut,
        begin: const Offset(0, -20),
        // end: const Offset(0, 0),
        // alignment: Alignment.bottomLeft,
      );

  Animate slideInFromBottom({
    Duration? delay,
    Duration? animationDuration,
    Curve? curve,
    double? begin,
  }) =>
      animate(
        delay: delay ?? 300.ms,
      ).slideY(
        duration: animationDuration ?? 300.ms,
        begin: begin ?? 0.2,
        end: 0,
        curve: curve ?? Curves.linear,
      );
}

extension SizeExtensions on num {
  double get h => SizeConfig.getHeight(toDouble());

  double get w => SizeConfig.getWidth(toDouble());

  double get sp => SizeConfig.getTextSize(toDouble());
}

extension WidgetExtension on Widget? {
  /// With custom height and width
  SizedBox withSize({double width = 0.0, double height = 0.0}) {
    return SizedBox(height: height, width: width, child: this);
  }

  /// With custom width
  SizedBox withWidth(double width) => SizedBox(width: width, child: this);

  /// With custom height
  SizedBox withHeight(double height) => SizedBox(height: height, child: this);

  Widget addHeight(double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        this ?? Container(),
        SizedBox(
          height: height,
        )
      ],
    );
  }

  /// return padding top
  Padding paddingTop(double top) {
    return Padding(padding: EdgeInsets.only(top: top), child: this);
  }

  /// return padding left
  Padding paddingLeft(double left) {
    return Padding(padding: EdgeInsets.only(left: left), child: this);
  }

  /// return padding right
  Padding paddingRight(double right) {
    return Padding(padding: EdgeInsets.only(right: right), child: this);
  }

  /// return padding bottom
  Padding paddingBottom(double bottom) {
    return Padding(padding: EdgeInsets.only(bottom: bottom), child: this);
  }

  /// return padding all
  Padding paddingAll(double padding) {
    return Padding(padding: EdgeInsets.all(padding), child: this);
  }

  /// return custom padding from each side
  Padding paddingOnly({
    double top = 0.0,
    double left = 0.0,
    double bottom = 0.0,
    double right = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: this,
    );
  }

  /// return padding symmetric
  Padding paddingSymmetric({double vertical = 0.0, double horizontal = 0.0}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: this,
    );
  }

  /// set visibility
  Widget visible(bool visible, {Widget? defaultWidget}) {
    return visible ? this! : (defaultWidget ?? const SizedBox());
  }

  /// add custom corner radius each side
  ClipRRect cornerRadiusWithClipRRectOnly({
    int bottomLeft = 0,
    int bottomRight = 0,
    int topLeft = 0,
    int topRight = 0,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(bottomLeft.toDouble()),
        bottomRight: Radius.circular(bottomRight.toDouble()),
        topLeft: Radius.circular(topLeft.toDouble()),
        topRight: Radius.circular(topRight.toDouble()),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: this,
    );
  }

  /// add corner radius
  ClipRRect cornerRadiusWithClipRRect(double radius) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: this,
    );
  }

  /// add opacity to parent widget
  Widget opacity({
    required double opacity,
    int durationInSecond = 1,
    Duration? duration,
  }) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: duration ?? const Duration(milliseconds: 500),
      child: this,
    );
  }

  /// add rotation to parent widget
  Widget rotate({
    required double angle,
    bool transformHitTests = true,
    Offset? origin,
  }) {
    return Transform.rotate(
      origin: origin,
      angle: angle,
      transformHitTests: transformHitTests,
      child: this,
    );
  }

  /// add scaling to parent widget
  Widget scale({
    required double scale,
    Offset? origin,
    AlignmentGeometry? alignment,
    bool transformHitTests = true,
  }) {
    return Transform.scale(
      scale: scale,
      origin: origin,
      alignment: alignment,
      transformHitTests: transformHitTests,
      child: this,
    );
  }

  /// add translate to parent widget
  Widget translate({
    required Offset offset,
    bool transformHitTests = true,
    Key? key,
  }) {
    return Transform.translate(
      offset: offset,
      transformHitTests: transformHitTests,
      key: key,
      child: this,
    );
  }

  /// set parent widget in center
  Widget center({double? heightFactor, double? widthFactor}) {
    return Center(
      heightFactor: heightFactor,
      widthFactor: widthFactor,
      child: this,
    );
  }

  /// add Expanded to parent widget
  Widget expand({flex = 1}) => Expanded(flex: flex, child: this!);

  /// add Flexible to parent widget
  Widget flexible({flex = 1, FlexFit? fit}) {
    return Flexible(flex: flex, fit: fit ?? FlexFit.loose, child: this!);
  }

  /// add FittedBox to parent widget
  Widget fit({BoxFit? fit, AlignmentGeometry? alignment}) {
    return FittedBox(
      fit: fit ?? BoxFit.contain,
      alignment: alignment ?? Alignment.center,
      child: this,
    );
  }

  /// Validate given widget is not null and returns given value if null.
  Widget validate({Widget value = const SizedBox()}) => this ?? value;
}
