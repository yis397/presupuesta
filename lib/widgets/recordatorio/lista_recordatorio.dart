part of 'package:prestpuesta/widgets/widget.dart';

class ListRecordatorio extends StatelessWidget {
  final List<Recordatorio> list;
  const ListRecordatorio({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<RecordatorioBloc>(context);
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, index) {
          return Card(
              child: MaterialButton(
            onPressed: () {
              _showAlert(context, list[index].recordatorio, list[index].nombre,
                  list[index].fecha);
            },
            child: ListTile(
              title: Text(list[index].nombre),
              trailing: IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () {
                  bloc.deletRecordatorio(list[index]);
                },
              ),
            ),
          ));
        });
  }

  Future<void> _showAlert(
      context, String text, String nombre, String fecha) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(nombre),
          content: SingleChildScrollView(
            child: ListBody(
              children: [Text(text), Text("Fecha:$fecha")],
            ),
          ),
          actions: <Widget>[
            TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ],
        );
      },
    );
  }
}
