import 'package:flutter/material.dart';
import 'package:clon_app/src/api/productos.dart';
import 'package:clon_app/src/widgets/item_list.dart';
import 'package:clon_app/src/widgets/side_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
    print('Iniciando home page');
    // realizar peticiones
    // comprobar informacion local (sqlite o shared preferences)
    // comprabar si hay internet
    // comprobar si el usuario esta logueado
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clon APP'),
      ),
      drawer: SideMenu(),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        // onPageChanged: (value) => {
        //   currentIndex = value,
        //   setState(() {}),
        // },
        children: [
          ProductosFragment(),
        ],
      ),
    );
  }
}

class ProductosFragment extends StatelessWidget {
  const ProductosFragment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print('Creando productos fragment');
    return ListView.builder(
      itemCount: productos.length,
      itemBuilder: (BuildContext context, int index) {
        return ItemList(producto: productos[index]);
      },
    );
  }
}
