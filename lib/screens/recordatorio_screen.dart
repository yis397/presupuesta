import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prestpuesta/theme/theme.dart';
import 'package:prestpuesta/widgets/widget.dart';

import '../bloc/recordatorio/recordatorio_bloc.dart';

class RecordatorioScreen extends StatelessWidget {
  const RecordatorioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(body: SingleChildScrollView(
      child: BlocBuilder<RecordatorioBloc, RecordatorioState>(
        builder: (context, state) {
          return Column(children: [
            HeadC(
              size,
              'Recordatorio',
              1,
              'assets/img/muro.jpg',
              'Agregue un recordatorio',
              height: .25,
              height2: .1,
            ),
            FormAdd(
              icon: Icons.edit,
              data: Form(
                key: context.read<RecordatorioBloc>().formKey,
                child: Column(
                  children: [
                    const TextInputs(
                        nombre: "nombre",
                        unidad: "",
                        val: 3,
                        tipo: TextInputType.name,
                        bloc: 3,
                        anch: 300),
                    const TextInputs(
                        nombre: "recordatorio",
                        unidad: "",
                        val: 2,
                        tipo: TextInputType.text,
                        bloc: 3,
                        anch: 300),
                    MyCheckBox(
                      context: context,
                    ),
                    MaterialButton(
                        onPressed: () {
                          if (!context.read<RecordatorioBloc>().isValidForm()) {
                            return;
                          }
                          context.read<RecordatorioBloc>().addRecordatorio();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Color((colores["terciario"]!)),
                              borderRadius: BorderRadius.circular(50)),
                          child: Titulo("Guardar", 15, 4, 0xffFFFFFF),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * .6,
              child: ListRecordatorio(
                list: state.recordatorios?.list ?? [],
              ),
            )
          ]);
        },
      ),
    ));
  }
}

class MyCheckBox extends StatefulWidget {
  final BuildContext context;
  const MyCheckBox({Key? key, required this.context}) : super(key: key);

  @override
  State<MyCheckBox> createState() => _MyCheckBox();
}

class _MyCheckBox extends State<MyCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.orange;
    }

    return Row(
      children: [
        const Center(
          widthFactor: 2,
          child: Text('Recibir notificaciones'),
        ),
        Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: isChecked,
          onChanged: (bool? value) async {
            setState(() {
              isChecked = value!;
              widget.context
                  .read<RecordatorioBloc>()
                  .setvalores('isNotificacion', value);
            });
            if (value!) {
              DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030));
              if (newDate != null) {
                TimeOfDay? picked = await showTimePicker(
                    context: context,
                    initialTime: const TimeOfDay(hour: 12, minute: 25));
                final date = newDate
                    .add(Duration(hours: picked!.hour, minutes: picked.minute));

                // ignore: use_build_context_synchronously
                widget.context
                    .read<RecordatorioBloc>()
                    .setvalores('date', date);
              }
            }
          },
        )
      ],
    );
  }
}
