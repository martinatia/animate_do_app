import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';


class NavegacionPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => _NotificationModel(),
      child: Scaffold(
        
        appBar: AppBar(
          title: Text('Notifications Page'),
          backgroundColor: Colors.pink,
        ),
        floatingActionButton: _BotonFlotante(),
        bottomNavigationBar: BottomNavigation(),
       ),
    );
  }
}

class _BotonFlotante extends StatelessWidget {
  const _BotonFlotante({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.pink,
      child: FaIcon(FontAwesomeIcons.play),
      onPressed: (){
        int numero = Provider.of<_NotificationModel>(context,listen: false).numero;
        numero ++;
        Provider.of<_NotificationModel>(context,listen: false).numero = numero;

      }
      );
  }
}

class BottomNavigation extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final int numeroNotificaciones = Provider.of<_NotificationModel>(context).numero;
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [
        BottomNavigationBarItem(
          label: 'Bones',
          icon: FaIcon(FontAwesomeIcons.bone),
          
        ),
        //FaIcon(FontAwesomeIcons.bell),
        BottomNavigationBarItem(
          label: 'Notifications',
          icon: Stack(
            children: <Widget>[
              FaIcon(FontAwesomeIcons.bell),
              Positioned(
                top: 0.0,
                right: 0.0,
                // child: Icon(Icons.brightness_1,color: Colors.redAccent,size: 8,))
                child: Container(
                  child: Text('$numeroNotificaciones',style: TextStyle(color: Colors.white, fontSize: 8),),
                  alignment: Alignment.center,

                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle
                  ),
                )
                ),
            ],
          )
          
        ),
        BottomNavigationBarItem(
          label: 'My Dog',
          icon: FaIcon(FontAwesomeIcons.dog),
          
        ),
      ]
      );
  }
}


//ver video 10

class _NotificationModel extends ChangeNotifier{

  int _numero =0;

  int get numero => this._numero;

  set numero (int numero){
    this._numero = numero;
    notifyListeners();
  }


}