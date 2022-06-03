part of "../widget.dart";

class FormAdd extends StatefulWidget {
  FormAdd({Key? key}) : super(key: key);

  @override
  State<FormAdd> createState() => _FormAddState();
}

class _FormAddState extends State<FormAdd> {
  final List<Item> _dat = [Item(expandedValue: "a", headerValue: "1")];

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      elevation: 0,
      expansionCallback: (index, isExpanded) {
        setState(() {
          _items[index]['isExpanded'] = !isExpanded;
        });
      },
      animationDuration: Duration(milliseconds: 600),
      children: _items
          .map(
            (item) => ExpansionPanel(
              canTapOnHeader: true,
              backgroundColor:
                  item['isExpanded'] == true ? Colors.cyan[100] : Colors.white,
              headerBuilder: (_, isExpanded) => Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Icon(
                        Icons.add_business_outlined,
                        size: 50,
                        color: Color(colores["terciario"]!),
                      )
                    ],
                  )),
              body: WForm(),
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
