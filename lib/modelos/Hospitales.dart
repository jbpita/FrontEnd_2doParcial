import 'package:flutter/material.dart';
import './Get.dart' as Get;
import 'package:frontend_2doparcial/modelos/clases/Hospital.dart';

class Hospitales extends StatelessWidget {
  const Hospitales({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<Hospital>> datos = Get.getHospitales('hospitales');
    return FutureBuilder(
      future: datos,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data);
          return GridView.count(
            crossAxisCount: 2,
            children: _listHospitales(snapshot.data , context),
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
  List<Widget> _listHospitales(List<Hospital> data , context) {
    List<Widget> hospitales = [];
    for (var item in data) {
      hospitales.add(
        GestureDetector(
          onTap: () => {Navigator.pushNamed(context, '/vistaItem')},
          child: Card(
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
            ),
            
          ),
        )
      );
    }
    return hospitales;
  }
}