import 'package:auto_route/auto_route.dart';
import 'package:digit_maps/bloc/cache_progress/cache_progress.dart';
import 'package:digit_maps/bloc/map_path/map_path_bloc.dart';
import 'package:digit_maps/main.dart';
import 'package:digit_maps/router/maps_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';
import 'package:latlong2/latlong.dart';

@RoutePage()
class MapPathPage extends StatelessWidget {
  const MapPathPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MapPathBloc>();
    return BlocProvider(
      create: (_) => CacheProgressCubit(const CacheProgressState()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Planned routes'),
        ),
        body: BlocBuilder<MapPathBloc, MapPathState>(
          builder: (context, state) {
            if (state.coordinates.isEmpty) {
              return const Center(child: Text('No data'));
            }

            /// Display list of planned routes
            return BlocBuilder<CacheProgressCubit, CacheProgressState>(
                builder: (_, cache) => Stack(
                      children: [
                        Positioned.fill(
                          child: ListView.builder(
                            itemCount: state.coordinates.length,
                            itemBuilder: (ctx, index) {
                              final coordinate =
                                  state.coordinates.elementAt(index);
                              return PathCard(
                                index: index,
                                coordinate: coordinate,
                                onDelete: () {
                                  bloc.add(MapDeletePathEvent(index: index));
                                },
                                onTap: (coordinate) {
                                  bloc.add(
                                    MapGetDirectionsEvent(
                                        coordinatePair: coordinate),
                                  );
                                },
                                onDownloadProgress: (event) {
                                  ctx
                                      .read<CacheProgressCubit>()
                                      .recordProgress(event);
                                },
                              );
                            },
                          ),
                        ),
                        if (cache.progress != null &&
                            cache.progress!.percentageProgress != 100)
                          Positioned.fill(
                            child: Container(
                              color: Colors.black.withAlpha(120),
                              child: Center(
                                child: AlertDialog(
                                  title: const Text('Cache in progress'),
                                  content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: 24,
                                            width: 24,
                                            child: CircularProgressIndicator(
                                              value: cache.progress!
                                                      .percentageProgress /
                                                  100,
                                            ),
                                          ),
                                          const SizedBox(width: 16),
                                          Text(
                                            '${cache.progress!.remainingTiles} tiles remaining.',
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        const FMTCStore('storeName')
                                            .download
                                            .cancel();
                                        context
                                            .read<CacheProgressCubit>()
                                            .recordProgress(null);
                                      },
                                      child: const Text('Cancel'),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ));
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // context.router.push(const HomeRoute());
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class PathCard extends StatelessWidget {
  final int index;
  final CoordinatePair coordinate;
  final VoidCallback onDelete;
  final ValueChanged<DownloadProgress> onDownloadProgress;
  final ValueChanged<CoordinatePair> onTap;

  const PathCard({
    Key? key,
    required this.index,
    required this.coordinate,
    required this.onDelete,
    required this.onDownloadProgress,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: ShapeDecoration(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        shadows: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            spreadRadius: 6,
            offset: const Offset(1, 4),
          )
        ],
        color: Theme.of(context).cardColor,
      ),
      child: GestureDetector(
        onTap: coordinate.path == null
            ? null
            : () {
                print('here');
                context.router.push(
                  MapPlotPageRoute(coordinatePair: coordinate),
                );
              },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Route ${index + 1}',
              style: theme.textTheme.bodySmall,
            ),
            const SizedBox(height: 8),
            _buildCoordinateWidget(
              context,
              coordinatePair: coordinate,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (coordinate.path != null)
                  TextButton(
                    onPressed: () {
                      final bBox = coordinate.path!.bbox;
                      final corner1 = LatLng(
                        bBox[1].toDouble(),
                        bBox[0].toDouble(),
                      );
                      final corner2 = LatLng(
                        bBox[3].toDouble(),
                        bBox[2].toDouble(),
                      );

                      final region = RectangleRegion(
                        LatLngBounds(corner1, corner2),
                      );

                      final downloadable = region.toDownloadable(
                        minZoom: 1,
                        maxZoom: 18,
                        options: TileLayer(
                          urlTemplate: tileTemplate,
                          userAgentPackageName: 'com.example.app',
                        ),
                      );

                      const FMTCStore('storeName')
                          .download
                          .startForeground(
                            region: downloadable,
                          )
                          .listen(onDownloadProgress)
                          .onError(
                            (error) => debugPrint('error: $error'),
                          );
                    },
                    child: const Text('Cache Route'),
                  )
                else
                  TextButton(
                    onPressed: () {
                      onTap(coordinate);
                    },
                    child: const Text('Download Route'),
                  ),
                ActionChip(
                  label: Text('Delete',
                      style: TextStyle(
                        color: theme.colorScheme.onError,
                      )),
                  avatar: Icon(
                    Icons.delete,
                    size: 16,
                    color: theme.colorScheme.onError,
                  ),
                  onPressed: onDelete,
                  backgroundColor: theme.colorScheme.error,
                  visualDensity: VisualDensity.compact,
                  padding: const EdgeInsets.all(0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCoordinateWidget(
    BuildContext context, {
    required CoordinatePair coordinatePair,
  }) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            _buildMapLabelField(
              context,
              title: 'Source',
              icon: Icons.home,
              coordinates: coordinatePair.source,
            ),
            const SizedBox(height: 16),
            _buildMapLabelField(
              context,
              title: 'Destination',
              icon: Icons.work,
              coordinates: coordinatePair.destination,
            ),
          ],
        ),
        Icon(
          Icons.directions_car_outlined,
          color: coordinate.path == null
              ? theme.disabledColor
              : theme.primaryColor,
        )
      ],
    );
  }

  Widget _buildMapLabelField(
    BuildContext context, {
    required String title,
    required IconData icon,
    required MapCoordinates coordinates,
  }) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(
          icon,
          color: theme.disabledColor.withOpacity(0.3),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: theme.textTheme.bodySmall),
            Text(
              [coordinates.lat, coordinates.lng]
                  .map((e) => e.toStringAsFixed(4))
                  .join(', '),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }
}
