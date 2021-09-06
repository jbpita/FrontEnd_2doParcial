import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {

  final element;

  const Body({Key key , this.element}) : super(key: key);

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  height: 500,
                  decoration: BoxDecoration(
                    color : Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ) 
                  )
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0 ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        element.nombre,
                        style: TextStyle(color: Colors.white)
                      ),
                    ],
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}