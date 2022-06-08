import 'package:flutter/material.dart';
import 'package:paperviews/Views/SubjectPage/subject_page.dart';
import 'package:paperviews/Views/YearPage/year_data.dart';

class Yearpage extends StatefulWidget {
  Yearpage(this.company);
  String company;
  @override
  _YearpageState createState() => _YearpageState();
}

class _YearpageState extends State<Yearpage> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
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
              const Text("Question Papers 2012-2022",style: TextStyle(fontSize: 25,color: Colors.white),),
              (yearModel.isNotEmpty)
                  ? ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: yearModel.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Subjectpage(widget.company, yearModel[index])),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Card(
                            elevation: 4,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              child: Center(
                                child: Text(
                                  yearModel[index],
                                  style: const TextStyle(color: Colors.black, fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  })
                  : const Center(
                child: Text("No Questions Available", style: TextStyle(fontSize: 35)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
