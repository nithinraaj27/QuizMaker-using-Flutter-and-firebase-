import 'package:flutter/material.dart';
import 'package:flutter_quiz_maker/services/database.dart';
import 'package:flutter_quiz_maker/views/addquestion.dart';
import 'package:flutter_quiz_maker/widgets/widgets.dart';
import 'package:random_string/random_string.dart';

class CreateQuiz extends StatefulWidget {
  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  final _formKey = GlobalKey<FormState>();
  String quizimageUrl, quizTitle, quizDescription, quizId;
  DatabaseService databaseService = new DatabaseService();

  bool _isLoading = false;

  createQuizOnline() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      quizId = randomAlphaNumeric(16);
      Map<String, String> quizMap = {
        "quizId": quizId,
        "quizImgurl": quizimageUrl,
        "quizTitle": quizTitle,
        "quizDescription": quizDescription
      };

      await databaseService.addQuizData(quizMap, quizId).then((value) {
        setState(() {
          _isLoading = false;
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => AddQuestion(
            quizId
          )));
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black87),
        brightness: Brightness.light,
      ),
      body: _isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    TextFormField(
                        validator: (val) =>
                            val.isEmpty ? "Enter Image Url" : null,
                        decoration: InputDecoration(
                          hintText: "Quiz Image Url",
                        ),
                        onChanged: (val) {
                          quizimageUrl = val;
                        }),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                        validator: (val) =>
                            val.isEmpty ? "Enter Quiz Title" : null,
                        decoration: InputDecoration(
                          hintText: "Quiz Title",
                        ),
                        onChanged: (val) {
                          quizTitle = val;
                        }),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                        validator: (val) =>
                            val.isEmpty ? "Enter Quiz Description" : null,
                        decoration: InputDecoration(
                          hintText: "Quiz Description",
                        ),
                        onChanged: (val) {
                          quizDescription = val;
                        }),
                    Spacer(),
                    GestureDetector(
                        onTap: () {
                          createQuizOnline();
                        },
                        child: blueButton(
                           context, "Create Quiz",
                        )),
                    SizedBox(
                      height: 80.0,
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
