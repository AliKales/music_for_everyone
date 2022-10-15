import 'package:music_for_everyone/common_libs.dart';
import 'package:music_for_everyone/gen/assets.gen.dart';
import 'package:music_for_everyone/styles/colors.dart';

import '../../core/state_management/provider/provider_page.dart';

class CBottomNavBar extends StatefulWidget {
  const CBottomNavBar({super.key, required this.selectedPage});

  final int selectedPage;

  @override
  State<CBottomNavBar> createState() => _CBottomNavBarState();
}

class _CBottomNavBarState extends State<CBottomNavBar> {
  final List<SvgGenImage> items = [
    Assets.icons.icHome,
    Assets.icons.icMusic,
    Assets.icons.icChat,
    Assets.icons.icUser,
  ];

  double _widthItem = 0;
  double _singleItemWidth = 0;
  final double _selectorHeight = 2;
  late int _selectedItem;
  final double _padding = 0.05;
  final Duration _delay = 150.toDuration;
  final double _height = 0.1;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.selectedPage;
  }

  @override
  void didUpdateWidget(covariant CBottomNavBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    setState(() {
      _selectedItem = widget.selectedPage;
    });
  }

  void _handleTap(int index) {
    if (index == _selectedItem) return;

    context.provider<ProviderPage>().changePage(index);
  }

  @override
  Widget build(BuildContext context) {
    _widthItem = context.width;
    _singleItemWidth = _widthItem / items.length;
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

  Row _selector() {
    return Row(
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
    );
  }

  SizedBox _selectorPadding() =>
      SizedBox(width: _padding.toDynamicWidth(context));

  Row _items() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
        items.length,
        (index) => _item(index),
      ),
    );
  }

  Widget _item(int index) {
    return Expanded(
      child: InkWell(
        onTap: () => _handleTap(index),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Padding(
          padding: AppPaddings.navBarPadding(context),
          child: items[index].svg(),
        ),
      ),
    );
  }
}
