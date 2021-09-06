import 'package:flutter/material.dart';
import 'package:frontend_2doparcial/modelos/VistaItem.dart';
import './Get.dart' as Get;
import 'package:frontend_2doparcial/modelos/clases/Hotel.dart';

class Hoteles extends StatelessWidget {
  const Hoteles({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<Hotel>> datos = Get.getHoteles('hoteles');

    return FutureBuilder(
      future: datos,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data);
          return GridView.count(
            crossAxisCount: 2,
            children: _listHoteles(snapshot.data , context),
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

  }
  List<Widget> _listHoteles(List<Hotel> data , context) {
    List<Widget> hoteles = [];
    for (var item in data) {
      hoteles.add(
        GestureDetector(
          onTap: () => {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => VistaItem(element: item)
              )
            )
          },
          child: Card(
            child: Column(
              children: [
                Expanded(child: Text(item.nombre)),
                Expanded(child: Image.network(item.logotipo,)),
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
            ),
          ),
        )  
      );
    }
    return hoteles;
  }
}
