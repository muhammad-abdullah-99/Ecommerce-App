import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/loginScreen.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: DrawerHeader(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                color: Colors.blue[400],
                child:  Row(
                  children: [IconButton(onPressed: (){}, icon:const Icon(
                          Icons.notifications)),
                    Text("Notification")
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                color: Colors.blue[400],
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.save_alt_outlined)),
                    const Text("Saved"),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                color: Colors.blue[400],
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.thumb_up_rounded)),
                    const Text("Liked")
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                color: Colors.blue[400],
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      icon: Icon(Icons.logout_rounded),
                    ),
                    Text('Logout')
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
        ),
        actions: [
          CircleAvatar(radius: 18,child:IconButton(onPressed: (){}, icon: Icon(Icons.search_rounded)) 
          ,),
          
        ],
      ),
      body: Column(
        children: [
          Container()
        ],
      ),
    );
  }
}
