import 'package:flutter/material.dart';
import 'package:paperviews/Views/QuestionPage/question_controller.dart';
import 'package:paperviews/Views/QuestionPage/question_model.dart';

class Questionpage extends StatefulWidget {
  Questionpage(this.company, this.year, this.subject);
  String company;
  String year;
  String subject;
  @override
  _QuestionpageState createState() => _QuestionpageState();
}

class _QuestionpageState extends State<Questionpage> {
  List<QuestionModel> questions = [];

  _initialize() async {
    questions = (await getQuestions(widget.company,widget.year,widget.subject))!;
    setState(() {});
  }

  @override
  void initState() {
    _initialize();
    setState(() {});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return (questions == [])
        ? const Center(
      child: SizedBox(
        width: 100,
        height: 100,
        child: CircularProgressIndicator(
          color: Colors.orange,
          value: 50,
          strokeWidth: 10,
        ),
      ),
    )
        : Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.black,
        title: Padding(
          padding: EdgeInsets.only(left: deviceWidth/6),
          child: const Text("Paperview",style: TextStyle(fontSize: 25,color: Colors.white,fontFamily: "Cocon"),),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children:  [
            const SizedBox(height: 20,),
            const Text("List Of Questions",style: TextStyle(fontSize: 25,color: Colors.black),),
            const SizedBox(height: 15,),
            (questions.isNotEmpty)
                ? ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: questions.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                        child: Text("Qn " + (index+1).toString() +". "  + questions[index].question),
                      ),
                      SizedBox(height: 15,),
                    ],
                  );
                })
                : const Center(
              child: Text("No Questions Posted Yet", style: TextStyle(fontSize: 35)),
            )
          ],
        ),
      ),
    );
  }
}
