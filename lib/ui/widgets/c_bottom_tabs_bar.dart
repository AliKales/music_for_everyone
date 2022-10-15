import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:music_for_everyone/common_libs.dart';
import 'package:music_for_everyone/styles/colors.dart';

class CBottomTabsBar extends StatefulWidget {
  const CBottomTabsBar(
      {super.key,
      required this.selectedPage,
      required this.onTabPress,
      required this.items});

  final int selectedPage;
  final Function(int) onTabPress;
  final List<String> items;

  @override
  State<CBottomTabsBar> createState() => _CBottomTabsBarState();
}

class _CBottomTabsBarState extends State<CBottomTabsBar> {
  double _widthItem = 0;
  double _singleItemWidth = 0;
  final double _selectorHeight = 2;
  int _selectedItem = 0;
  final double _padding = 0.05;
  final Duration _delay = 150.toDuration;
  late LinkedScrollControllerGroup _controllers;
  late ScrollController _sCSelector;
  late ScrollController _sCItems;

  @override
  void initState() {
    super.initState();
    _controllers = LinkedScrollControllerGroup();
    _sCSelector = _controllers.addAndGet();
    _sCItems = _controllers.addAndGet();
  }

  @override
  void dispose() {
    _sCSelector.dispose();
    _sCItems.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CBottomTabsBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    setState(() {
      _selectedItem = widget.selectedPage;
    });
  }

  void _handleTap(int index) {
    if (index == _selectedItem) return;

    widget.onTabPress.call(index);
  }

  @override
  Widget build(BuildContext context) {
    _widthItem = context.width;
    _singleItemWidth = _widthItem / 2.5;
    return SizedBox(
      height: 0.08.toDynamicHeight(context),
      child: Stack(
        children: [
          Center(child: _items()),
          _selector(),
        ],
      ),
    );
  }

  Widget _selector() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: _sCSelector,
      child: SizedBox(
        width: _singleItemWidth * widget.items.length,
        child: Row(
          children: [
            AnimatedSize(
              duration: _delay,
              child: SizedBox(
                width: (_selectedItem * _singleItemWidth),
              ),
            ),
            _selectorPadding(),
            Container(
              color: AppColors().blackOrWhite,
              height: _selectorHeight,
              width: _singleItemWidth - (_padding.toDynamicWidth(context) * 2),
            ),
            _selectorPadding(),
          ],
        ),
      ),
    );
  }

  SizedBox _selectorPadding() =>
      SizedBox(width: _padding.toDynamicWidth(context));

  Widget _items() {
    return SingleChildScrollView(
      controller: _sCItems,
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
          widget.items.length,
          (index) => _item(index),
        ),
      ),
    );
  }

  Widget _item(int index) {
    return SizedBox(
      width: _singleItemWidth,
      child: InkWell(
        onTap: () => _handleTap(index),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Padding(
          padding: AppPaddings.navBarPadding(context),
          child: Center(
            child: Text(
              widget.items[index],
            ),
          ),
        ),
      ),
    );
  }
}
