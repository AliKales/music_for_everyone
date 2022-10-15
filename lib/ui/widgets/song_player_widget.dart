import 'package:cached_network_image/cached_network_image.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_for_everyone/common_libs.dart';
import 'package:music_for_everyone/styles/colors.dart';

import '../../styles/border_radius.dart';

class SongPlayerWidget extends StatefulWidget {
  const SongPlayerWidget(
      {super.key,
      required this.imageLink,
      required this.title,
      required this.artistName,
      required this.songUrl});

  final String imageLink;
  final String title;
  final String artistName;
  final String songUrl;

  @override
  State<SongPlayerWidget> createState() => _SongPlayerWidgetState();
}

class _SongPlayerWidgetState extends State<SongPlayerWidget>
    with TickerProviderStateMixin {
  ValueNotifier<bool> isPlaying = ValueNotifier<bool>(false);
  late AnimationController progress;

  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    progress = AnimationController(vsync: this, duration: 400.ms);
    _setPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  Future<void> _setPlayer() async {
    player.playerStateStream.listen((event) {
      if (event.playing) {
        progress.animateTo(1.0);
      } else {
        progress.animateTo(0.0);
      }

      if (event.processingState == ProcessingState.completed) {
        progress.animateTo(0.0);
      }
    });
    await player.setUrl(widget.songUrl);
    await player.setLoopMode(LoopMode.one);
  }

  void _play() async => await player.play();
  void _pause() async => await player.pause();

  void _onPlayPause() {
    if (progress.value == 0.0) {
      _play();
    } else {
      _pause();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: CustomBorderRadius.allSmall(),
        color: Colors.grey,
      ),
      padding: const AppPaddings.allMedium(),
      child: Row(
        children: [
          _image(widget.imageLink),
          context.sizedBox(width: 0.02),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title,
                    style: context.textTheme.titleMedium!.colorBWRevers.toBold,
                    overflow: TextOverflow.fade,
                    softWrap: false),
                Text(widget.artistName,
                    style: context.textTheme.titleMedium!.colorBWRevers,
                    overflow: TextOverflow.fade,
                    softWrap: false),
              ],
            ),
          ),
          InkWell(
            onTap: _onPlayPause,
            child: AnimatedIcon(
                color: AppColors().white,
                size: 30,
                icon: AnimatedIcons.play_pause,
                progress: progress),
          )
        ],
      ),
    );
  }

  Widget _image(String imageLink) {
    return ClipRRect(
      borderRadius: CustomBorderRadius.allSmall(),
      child: CachedNetworkImage(
        imageUrl: imageLink,
        width: 0.14.toDynamicWidth(context),
        height: 0.14.toDynamicWidth(context),
        fit: BoxFit.contain,
      ),
    );
  }
}
