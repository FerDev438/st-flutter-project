import 'package:flutter/material.dart';
import 'package:hello_world/app_controller.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.network(
                      'https://cdn.discordapp.com/attachments/555541387181817863/1088232127432245380/Sem_titulo.jpg'),
                ),
                accountName: const Text('Mamaco potente'),
                accountEmail: const Text('potente@gmail.com')),
            const SizedBox(
              height: 20,
            ),
            const ListTile(
              leading: Icon(Icons.home),
              title: Text(
                'Menu Potente',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              subtitle: Text(
                'Tela de início',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              subtitle: const Text(
                'Finalizar sessão',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            )
          ]),
        ),
        appBar: AppBar(
          title: const Text('Switch Potente'),
          actions: const [CustomSwitcher()],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              counter++;
            });
          },
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Contador: $counter'),
            Container(
              height: 10,
            ),
            const CustomSwitcher(),
            Container(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                )
              ],
            )
          ]),
        ));
  }
}

class CustomSwitcher extends StatelessWidget {
  const CustomSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Switch(
        value: AppController.instance.isDarkTheme,
        onChanged: (value) {
          AppController.instance.changeThemme();
        });
  }
}
