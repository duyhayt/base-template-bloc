part of 'gpx_bloc.dart';

sealed class GpxState extends Equatable {
  const GpxState();

  @override
  List<Object> get props => [];
}

final class Initial extends GpxState {}

final class Loading extends GpxState {}

class GpxLoaded extends GpxState {
  final String name;
  final List<LatLng> waypoints;
  final List<LatLng> trackPoints;
  final List<LatLng> routePoints;
  const GpxLoaded(
      {required this.name,
      required this.waypoints,
      required this.trackPoints,
      required this.routePoints});

  @override
  List<Object> get props => [name, waypoints, trackPoints, routePoints];
}

final class LoadingError extends GpxState {
  final String message;
  const LoadingError(this.message);

  @override
  List<Object> get props => [message];
}
