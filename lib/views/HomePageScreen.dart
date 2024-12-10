import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'EditProfile.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key, required this.title});

  final String title;

  @override
  State<HomePageScreen> createState() => HomepagescreenPageState();
}

class HomepagescreenPageState extends State<HomePageScreen> {
  void _incrementCounter() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //buttom
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.lightGreen.shade900,
            activeColor: Colors.lightGreen.shade900,
            tabBackgroundColor: Colors.grey.shade800,
            padding: EdgeInsets.all(16),
            gap: 8,
            tabs: [
              const GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.account_circle_outlined,
                text: "Profile",
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (BuildContext context) {
                      return DraggableScrollableSheet(
                        initialChildSize: 0.2,
                        minChildSize: 0.2,
                        maxChildSize: 0.8,
                        expand: false,
                        builder: (BuildContext context, ScrollController scrollController) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                            ),
                            child: ListView(
                              controller: scrollController,
                              children: [
                                ListTile(
                                  leading: Icon(Icons.account_circle, color: Colors.white),
                                  title: Text("Profile", style: TextStyle(color: Colors.white)),
                                  onTap: () {
                                    // Perform action for Profile
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.notifications, color: Colors.white),
                                  title: Text("Notifications", style: TextStyle(color: Colors.white)),
                                  onTap: () {
                                    // Perform action for Notifications
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.logout, color: Colors.white),
                                  title: Text("Logout", style: TextStyle(color: Colors.white)),
                                  onTap: () {
                                    // Perform action for Logout
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
              const GButton(icon: Icons.settings, text: "Settings"),
              const GButton(icon: Icons.play_arrow_outlined, text: "Play"),
              const GButton(icon: Icons.add_chart_sharp, text: "Chart"),
              const GButton(icon: Icons.card_travel_outlined, text: "Store"),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Home Page',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            )),
        backgroundColor: Colors.blueGrey.shade800,
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade200,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.blueGrey.shade900),
                    ),
                    onPressed: () {},
                    child: const Icon(Icons.play_arrow_outlined)),
                const SizedBox(height: 10),
                TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.blueGrey.shade900),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const EditProfile(title: "new account")),
                      );
                    },
                    child: const Icon(Icons.account_circle_outlined))
              ],
            )
          ],
        ),
      ),
    );
  }
}
