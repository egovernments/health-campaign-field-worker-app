import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cache_progress.freezed.dart';

/// This is a cubit that listens to the download progress of the tiles
/// and emits the progress to the UI.
///
///   * [CacheProgressCubit] is a cubit that listens to the download progress of the tiles
///   * [CacheProgressState] is the state of the cubit
///   * [recordProgress] is a method that records the progress of the download
///   * [DownloadProgress] is a class that contains the progress of the download
///   * [DownloadProgress.percentageProgress] is the percentage of the download
///   * [DownloadProgress.totalBytes] is the total bytes of the download
///   * [DownloadProgress.downloadedBytes] is the downloaded bytes of the download
///   * [DownloadProgress.speed] is the speed of the download
///   * [DownloadProgress.remainingTime] is the remaining time of the download
///   * [DownloadProgress.remainingBytes] is the remaining bytes of the download
///
/// ```dart
/// @override
/// Widget build(BuildContext context) {
///   return BlocBuilder<CacheProgressCubit, CacheProgressState>(
///     builder: (context, state) {
///       return Text('${state.progress?.percentageProgress}');
///     },
///   );
/// }
/// ```
class CacheProgressCubit extends Cubit<CacheProgressState> {
  CacheProgressCubit(super.initialState);

  void recordProgress(DownloadProgress? progress) {
    if (progress == null) {
      emit(const CacheProgressState());
      return;
    }
    if (progress.percentageProgress / 100 == 1) {
      emit(const CacheProgressState());
    }
    emit(state.copyWith(progress: progress));
  }
}

@freezed
class CacheProgressState with _$CacheProgressState {
  const factory CacheProgressState([
    DownloadProgress? progress,
  ]) = _CacheProgressState;
}
