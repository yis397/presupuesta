part of 'recordatorio_bloc.dart';

class RecordatorioState {
  final ListRecordatorio? recordatorios;

  RecordatorioState({this.recordatorios});

  RecordatorioState copyWith({ListRecordatorio? recordatorios}) =>
      RecordatorioState(recordatorios: recordatorios ?? this.recordatorios);
}
