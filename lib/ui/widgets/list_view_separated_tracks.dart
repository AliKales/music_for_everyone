import 'package:music_for_everyone/common_libs.dart';

import '../../core/models/m_track_track.dart';
import '../pages/charts_page/charts_views/track_item.dart';

class ListViewSeparatedTracks extends ListView {
  ListViewSeparatedTracks({super.key, 
    required List<MTrackTrack> tracks,
    required String? pic,
  }) : super.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) => context.sizedBox(height: 0.03),
          itemCount: tracks.length,
          itemBuilder: (context, index) {
            MTrackTrack track = tracks[index];
            track.artist?.picture = pic;
            return TrackItem(
              track: tracks[index],
              position: index + 1,
            );
          },
        );
}
