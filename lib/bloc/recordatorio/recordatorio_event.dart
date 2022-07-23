part of 'recordatorio_bloc.dart';

@immutable
abstract class RecordatorioEvent {}

class OnAddRecordatorio extends RecordatorioEvent {
  final ListRecordatorio recordatorios;

  OnAddRecordatorio({required this.recordatorios});
}

class OnDeletRecordatorio extends RecordatorioEvent {
  final ListRecordatorio recordatorios;
  final int id;

  OnDeletRecordatorio(this.recordatorios, this.id) {
    delet();
  }
  void delet() {
    recordatorios.list.removeWhere((e) => e.id == id);
  }
}
