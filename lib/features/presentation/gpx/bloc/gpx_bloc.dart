import 'dart:io';

import 'package:base_template_bloc/core/helpers/execute_location.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:latlong2/latlong.dart';
import 'package:path_provider/path_provider.dart';

part 'gpx_event.dart';
part 'gpx_state.dart';

class GpxBloc extends Bloc<GpxEvent, GpxState> {
  GpxBloc() : super(Initial()) {
    on<ImportFile>(_importFile);
    on<ResetFile>(_resetFile);
    on<SaveFile>(_saveFile);
  }
  final LocationAnalysis _locationAnalysis = LocationAnalysis();

  Future<void> _importFile(ImportFile event, Emitter<GpxState> emit) async {
    emit(Loading());
    // Mở hộp thoại chọn file
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null) {
      final file = result.files.single;
      final filePath = file.path;

      if (filePath != null) {
        try {
          // Read the file content
          final fileContent = await File(filePath).readAsString();
          
          // Get the directory to save the file
          final directory = await getApplicationDocumentsDirectory();
          final localPath = '${directory.path}/${file.name}';

          // Save the file to local storage
          final localFile = File(localPath);
          await localFile.writeAsString(fileContent);

          print('File saved to: $localPath');

          // Analyze the file content
          final locationModel =
              await _locationAnalysis.locationAnalysis(fileContent);

          // Do something with the analyzed data
          print('File name: ${locationModel.name}');
          print('Waypoints: ${locationModel.waypoints}');
          print('Track Points: ${locationModel.trackPoints}');
          print('Route Points: ${locationModel.routePoints}');
          emit(GpxLoaded(
            name: locationModel.name,
            waypoints: locationModel.waypoints,
            trackPoints: locationModel.trackPoints,
            routePoints: locationModel.routePoints,
          ));
        } catch (e) {
          print('Error reading or analyzing file: $e');
        }
      }
    }
  }

  void _resetFile(ResetFile event, Emitter<GpxState> emit) {}

  void _saveFile(SaveFile event, Emitter<GpxState> emit) {}
}
