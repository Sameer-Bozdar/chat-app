import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/settingpage.dart';
import 'package:flutter/material.dart';

class Mydrawer extends StatelessWidget {
    Mydrawer({super.key});
  final _authservice = AuthService();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //  icon for drawer
          Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    color: Theme.of(context).colorScheme.primary,
                    Icons.message,
                    size: 40,
                  ),
                ),
              ),

              //  Home List Tile
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  title: Text("H O M E"),
                  leading: Icon(Icons.home),
                  onTap: () {
                    // pop the drawer
                    Navigator.pop(context);
                  },
                ),
              ),
              //  settings list Tile
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  title: Text("S E T T I N G S"),
                  leading: Icon(Icons.settings),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SettingPage()));
                  },
                ),
              ),
              // Logout list tile
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 25),
            child: ListTile(
              title: Text("L O G O U T "),
              leading: Icon(Icons.logout_outlined),
              onTap: () {    _authservice.signOut(); },
            ),
          ),
        ],
      ),
    );
  }
}
