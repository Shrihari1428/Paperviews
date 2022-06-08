import 'package:flutter/material.dart';
import 'package:paperviews/Views/QuestionPage/question_page.dart';
import 'package:paperviews/Views/SubjectPage/subject_data.dart';

class Subjectpage extends StatefulWidget {
  Subjectpage(this.company, this.year);
  String company;
  String year;
  @override
  _SubjectpageState createState() => _SubjectpageState();
}

class _SubjectpageState extends State<Subjectpage> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Padding(
          padding: EdgeInsets.only(left: deviceWidth/6),
          child: const Text("Paperview",style: TextStyle(fontSize: 25,color: Colors.white,fontFamily: "Cocon"),),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children:  [
              const SizedBox(height: 20,),
              const Text("List Of Companies",style: TextStyle(fontSize: 25,color: Colors.white),),
              (subjectModel.isNotEmpty)
                  ? ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: subjectModel.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Questionpage(widget.company, widget.year, subjectModel[index])),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
                            child: Card(
                              elevation: 4,
                              child: Row(
                                children: [
                                  Card(
                                      margin: const EdgeInsets.all(0),
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        width: deviceWidth / 3.7,
                                        height: deviceHeight / 8,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage('assets/images/Paperviews.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      )),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(deviceWidth / 100),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              subjectModel[index],
                                              style: const TextStyle(color: Colors.black, fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  })
                  : const Center(
                child: Text("No Companies Available", style: TextStyle(fontSize: 35)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
