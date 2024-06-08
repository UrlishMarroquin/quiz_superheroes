import 'package:flutter/material.dart';
import 'package:quizsuperheroes/configs/quiz_config.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizPage extends StatefulWidget {
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizConfig quizConfig = QuizConfig();
  List<Widget> score = [];
  int correcta = 0;

  void checkAnswer(bool userAnswer, String numberQuestion) {
    if (quizConfig.isFinished() == true) {
      if (userAnswer) {
        correcta ++;
        score.add(itemScore(numberQuestion, true));
      } else {
        score.add(itemScore(numberQuestion, false));
      }
      Alert(
          context: context,
          type: AlertType.info,
          title: "Super Heroes",
          desc: "El cuestionario ha llegado a su fin\ntiene $correcta respuestas correctas",
          buttons: [
            DialogButton(
                child: Text("Reiniciar"),
                onPressed: () {
                  correcta = 0;
                  quizConfig.restarQuizz();
                  score.clear();
                  Navigator.pop(context);
                  setState(() {});
                }),               
          ]).show();
    } else {
      if (userAnswer) {
        correcta ++;
        score.add(itemScore(numberQuestion, true));
      } else {
        score.add(itemScore(numberQuestion, false));
      }
      quizConfig.nextQuestion();
      setState(() {});
    }
  }

  Widget itemScore(String numberQuestion, bool isCorrect) {
    return Row(
      children: [
        Text(
          "$numberQuestion: ",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        Icon(
          isCorrect ? Icons.check : Icons.close,
          color: isCorrect ? Colors.greenAccent : Colors.redAccent,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Super Heroes",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
                image: DecorationImage(
                  image: 
                  //AssetImage('assets/images/imagen01.png'),
                  AssetImage(
                    quizConfig.getQuestionImagen(),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: MaterialButton(
                  minWidth: double.infinity,
                  onPressed: () {
                    checkAnswer(quizConfig.getQuestionAnswer1(), quizConfig.getAnswerNumber());
                  },
                  color: Colors.green,
                  child: Text(
                    quizConfig.getQuestionOption1(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 22)
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: MaterialButton(
                  minWidth: double.infinity,
                  onPressed: () {
                    checkAnswer(quizConfig.getQuestionAnswer2(), quizConfig.getAnswerNumber());
                  },
                  color: Colors.red,
                  child: Text(
                    quizConfig.getQuestionOption2(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 22)
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: score,
            )            
          ],
        ),
      ),
    );
  }
}
