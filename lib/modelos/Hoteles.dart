import 'package:flutter/material.dart';
import './Get.dart' as Get;
import 'package:frontend_2doparcial/modelos/clases/Hotel.dart';

class Hoteles extends StatelessWidget {
  const Hoteles({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<Hotel>> datos = Get.get('hoteles');

    return FutureBuilder(
      future: datos,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data);
          return Text("Hola");
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return Text("Error");
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    /* ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          //color: ,
          child: Center(child: Text('Entry ')),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );*/
  }
}
