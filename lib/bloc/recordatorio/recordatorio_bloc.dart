import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:meta/meta.dart';
import 'package:prestpuesta/class/materiales.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:prestpuesta/class/recordatorio.dart';
import 'package:prestpuesta/helpers/notification_service.dart';
part 'recordatorio_event.dart';
part 'recordatorio_state.dart';

class RecordatorioBloc extends Bloc<RecordatorioEvent, RecordatorioState> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Materiales materiales = Materiales();
  Map<String, dynamic> valores = {
    "nombre": "",
    "recordatorio": "",
    "date": DateTime,
    'isNotificacion': false,
  };
  NotificationService notificationService = NotificationService();

  RecordatorioBloc() : super(RecordatorioState()) {
    tz.initializeTimeZones();
    on<RecordatorioEvent>((event, emit) {
      // TODO: implement event handler
      if (event is OnAddRecordatorio) {
        emit(state.copyWith(recordatorios: event.recordatorios));
      } else if (event is OnDeletRecordatorio) {
        materiales.setRecordatorio(event.recordatorios.getMap());
        emit(state.copyWith(recordatorios: event.recordatorios));
      }
    });
  }
  void setvalores(String nombre, dynamic valor) {
    valores[nombre] = valor;
  }

  void addRecordatorio() {
    final ListRecordatorio lista = state.recordatorios ?? ListRecordatorio();
    final recorda = Recordatorio(
        id: DateTime.now().microsecond,
        idp: DateTime.now().millisecond,
        nombre: valores['nombre'],
        recordatorio: valores['recordatorio'],
        fech: valores['date'].toString());
    lista.list.add(recorda);
    add(OnAddRecordatorio(recordatorios: lista));
    materiales.setRecordatorio(lista.getMap());
    if (valores['isNotificacion']) {
      notificationService.showNotification(
          recorda.idp, recorda.nombre, recorda.recordatorio, valores['date']);
    }
    formKey.currentState!.reset();
    valores['isNotificacion'] = false;
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  void deletRecordatorio(Recordatorio recordatorio) {
    if (recordatorio.fecha != 'DateTime') {
      notificationService.cancelAllNotifications(recordatorio.idp);
    }
    add(OnDeletRecordatorio(state.recordatorios!, recordatorio.id));
  }

  void init() async {
    final exist = state.recordatorios?.list ?? [];
    if (exist.isEmpty) {
      add(OnAddRecordatorio(recordatorios: materiales.getRecordatorios()));
    }
  }
}
