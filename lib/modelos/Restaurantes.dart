import 'package:flutter/material.dart';
import './Get.dart' as Get;
import 'package:frontend_2doparcial/modelos/clases/Restaurante.dart';
import 'package:frontend_2doparcial/modelos/VistaItem.dart';

class Restaurantes extends StatelessWidget {
  const Restaurantes({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<Restaurante>> datos = Get.getRestaurantes('restaurantes');
    return FutureBuilder(
      future: datos,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data);
          return GridView.count(
            crossAxisCount: 2,
            children: _listRestaurantes(snapshot.data , context),
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
  List<Widget> _listRestaurantes(List<Restaurante> data, context) {
    List<Widget> restaurantes = [];
    for (var item in data) {
      restaurantes.add(
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
        child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0 ),
        child: Column(

          children: [
            Expanded(
                child: Text(
                    item.nombre ,
                    style: Theme.of(context).textTheme.headline6.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    )
                )
            ),
            Expanded(
              child: SizedBox.expand(
              child: FittedBox(
                child: Image.network(item.logotipo),
                fit: BoxFit.fill,
              ),

            )),
            Expanded(child: Row(
              children:[
                Icon(
                  Icons.star,
                  color: Colors.blue,
                ),
                Text(item.nroEstrellas)
              ],

            )
            )
          ],
        ),
      ),
    )
        )
      );
    }
    return restaurantes;
  }
}
