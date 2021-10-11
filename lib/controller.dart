import 'package:flutter/material.dart';

class Controller extends StatefulWidget {
  @override
  _ControllerState createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {

  final int bitcoinPrice = 20000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Stream builder'),
          centerTitle: true,
        ),
        body: StreamBuilder<int>(
          initialData: bitcoinPrice,
          stream: bitPrice(),
          builder: (context, snapshot) {
            final bitCoin = snapshot.data!.toStringAsFixed(2);
            return Center(
              child: Text(
                bitCoin,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue
                ),
              ),
            );
          },
        ));
  }

  Stream<int> bitPrice() {
    return Stream<int>.periodic(
      Duration(seconds: 1),
      (count) => bitcoinPrice + count,
    );
  }
}
