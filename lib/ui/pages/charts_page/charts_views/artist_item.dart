import 'package:music_for_everyone/common_libs.dart';
import 'package:music_for_everyone/core/models/m_artist_artist.dart';
import 'package:music_for_everyone/styles/colors.dart';
import 'package:music_for_everyone/ui/pages/details_pages/artist_details_page/artist_details_page_view.dart';

import '../../../widgets/circe_image.dart';

class ArtistItem extends StatelessWidget {
  const ArtistItem({super.key, required this.artist, this.position});

  final MArtistArtist artist;
  final int? position;

  void _handleTap(BuildContext context) {
    context.navigatorPush(ArtistDetailsPageView(
      artist: artist,
      position: position,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _handleTap(context),
      child: Card(
        color: AppColors().blackOrWhiteReverse,
        child: Row(
          children: [
            _image(context),
            context.sizedBox(width: 0.01),
            Expanded(
              child: Text(
                artist.name ?? "",
                style: context.textTheme.titleLarge,
                overflow: TextOverflow.fade,
                softWrap: false,
              ),
            ),
            Text(
              "#${position ?? artist.position}",
              style: context.textTheme.headlineMedium,
            ).toEmpty(position == null),
          ],
        ),
      ),
    );
  }

  Widget _image(BuildContext context) {
    return Padding(
      padding: const AppPaddings.allSmall(),
      child: Hero(
          tag: artist.id!,
          child: CircleImage(size: 0.2, imageLink: artist.picture ?? "")),
    );
  }
}
