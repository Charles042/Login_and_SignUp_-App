import 'package:flutter/material.dart';
import 'package:login_and_signup/model/user_model.dart';
import 'package:login_and_signup/widgets/clipper.dart';
import 'package:http/http.dart' as http;

import 'login_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

Future<UserModel> createUser(
    String email, String firstname, String lastname, String password) async {
  final String apiUrl = "https://simple-node-login.herokuapp.com/user/signup";

  final response = await http.post(apiUrl, body: {
    "email": email,
    "password": password,
    "firstname": firstname,
    "lastname": lastname
  });
  if (response.statusCode == 200) {
    final String responseString = response.body;

    return userModelFromJson(responseString);
  } else {
    return null;
  }
}

class _HomeState extends State<Home> {
  UserModel _user;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Clipper(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'First Name',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Container(
              height: 20,
              child: TextField(
                expands: true,
                maxLines: null,
                minLines: null,
                controller: firstNameController,
                decoration: InputDecoration.collapsed(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Divider(
              color: Colors.black54,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Last Name',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Container(
              height: 20,
              child: TextField(
                expands: true,
                maxLines: null,
                minLines: null,
                controller: lastNameController,
                decoration: InputDecoration.collapsed(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Divider(
              color: Colors.black54,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Phone Number',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Container(
              height: 20,
              child: TextField(
                expands: true,
                maxLines: null,
                minLines: null,
                controller: phoneNumberController,
                decoration: InputDecoration.collapsed(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Divider(
              color: Colors.black54,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Password',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: IconButton(
                      icon: Icon(
                        Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {}),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Container(
              height: 20,
              child: TextField(
                expands: true,
                maxLines: null,
                minLines: null,
                controller: passwordController,
                decoration: InputDecoration.collapsed(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Divider(
              color: Colors.black54,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Confirm Password',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: IconButton(
                      icon: Icon(
                        Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {}),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Container(
              height: 20,
              child: TextField(
                expands: true,
                maxLines: null,
                minLines: null,
                controller: confirmPasswordController,
                decoration: InputDecoration.collapsed(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Divider(
              color: Colors.black54,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              height: 45,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: GestureDetector(
                  onTap: () async {
                    final String firstname = firstNameController.text;
                    final String lastname = lastNameController.text;
                    final String email = phoneNumberController.text;
                    final String password = passwordController.text;

                    final UserModel user =
                        await createUser(email, firstname, lastname, password);

                    setState(() {
                      _user = user;
                    });
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Login()));
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  _user == null ? Container() :
                  Text("The user ${_user.firstname} is created Successfully ")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
