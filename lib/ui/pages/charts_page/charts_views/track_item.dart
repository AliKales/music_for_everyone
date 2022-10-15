import 'package:cached_network_image/cached_network_image.dart';
import 'package:music_for_everyone/common_libs.dart';
import 'package:music_for_everyone/ui/pages/details_pages/track_details_page/track_details_page_view.dart';

import '../../../../core/models/m_track_track.dart';
import '../../../../styles/border_radius.dart';
import '../../../../styles/colors.dart';

class TrackItem extends StatelessWidget {
  const TrackItem({
    Key? key,
    required this.track,
    this.position,
  }) : super(key: key);

  final MTrackTrack track;
  final int? position;

  int? get _getPosition => position ?? track.position;

  void _handleTap(BuildContext context) {
    context
        .navigatorPush(TrackDetailsPageView(tag: _getPosition!, track: track));
  }

  @override
  Widget build(BuildContext context) {
    const double imageSize = 0.2;

    return InkWell(
      onTap: () => _handleTap(context),
      child: ClipRRect(
        borderRadius: CustomBorderRadius.allCard(),
        child: Card(
          shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          color: AppColors().blackOrWhiteReverse,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _image(imageSize, context),
              context.sizedBox(width: 0.02),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(track.title ?? "",
                        style: context.textTheme.titleLarge,
                        softWrap: false,
                        overflow: TextOverflow.fade),
                    Text(track.artist?.name ?? "",
                        style: context.textTheme.titleMedium),
                  ],
                ),
              ),
              Text(
                "#$_getPosition",
                style: context.textTheme.headlineMedium,
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _image(double imageSize, BuildContext context) {
    return SizedBox(
      width: imageSize.toDynamicWidth(context),
      height: imageSize.toDynamicWidth(context),
      child: Hero(
        tag: _getPosition!,
        child: CachedNetworkImage(
            imageUrl: track.artist?.picture ?? "",
            errorWidget: (_, __, ___) => const SizedBox.shrink()),
      ),
    );
  }
}
