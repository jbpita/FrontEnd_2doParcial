
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {

  final element;

  const Body({Key key , this.element}) : super(key: key);

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: size.width*0.005 , right:  size.width*0.005),
            child: FittedBox(
              child: Image.network(
                this.element.fotoGoogle,
                alignment: Alignment.center,
                //width: size.width,
                //height: size.height/3
              ),

              fit: BoxFit.fill,
            ),
            height: size.height/3,
            width: size.width*0.99,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)
                ),
            ),
          ),
          Text(
            this.element.nombre,
            style: Theme.of(context).textTheme.headline4.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold
            )
          ),
          Row(
            children: <Widget>[
              Container(
                width: size.width/2,
                child:  Column(
                  children: <Widget>[
                    Text(
                      this.element.descripcion,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      this.element.distancia,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      this.element.ubicacion,
                      textAlign: TextAlign.left,
                    ),
                  ],

                ),
              ),

              Expanded(
                child: FittedBox(
                  child: Image.network(element.logotipo),
                  fit: BoxFit.fill,
                ),

              ),
            ],

          )

        ],
      ),
    );
  }
}

/*
* SingleChildScrollView(
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
                  padding: const EdgeInsets.symmetric(horizontal: 10.0 ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        element.nombre,
                        style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                        //style: TextStyle(color: Colors.white)
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                              Icons.star,
                              color: Colors.blue,
                            ),
                          Text(this.element.nroEstrellas),
                          Expanded(
                            child: Image.network(this.element.logotipo)
                          )
                        ],
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
* */