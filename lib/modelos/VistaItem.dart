
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend_2doparcial/modelos/body.dart';

class VistaItem extends StatelessWidget{

  final element;

  const VistaItem({Key key , this.element}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white70,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body:  SingleChildScrollView(
        child: Body(element: this.element),
      )
    );
  }
}