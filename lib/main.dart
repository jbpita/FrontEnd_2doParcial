import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend_2doparcial/modelos/Hoteles.dart';
import 'package:frontend_2doparcial/modelos/Restaurantes.dart';
import 'package:frontend_2doparcial/modelos/Hospitales.dart';
import 'package:frontend_2doparcial/modelos/VistaItem.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      //home: MyStatefulWidget(),
      initialRoute: '/',
      routes: {
        '/':  (context) => MyStatefulWidget(),
        '/vistaItem': (context) => VistaItem()
      },
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _MyStatefulWidgetState extends State<MyStatefulWidget> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        elevation: 0,
        title: Center(child: const Text('Turis App')),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              icon: Icon(
                Icons.hotel_outlined,
                color: Colors.black,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.local_hospital_rounded,
                color: Colors.black,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.restaurant,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(
            child: Hoteles(),
          ),
          Center(
            child: Hospitales(),
          ),
          Center(
            child: Restaurantes(),
          ),
        ],
      ),
    );
  }
}
