import 'package:music_for_everyone/common_libs.dart';

import '../../styles/border_radius.dart';
import '../../styles/colors.dart';
import '../../styles/texts.dart';
import 'ios_arrow_icon.dart';

class ButtonWithDropDown extends StatefulWidget {
  const ButtonWithDropDown({
    Key? key,
    required this.items,
    required this.onItemChange,
  }) : super(key: key);

  final List<String> items;
  final Function(int) onItemChange;

  @override
  State<ButtonWithDropDown> createState() => _ButtonWithDropDownState();
}

class _ButtonWithDropDownState extends State<ButtonWithDropDown> {
  double _heightOfButton = 0;

  int _selectedItem = 0;

  final GlobalKey _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    context.afterBuild((p0) {
      setState(() {
        _heightOfButton = _key.currentContext!.size!.height;
        _heightOfButton = _heightOfButton * 0.5;
      });
    });
  }

  void onPressed() async {
    int? result = await showMenu<int>(
      context: context,
      position: context.toRelativeRec,
      items: List.generate(
        widget.items.length,
        (index) => PopupMenuItem(
          value: index,
          textStyle: TextStyle(
            color: AppColors().white,
          ),
          child: Text(
            widget.items[index],
          ),
        ),
      ),
    );
    if (result == null) return;
    setState(() {
      _selectedItem = result;
    });
    widget.onItemChange.call(result);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: _key,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: CustomBorderRadius.allSmallX(),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.items[_selectedItem].toUpperCase(),
            style: Texts.filledButton(context),
          ),
          context.sizedBox(width: 0.03),
          AnimatedContainer(
            duration: 700.ms,
            curve: Curves.bounceOut,
            width: 2,
            height: _heightOfButton,
            color: AppColors().white,
          ),
          context.sizedBox(width: 0.03),
          IosArrowIcon(
            size: 20,
          )
        ],
      ),
    );
  }
}
