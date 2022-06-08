import 'package:flutter/material.dart';
import 'package:paperviews/Views/AuthPage/login_page.dart';
import 'package:paperviews/Views/AuthPage/register_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              padding: EdgeInsets.only(bottom: 50,left: 100,right: 100),
              child: Divider(thickness: 0.5,color: Colors.white,),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Loginpage()),
                    );                  },
                  child: const Padding(
                    padding: EdgeInsets.only(top:12, left: 30, right: 30, bottom: 12),
                    child: Text(
                      " Login  ",
                      style: TextStyle(color: Colors.black,fontSize: 18),
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(color: Colors.white)))),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Registerpage()),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(top:12, left: 30, right: 30, bottom: 12),
                    child: Text(
                      "Register",
                      style: TextStyle(color: Colors.white,fontSize: 18),
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                      shape:
                      MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(color: Colors.white)))),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 130.0),
              child: Text("Copyrights 2022 © All Rights Reserved",style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }
}
