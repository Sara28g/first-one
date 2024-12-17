import 'package:flutter/material.dart';
import 'package:flutter_sliding_up_panel/flutter_sliding_up_panel.dart';
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
  final _txtUserName =  TextEditingController();
  final _txtPassword =  TextEditingController();
  var _isTextFieldVisible = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/images/background.jpeg'),
            fit: BoxFit.cover, // Adjusts the image to cover the whole screen
          ),
        ),
      ),
      //buttom
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top:10),
        height: 64,
        width: 64,
        child: FloatingActionButton(
          backgroundColor: Colors.black,
            elevation: 8,
            onPressed: () =>debugPrint(""),
             shape: RoundedRectangleBorder(
            side: const BorderSide(width: 3, color: Color(0xFF253622) ),
            borderRadius: BorderRadius.circular(100),
          ),
           child: const Icon(Icons.play_arrow_outlined,color: Color(0xFF253622)),
          ),
        ),

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
                icon: Icons.settings,
                text: "Settings",
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (BuildContext context) {
                      return DraggableScrollableSheet(
                        initialChildSize: 0.2,
                        minChildSize: 0.2,
                        maxChildSize: 0.8,
                        expand: false,
                        builder: (BuildContext context,
                            ScrollController scrollController) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16)),
                            ),
                            child: ListView(
                              controller: scrollController,
                              children: [
                                ListTile(
                                  leading:
                                      Icon(Icons.settings, color: Colors.white),
                                  title: Text("Settings",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                  onTap: () {
                                    // Perform action for Profile
                                  },
                                ),
                                ListTile(
                                  leading:
                                      Icon(Icons.person, color: Colors.white),
                                  title: Text(
                                    "Profile",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      barrierColor: Colors.transparent,
                                      isScrollControlled: true,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20)),
                                      ),
                                      builder: (BuildContext context) {
                                        return DraggableScrollableSheet(
                                          initialChildSize: 0.4,
                                          minChildSize: 0.2,
                                          maxChildSize: 0.8,
                                          expand: false,
                                          builder: (BuildContext context,
                                              ScrollController
                                                  scrollController) {
                                            return Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                        top: Radius.circular(
                                                            16)),
                                              ),
                                              child: ListView(
                                                controller: scrollController,
                                                children: [
                                                  ListTile(
                                                    leading: Icon(
                                                        Icons.account_circle,
                                                        color: Colors.white),
                                                    title: Text("Profile",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16)),
                                                    onTap: () {
                                                      // Perform action for Profile
                                                    },
                                                  ),
                                                  ListTile(
                                                    title: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "    User Name:",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                        Text(
                                                          "US",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    onTap: () {
                                                      // Perform action for Notifications
                                                    },
                                                  ),

                                                  ListTile(
                                                    title: const Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "    First Name:",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                        Text(
                                                          "FN",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    onTap: () {
                                                      // Perform action for Notifications
                                                    },
                                                  ),
                                                  ListTile(
                                                    title: const Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "    Last Name:",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                        Text(
                                                          "LN",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    onTap: () {
                                                      // Perform action for Notifications
                                                    },
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      showModalBottomSheet(
                                                        context: context,
                                                        barrierColor: Colors.transparent,
                                                        isScrollControlled: true,
                                                        shape: const RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.vertical(
                                                              top: Radius.circular(20)),
                                                        ),
                                                        builder: (BuildContext context) {
                                                          return DraggableScrollableSheet(
                                                            initialChildSize: 0.4,
                                                            minChildSize: 0.2,
                                                            maxChildSize: 0.8,
                                                            expand: false,
                                                            builder: (BuildContext context,
                                                                ScrollController
                                                                scrollController) {
                                                              return Container(
                                                                decoration: const BoxDecoration(
                                                                  color: Colors.black,
                                                                  borderRadius:
                                                                  BorderRadius.vertical(
                                                                      top: Radius.circular(
                                                                          16)),
                                                                ),
                                                                child: ListView(
                                                                  controller: scrollController,
                                                                  children: [
                                                                    ListTile(
                                                                      leading: Icon(
                                                                          Icons.edit,
                                                                          color: Colors.white),
                                                                      title: Text("Edit Profile",
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 16)),
                                                                      onTap: () {
                                                                        // Perform action for Profile
                                                                      },
                                                                    ),
                                                                    ListTile(
                                                                      title: const Text("   Change UserName",
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 14)),
                                                                      onTap: () {
                                                                        setState(() {
                                                                          _isTextFieldVisible = !(_isTextFieldVisible);
                                                                          print("isText $_isTextFieldVisible");
                                                                        });
                                                                          },
                                                                    ),

                                                                    /*
                                                                    const Text(
                                                                      "   Change UserName:",
                                                                      style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: 14,
                                                                      ),
                                                                      textAlign: TextAlign.left,
                                                                    ),
                                                                    const SizedBox(height: 8),

 */

                                                                    Visibility(visible:_isTextFieldVisible,
                                                                       child: Align(
                                                                      alignment: Alignment.center,
                                                                       child: SizedBox(
                                                                        height:45,
                                                                        width: 300,
                                                                        child: TextField(
                                                                          controller: _txtUserName,
                                                                          decoration: InputDecoration(
                                                                            border: OutlineInputBorder(),
                                                                            hintText: 'New UserName',
                                                                          ),
                                                                        )),
                                                                       ),
                                                                    ),




                                                                    const SizedBox(height: 4),
/*
                                                                    const Text(
                                                                      "   Change Password:",
                                                                      style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: 15,
                                                                      ),
                                                                      textAlign: TextAlign.left,
                                                                    ),
                                                                    const SizedBox(height: 8),

                                                                    Align(
                                                                      alignment: Alignment.center,
                                                                      child: SizedBox(
                                                                        height:45,
                                                                        width: 300,
                                                                        child: TextField(
                                                                          controller: _txtPassword,
                                                                          decoration: InputDecoration(
                                                                            border: OutlineInputBorder(),
                                                                            hintText: 'Pssword',
                                                                          ),
                                                                        )),
                                                                    ),

 */
                                                                    const SizedBox(height: 8),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: const Text(
                                                      "Edit profile",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15,
                                                      ),
                                                    ),
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
                                ListTile(
                                  leading: Icon(Icons.play_arrow,
                                      color: Colors.white),
                                  title: Text(
                                    "Game",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                  onTap: () {
                                    // Perform action for Notifications
                                  },
                                ),
                                ListTile(
                                  leading:
                                      Icon(Icons.logout, color: Colors.white),
                                  title: Text("Logout",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12)),
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
              const GButton(icon: Icons.play_arrow_outlined, text: "Play"),
              GButton(
                icon: Icons.add_chart_sharp,
                text: "Chart",
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (BuildContext context) {
                      return DraggableScrollableSheet(
                        builder: (BuildContext context,
                            ScrollController scrollController) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16)),
                            ),
                            child: ListView.builder(

                              controller: scrollController,
                              itemCount: 25,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  title: Text("Place ${index + 1}",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12)),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
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
        backgroundColor: Color(0xFF252525),
      ),
      /*
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

       */
    );
  }
}
