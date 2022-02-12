import 'package:numberpicker/numberpicker.dart';
import 'package:flutter/material.dart';

class HostScreen extends StatefulWidget {
  const HostScreen({Key? key}) : super(key: key);

  @override
  State<HostScreen> createState() => _HostScreenState();
}

class _HostScreenState extends State<HostScreen> {
  int _currentValue = 3;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Table(
          children: [
            TableRow(
              children: [
                Text('Title'),
                Text('Quantity'),
                Text('Price'),
                Text('Summary'),
              ],
            ),
            TableRow(
              children: [
                Text('Chicken'),
                Text('1'),
                Text('1'),
                Text('1'),
              ],
            ),
            TableRow(
              children: [
                Text('1'),
                Text('1'),
                Text('1'),
                Text('1'),
              ],
            ),
          ],
        ),
        Center(
          child: Text('###3'),
        ),
        Text('Quantity widget'),
        Quantity(),
        Text('Price widget'),
        Container(
          width: 50,
          child: Price(),
        ),
      ],
    );
  }
}

class Price extends StatelessWidget {
  const Price({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
    );
  }
}

class Quantity extends StatefulWidget {
  const Quantity({
    Key? key,
  }) : super(key: key);

  @override
  State<Quantity> createState() => _QuantityState();
}

class _QuantityState extends State<Quantity> {
  int _number = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              _number -= 1;
            });
          },
          icon: Icon(Icons.remove, size: 12),
        ),
        Text("$_number"),
        IconButton(
          onPressed: () {
            setState(() {
              _number += 1;
            });
          },
          icon: Icon(Icons.add, size: 12),
        ),
      ],
    );
  }
}
