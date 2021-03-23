import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_maker/services/database.dart';
import 'package:flutter_quiz_maker/widgets/widgets.dart';

class AddQuestion extends StatefulWidget {
  final String quizId;
  AddQuestion(this.quizId);

  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  final _formKey = GlobalKey<FormState>();
  String question,option1,option2,option3,option4;
  bool _isLoading = false;
  DatabaseService databaseService = new DatabaseService();

  uploadQuestiondata() async{
    if(_formKey.currentState.validate()){

      setState(() {
        _isLoading = true;
      });
      Map<String,String> questionMap = {
        "Question" : question,
        "option 1" :option1,
        "option 2" :option2,
        "option 3" :option3,
        "option 4" :option4,
      };
      await databaseService.addQuizData(questionMap, widget.quizId).then((value){
        setState(() {
          _isLoading = false;
        });
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar (context),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black87),
        brightness: Brightness.light,
      ),
      body: _isLoading?Container(
        child: Center(
        child: CircularProgressIndicator(),
      ),):Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Container(
            child: Column(
              children: [
                TextFormField(
                    validator: (val) =>
                    val.isEmpty ? "Enter Question" : null,
                    decoration: InputDecoration(
                      hintText: "Enter quiz question",
                    ),
                    onChanged: (val) {
                      question = val;
                    }),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                    validator: (val) =>
                    val.isEmpty ? "Enter option 1" : null,
                    decoration: InputDecoration(
                      hintText: "Option 1(Correct Answer)",
                    ),
                    onChanged: (val) {
                      option1 = val;
                    }),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                    validator: (val) =>
                    val.isEmpty ? "Enter option 2" : null,
                    decoration: InputDecoration(
                      hintText: "Enter option 2",
                    ),
                    onChanged: (val) {
                      option2 = val;
                    }),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                    validator: (val) =>
                    val.isEmpty ? "Enter option 3" : null,
                    decoration: InputDecoration(
                      hintText: "Enter option 2",
                    ),
                    onChanged: (val) {
                      option3 = val;
                    }),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                    validator: (val) => val.isEmpty ? "Enter Option 4" : null,
                    decoration: InputDecoration(
                      hintText: "Enter option 4",
                    ),
                    onChanged: (val) {
                      option4 = val;
                    }),
                Spacer(),
                Row(
                  children: [
                     // ignore: deprecated_member_use
                     FlatButton(
                       height: 50.0,
                       minWidth: MediaQuery.of(context).size.width/2-36,
                       color: Colors.blue,
                         shape: RoundedRectangleBorder(
                             borderRadius:BorderRadius.circular(50.0) ),
                         onPressed: (){
                            Navigator.pop(context);
                         },
                         child: Text("Submit",style: TextStyle(fontSize: 16.0,color: Colors.white),)
                     ),
                    SizedBox(width: 15.0,),
                    // ignore: deprecated_member_use
                    FlatButton(
                        height: 50.0,
                        minWidth: MediaQuery.of(context).size.width/2-36,
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius:BorderRadius.circular(50.0) ),
                        onPressed: (){
                          uploadQuestiondata();
                        },
                        child: Text("Add Question",style: TextStyle(fontSize: 16.0,color: Colors.white),)
                    ),
                  ],
                ),
                SizedBox(height: 100.0,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
