import 'package:flutter/material.dart';
import 'package:myapp/services/auth/auth_service.dart';
import 'package:myapp/pages/setting_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    // get auth services
    final auth = AuthService();
    
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // logo
              DrawerHeader(
                  child: Center(
                child: Icon(
                  Icons.message,
                  size: 40,
                  color: Theme.of(context).colorScheme.primary,
                ),
              )),

              // Home list tile
              Padding(
                padding:const EdgeInsets.only(left: 25),
                child: ListTile(
                  title: const Text('H O M E '),
                  leading:const Icon(Icons.home),
                  onTap: () {
                    // Pop the drawer
                    Navigator.pop(context);
                  },
                ),
              ),

              // settings list tile
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  title: const Text('S E T T I N G S '),
                  leading: const Icon(Icons.settings),
                  onTap: () {
                    // Pop the drawer
                    Navigator.pop(context);

                    // Navigate to settings page
                    Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => SettingPage(), 
                        ));
                  },
                ),
              ),
            ],
          ),

          // logout list tile
          Padding(
            padding:const EdgeInsets.only(left: 25, bottom: 25),
            child: ListTile(
              title: const Text('L O G O U T'),
              leading: const Icon(Icons.logout),
              onTap: logout,
            ),
          )
        ],
      ),
    );
  }
}
