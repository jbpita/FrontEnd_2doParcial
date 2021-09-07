
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
          Container(
            padding: EdgeInsets.all(12),
            child: Column(
              children:  <Widget>[
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
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0 ),
                              child: Text(
                                  this.element.descripcion,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      height: 1.5
                                  ),
                              ),

                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0 ),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.add_road,
                                  color: Colors.black54,
                                ),
                                Expanded(
                                  child: Text(
                                    this.element.distancia,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                          fontSize: 14.0,
                                          height: 1.5
                                      ),
                                    ),
                                  )
                              ]
                            )

                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0 ),
                                child:Row(
                                  children: <Widget>[
                                    Icon(
                                        Icons.add_location_alt,
                                        color: Colors.black54,
                                    ),
                                    Expanded(
                                        child: Text(
                                          this.element.ubicacion,
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            height: 1.5,

                                          ),
                                        ),
                                    )

                                  ],
                              )

                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0 ),
                              child:Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.phone_callback,
                                    color: Colors.black54,
                                  ),
                                  Expanded(
                                      child: Text(
                                        this.element.telefono,
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          height: 1.5,
                                        ),
                                      ),
                                  )
                                ],
                              )
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0 ),
                              child:Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.email,
                                    color: Colors.black54,
                                  ),
                                  Text(
                                    this.element.correo,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      height: 1.5,
                                    ),
                                  ),
                                ],
                              )
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0 ),
                              child: Row(
                                children:[
                                  Icon(
                                    Icons.star,
                                    color: Colors.black54,
                                  ),
                                  Text(element.nroEstrellas)
                                ],

                              )

                          )
                        ],

                      ),
                    ),

                    Expanded(
                      child: Column(
                        children: <Widget>[FittedBox(
                        child: Image.network(element.logotipo , width: size.width/2),
                        fit: BoxFit.fill,
                      )]
    )

                    ),
                  ],

                )

              ],
            ),
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