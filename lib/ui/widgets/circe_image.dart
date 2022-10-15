import 'package:cached_network_image/cached_network_image.dart';
import 'package:music_for_everyone/common_libs.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({
    Key? key,
    required this.imageLink,
    required this.size,
  }) : super(key: key);

  final String imageLink;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.toDynamicWidth(context),
      height: size.toDynamicWidth(context),
      child: CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(
          imageLink,
        ),
        onBackgroundImageError: (exception, stackTrace) =>
            const SizedBox.shrink(),
      ),
    );
  }
}
