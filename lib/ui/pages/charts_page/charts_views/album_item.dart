import 'package:cached_network_image/cached_network_image.dart';
import 'package:music_for_everyone/common_libs.dart';
import 'package:music_for_everyone/ui/pages/details_pages/album_details_page/album_details_page_view.dart';

import '../../../../core/models/m_album_album.dart';

class AlbumItem extends StatelessWidget {
  const AlbumItem({
    Key? key,
    required this.album,
    this.position,
  }) : super(key: key);

  final MAlbumAlbum album;
  final int? position;

  void _onTap(BuildContext context) {
    context.navigatorPush(AlbumDetailsPageView(
      album: album,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onTap(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _image(context),
              const Spacer(),
              Text("#${position ?? album.position}",
                  style: context.textTheme.displayMedium),
            ],
          ),
          Text(
            album.title ?? "",
            style: context.textTheme.titleLarge,
          ),
          Text(
            album.artist?.name ?? "",
            style: context.textTheme.titleMedium,
          ),
        ],
      ),
    );
  }

  SizedBox _image(BuildContext context) {
    return SizedBox(
      width: 0.5.toDynamicWidth(context),
      height: 0.5.toDynamicWidth(context),
      child: CachedNetworkImage(
        imageUrl: album.cover ?? "",
        fit: BoxFit.contain,
        errorWidget: (_, __, ___) => const SizedBox.shrink(),
      ),
    );
  }
}
