import 'package:flutter/material.dart';
import 'package:paperviews/Views/AuthPage/AuthController.dart';
import 'package:paperviews/Views/AuthPage/auth_data.dart';
import 'package:paperviews/Views/CompanyPage/company_page.dart';
import 'package:paperviews/Views/AuthPage/login_page.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({Key? key}) : super(key: key);

  @override
  _RegisterpageState createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          TextButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const Loginpage()),
            );
          }, child: const Text("Login",style: TextStyle(fontSize: 17,color: Colors.white),))
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
                const SizedBox(height: 20,),
                ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset(
                      'assets/images/Paperviews.png',
                      width: 100,
                      height: 100,
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
                  padding: EdgeInsets.only(bottom: 20, left: 100, right: 100),
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
                        style: TextStyle(color: Colors.white,fontSize: 17),
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
                        style: TextStyle(color: Colors.white,fontSize: 17),
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
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 10.0, left: 20),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Re-Enter Password",
                        style: TextStyle(color: Colors.white,fontSize: 17),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: rePasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(),
                        hintText: 'Enter Password Again',
                        hintStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () async{
                    if(usernameController.text =="" || passwordController.text == " "){
                      showAlertDialog(context, "Please Enter All Fields");
                    }else if(passwordController.text != rePasswordController.text){
                      showAlertDialog(context, "Passwords Don't Match");
                    }else{
                      int res = await register(usernameController.text, passwordController.text);
                      if(res == 1){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Companypage()),
                        );
                      }else{
                        showAlertDialog(context, "Invalid Inputs... Please try later!");
                      }
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(
                        top: 12, left: 30, right: 30, bottom: 12),
                    child: Text(
                      "Register",
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
                  padding: EdgeInsets.only(top: 60.0),
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
showAlertDialog(BuildContext context, String errorMessage) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Registration Error Error"),
    content: Text(errorMessage),
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