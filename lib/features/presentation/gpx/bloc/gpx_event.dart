part of 'gpx_bloc.dart';

sealed class GpxEvent extends Equatable {
  const GpxEvent();

  @override
  List<Object> get props => [];
}

class ImportFile extends GpxEvent {
  const ImportFile();

  @override
  List<Object> get props => [];
}

class LoadFileFromLocal extends GpxEvent {
  const LoadFileFromLocal();

  @override
  List<Object> get props => [];
}

class ResetFile extends GpxEvent {
  const ResetFile();

  @override
  List<Object> get props => [];
}

class SaveFile extends GpxEvent {
  const SaveFile();

  @override
  List<Object> get props => [];
}
