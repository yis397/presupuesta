part of "../widget.dart";

class FormAdd extends StatefulWidget {
  final IconData icon;
  final Widget data;
  const FormAdd({Key? key, required this.icon, required this.data})
      : super(key: key);

  @override
  State<FormAdd> createState() => _FormAddState();
}

class _FormAddState extends State<FormAdd> {
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      elevation: 0,
      expansionCallback: (index, isExpanded) {
        setState(() {
          _items[index]['isExpanded'] = !isExpanded;
        });
      },
      animationDuration: const Duration(milliseconds: 600),
      children: _items
          .map(
            (item) => ExpansionPanel(
              canTapOnHeader: true,
              backgroundColor: item['isExpanded'] == true
                  ? Colors.deepOrange.shade50
                  : Colors.white,
              headerBuilder: (_, isExpanded) => Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 50,
                      ),
                      Icon(
                        widget.icon,
                        size: 30,
                        color: Color(colores["terciario"]!),
                      )
                    ],
                  )),
              body: widget.data,
              isExpanded: item['isExpanded'],
            ),
          )
          .toList(),
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Map<String, dynamic>> _items =
    List.generate(1, (index) => {'id': index, 'isExpanded': false});
