part of 'search_results_view.dart';

mixin _SearchResultsMixin {
  Future<List<Widget>> fetchItems<T>(MSearch search) async {
    List<T>? itemsFromDeezer = await DioSearch(Dio()).fetchSearch<T>(search);
    if (itemsFromDeezer == null) return [];
    return List.generate(
      itemsFromDeezer.length,
      (index) => _getItem<T>(itemsFromDeezer[index], index),
    );
  }

  Widget _getItem<T>(dynamic value, int index) {
    if (T == MTrackTrack) {
      return TrackItem(track: (value as MTrackTrack), position: index.plusOne);
    } else if (T == MAlbumAlbum) {
      return AlbumItem(album: (value as MAlbumAlbum), position: index.plusOne);
    } else if (T == MArtistArtist) {
      return ArtistItem(
          artist: (value as MArtistArtist), position: index.plusOne);
    }
    return const SizedBox.shrink();
  }
}
