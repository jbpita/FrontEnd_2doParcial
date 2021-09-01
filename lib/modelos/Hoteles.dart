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
          return GridView.count(
            crossAxisCount: 2,
            children: _listHoteles(snapshot.data),
          );
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
  List<Widget> _listHoteles(List<Hotel> data) {
    List<Widget> hoteles = [];
    for (var item in data) {
      hoteles.add(Card(
          child: Column(
        children: [
          Expanded(child: Text(item.nombre)),
          Expanded(child: Row(
            children:[
              Icon(
                Icons.star,
                color: Colors.blue,
              ),
              Text(item.nroEstrellas)
            ]
          ))
        ],
      )));
    }
    return hoteles;
  }
}
