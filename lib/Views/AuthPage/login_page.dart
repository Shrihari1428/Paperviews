import 'package:flutter/material.dart';
import 'package:paperviews/Views/AuthPage/AuthController.dart';
import 'package:paperviews/Views/AuthPage/auth_data.dart';
import 'package:paperviews/Views/CompanyPage/company_page.dart';
import 'package:paperviews/Views/AuthPage/register_page.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Registerpage()),
                );
              },
              child: const Text(
                "Register",
                style: TextStyle(fontSize: 17, color: Colors.white),
              ))
        ],
      ),
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset(
                      'assets/images/Paperviews.png',
                      width: 150,
                      height: 150,
                    )),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 10),
                  child: Text(
                    "Paperview",
                    style: TextStyle(
                        fontFamily: "Cocon",
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 30, left: 100, right: 100),
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.white,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10.0, left: 20),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Username",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(),
                        hintText: 'Enter Username',
                        hintStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 10.0, left: 20),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Password",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(),
                        hintText: 'Enter Password',
                        hintStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () async{
                    if (usernameController.text == "" || passwordController.text == "") {
                      showAlertDialog(context);
                    } else {
                      int res = await authorize(usernameController.text, passwordController.text);
                      if(res == 1){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Companypage()),
                          );
                      }
                      else{
                        showAlertDialog(context);
                      }
                    }

                  },
                  child: const Padding(
                    padding: EdgeInsets.only(
                        top: 12, left: 30, right: 30, bottom: 12),
                    child: Text(
                      " Login  ",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(color: Colors.white)))),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 80.0),
                  child: Text(
                    "Copyrights 2022 © All Rights Reserved",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Authorization Error"),
    content: const Text("Invalid Username or Password"),
    actions: [
      okButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}