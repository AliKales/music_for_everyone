import 'package:music_for_everyone/common_libs.dart';

import '../../styles/colors.dart';

class TextFieldGradient extends StatelessWidget {
  const TextFieldGradient({
    Key? key,
    this.hintText,
    this.suffixIcon,
    this.onSubmitted,
  }) : super(key: key);

  final String? hintText;
  final Widget? suffixIcon;
  final Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextField(
          style: context.textTheme.titleLarge,
          onSubmitted: onSubmitted,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            alignment: Alignment.bottomCenter,
            width: double.maxFinite,
            height: 0.005.toDynamicHeight(context),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  AppColors().accent1,
                  AppColors().accent1Off,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
