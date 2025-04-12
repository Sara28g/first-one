import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_sliding_up_panel/flutter_sliding_up_panel.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Utils/client.dart';
import '../Utils/db.dart';
import '../models/UserModel.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key, required this.title});

  final String title;

  @override
  State<HomePageScreen> createState() => HomepagescreenPageState();
}

class HomepagescreenPageState extends State<HomePageScreen> {
  void _incrementCounter() {}
  final _txtUserName = TextEditingController();
  final _txtPassword = TextEditingController();
  bool _isTextFieldVisible = false;

  // Function to get users from API
  Future<List<User>> getUsers() async {
    List<User> arr = [];

    try {
      var url = "users/getUsers.php";
      final response = await http.get(Uri.parse(serverPath + url));

      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);

        // Check if jsonData is null or not a list
        if (jsonData == null) {
          throw Exception("Response body is null");
        }
        if (jsonData is! List) {
          throw Exception("Response is not a List. Received: $jsonData");
        }

        for (var i in jsonData) {
          arr.add(User.fromJson(i));
        }

        String usersString = arr.map((user) =>
        '${user.firstName}, ${user.lastName}, ${user.password}'
        ).join(', ');
        print("Formatted User List: $usersString");
      } else {
        throw Exception('Failed to load users: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
    return arr;
  }




  late User _currUser = User(firstName: "", lastName: "", password: "");


  Future<void> getDetails() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final int? userID = prefs.getInt('userID');

      var url = "profile/getMyDetails.php?userID=$userID";
      final response = await http.get(Uri.parse(serverPath + url));

      // Check if widget is still mounted before calling setState
      if (mounted && response.statusCode == 200) {
        setState(() {
          _currUser = User.fromJson(json.decode(response.body));
        });
      }
    } catch (e) {
      print("Error: $e");
    }
  }





  @override
  Widget build(BuildContext context) {

    getDetails();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Page',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        backgroundColor: Color(0xFF252525),
      ),
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
        margin: const EdgeInsets.only(top: 10),
        height: 64,
        width: 64,
        child: FloatingActionButton(
          backgroundColor: Colors.black,
          elevation: 8,
          onPressed: () => debugPrint(""),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 3, color: Color(0xFF253622)),
            borderRadius: BorderRadius.circular(100),
          ),
          child:
          const Icon(Icons.play_arrow_outlined, color: Color(0xFF253622)),
        ),
      ),

      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.lightGreen.shade900,
            activeColor: Colors.lightGreen.shade900,
            tabBackgroundColor: Colors.grey.shade800,
            padding: const EdgeInsets.all(16),
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
                    shape: const RoundedRectangleBorder(
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
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16)),
                            ),
                            child: ListView(
                              controller: scrollController,
                              children: [
                                ListTile(
                                  leading:
                                  const Icon(Icons.settings, color: Colors.white),
                                  title: const Text("Settings",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                  onTap: () {
                                    // Perform action for Profile
                                  },
                                ),
                                ListTile(
                                  leading:
                                  const Icon(Icons.person, color: Colors.white),
                                  title: const Text(
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
                                                    leading: const Icon(
                                                        Icons.account_circle,
                                                        color: Colors.white),
                                                    title: const Text("Profile",
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
                                                        const Text(
                                                          "    User Name:",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                        Text(
                                                          _currUser.username ?? "Not available", // Use null-aware operator
                                                          style: const TextStyle(
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
                                                    title: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        const Text(
                                                          "    First Name:",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                        Text(
                                                          _currUser.firstName ?? "Not available", // Use null-aware operator
                                                          style: const TextStyle(
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
                                                    title: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        const Text(
                                                          "    Last Name:",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                        Text(
                                                          _currUser.lastName?? "Not available", // Use null-aware operator
                                                          style: const TextStyle(
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
                                                        barrierColor:
                                                        Colors.transparent,
                                                        isScrollControlled:
                                                        true,
                                                        shape:
                                                        const RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.vertical(
                                                              top: Radius
                                                                  .circular(
                                                                  20)),
                                                        ),
                                                        builder: (BuildContext
                                                        context) {
                                                          return DraggableScrollableSheet(
                                                            initialChildSize:
                                                            0.4,
                                                            minChildSize: 0.2,
                                                            maxChildSize: 0.8,
                                                            expand: false,
                                                            builder: (BuildContext
                                                            context,
                                                                ScrollController
                                                                scrollController) {
                                                              return Container(
                                                                decoration:
                                                                const BoxDecoration(
                                                                  color: Colors
                                                                      .black,
                                                                  borderRadius:
                                                                  BorderRadius.vertical(
                                                                      top: Radius.circular(
                                                                          16)),
                                                                ),
                                                                child: ListView(
                                                                  controller:
                                                                  scrollController,
                                                                  children: [
                                                                    ListTile(
                                                                      leading: const Icon(
                                                                          Icons
                                                                              .edit,
                                                                          color:
                                                                          Colors.white),
                                                                      title: const Text(
                                                                          "Edit Profile",
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 16)),
                                                                      onTap:
                                                                          () {
                                                                        // Perform action for Profile
                                                                      },
                                                                    ),
                                                                    ListTile(
                                                                      title: const Text(
                                                                          "   Change UserName",
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 14)),
                                                                      onTap:
                                                                          () {
                                                                        setState(
                                                                                () {
                                                                              _isTextFieldVisible =
                                                                              !(_isTextFieldVisible);
                                                                            });
                                                                      },
                                                                    ),
                                                                    Visibility(
                                                                      visible:
                                                                      _isTextFieldVisible,
                                                                      child:
                                                                      Align(
                                                                        alignment:
                                                                        Alignment.center,
                                                                        child: SizedBox(
                                                                            height: 45,
                                                                            width: 300,
                                                                            child: TextField(
                                                                              controller: _txtUserName,
                                                                              decoration: const InputDecoration(
                                                                                border: OutlineInputBorder(),
                                                                                hintText: 'New UserName',
                                                                              ),
                                                                            )),
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                        height:
                                                                        4),
                                                                    const SizedBox(
                                                                        height:
                                                                        8),
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
                                  leading: const Icon(Icons.play_arrow,
                                      color: Colors.white),
                                  title: const Text(
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
                                  const Icon(Icons.logout, color: Colors.white),
                                  title: const Text("Logout",
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
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (BuildContext context) {
                      return DraggableScrollableSheet(
                        initialChildSize: 0.4,
                        minChildSize: 0.2,
                        maxChildSize: 0.8,
                        expand: false,
                        builder: (BuildContext context, ScrollController scrollController) {
                          return Container(
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                            ),
                            child: FutureBuilder<List<User>>(
                              future: getUsers(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(color: Colors.red),
                                  );
                                } else if (snapshot.hasError) {
                                  return Center(
                                    child: Text(
                                      'Error: ${snapshot.error}',
                                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                                    ),
                                  );
                                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                  return const Center(
                                    child: Text(
                                      'No results',
                                      style: TextStyle(fontSize: 23, color: Colors.white),
                                    ),
                                  );
                                } else {
                                  return ListView.builder(
                                    controller: scrollController,
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      User user = snapshot.data![index];
                                      return Card(
                                        child: ListTile(
                                          onTap: () {},
                                          title: Text(
                                            user.firstName ?? 'N/A',
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          subtitle: Text(
                                            user.lastName ?? 'N/A',
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
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
    );
  }
}