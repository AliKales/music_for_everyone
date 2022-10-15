import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:music_for_everyone/common_libs.dart';
import 'package:music_for_everyone/core/state_management/provider/provider_values.dart';
import 'package:music_for_everyone/core/utils/string_utils.dart';
import 'package:music_for_everyone/styles/colors.dart';
import 'package:provider/provider.dart';

extension NumExtension on num {
  double toDynamicHeight(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return height * this;
  }

  double toDynamicWidth(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return width * this;
  }

  double toPercent(num max) {
    return 100 * (this / max);
  }

  ///[zeroToOnePercent] = 0.0->1.0
  double get zeroToOnePercent {
    double result = toInt() * 0.01;
    if (result > 1.0) result = 1.0;
    return result;
  }
}

extension IntExtension on int {
  Duration get toDuration => Duration(milliseconds: this);

  int get plusOne => this + 1;
  int get minusOne => this - 1;
}

extension ContextExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  TextTheme get textTheme => Theme.of(this).textTheme;

  Widget sizedBox({double height = 0, double width = 0}) {
    return SizedBox(
      height: height * this.height,
      width: width * this.width,
    );
  }

  void afterBuild(Function(Duration) afterBuild) {
    WidgetsBinding.instance.addPostFrameCallback(afterBuild);
  }

  AppLocalizations get texts => provider<ProviderValues>().strings;

  T provider<T>() {
    return Provider.of<T>(this, listen: false);
  }

  T providerListen<T>() {
    return Provider.of<T>(this);
  }

  Future<dynamic> navigatorPush(page) async {
    MaterialPageRoute route = MaterialPageRoute(builder: (context) => page);
    var object = await Navigator.push(this, route);
    return object;
  }

  void navigatorPushReplacement(page) {
    MaterialPageRoute route = MaterialPageRoute(builder: (context) => page);
    Navigator.pushReplacement(this, route);
  }

  RelativeRect get toRelativeRec {
    //*get the render box from the context
    final RenderBox renderBox = findRenderObject() as RenderBox;
    //*get the global position, from the widget local position
    final offset = renderBox.localToGlobal(Offset.zero);

    //*calculate the start point in this case, below the button
    final left = offset.dx;
    final top = offset.dy + renderBox.size.height;
    //*The right does not indicates the width
    final right = left + renderBox.size.width;

    return RelativeRect.fromLTRB(left, top, right, 0.0);
  }
}

extension WidgetExtension on Widget {
  Widget? toVisible(bool isVisible) {
    if (isVisible) return null;

    return this;
  }

  Widget toEmpty(bool isVisible) {
    if (isVisible) return const SizedBox.shrink();

    return this;
  }

  Widget loading(bool isLoading) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator.adaptive());
    }

    return this;
  }

  Widget get center => Center(
        child: this,
      );

  Widget get centerColumn => Column(
        children: [
          const Spacer(),
          this,
          const Spacer(),
        ],
      );
  Widget get centerRow => Row(
        children: [
          const Spacer(),
          this,
          const Spacer(),
        ],
      );

  Widget scaffoldPadding(BuildContext context) => Padding(
        padding: AppPaddings.scaffold(context),
        child: this,
      );
}

extension TextExtension on Text {
  Widget get toBold {
    return Text(
      data ?? "",
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }
}

extension TextStyleExtension on TextStyle {
  TextStyle get colorBW {
    return copyWith(color: AppColors().blackOrWhite);
  }

  TextStyle get colorBWRevers {
    return copyWith(color: AppColors().blackOrWhiteReverse);
  }

  TextStyle get toBold {
    return copyWith(fontWeight: FontWeight.bold);
  }
}

extension ListExtension on List {
  int get count => length - 1;
}

extension ScaffoldExtension on Scaffold {
  Widget withBackFunc(BuildContext context, [VoidCallback? onBackTap]) {
    return WillPopScope(
      child: this,
      onWillPop: () async {
        onBackTap?.call();

        context.go("/");

        return false;
      },
    );
  }
}

extension StringExtension on String? {
  int get toInt {
    return int.tryParse(this ?? "") ?? 0;
  }

  String localize(Map<String, String> supplants) {
    if (this == null) return "error";
    return StringUtils.supplant(this!, supplants);
  }

  String get removeLast {
    if (isEmptyOrNull) return "";
    return this!.substring(0, this!.length - 1);
  }

  bool get isNotEmptyAndNull {
    return this != null && this!.trim() != "";
  }

  bool get isEmptyOrNull {
    return this == null || this?.trim() == "";
  }
}
