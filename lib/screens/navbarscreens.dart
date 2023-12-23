import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Navbaritems extends StatefulWidget {
  const Navbaritems({Key? key, required this.selectedIndex,
    required this.onDestinationSelected}) : super(key: key);

  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  State<Navbaritems> createState() => _NavbaritemsState();
}

class _NavbaritemsState extends State<Navbaritems> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: widget.selectedIndex,
      onDestinationSelected: widget.onDestinationSelected,
      indicatorColor: Colors.blueGrey,
      indicatorShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: Colors.white),
      ),
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      height: 40,
      destinations: const <Widget>[
        NavigationDestination(
          icon: Icon(Icons.home),
          selectedIcon: Icon(Icons.home,color: Colors.white,),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.details),
          selectedIcon: Icon(Icons.details,color: Colors.white,),
          label: 'Transaction',
        ),

      ],
    );
  }
}
