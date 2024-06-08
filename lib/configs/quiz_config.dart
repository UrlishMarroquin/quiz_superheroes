import 'package:quizsuperheroes/models/quiz_model.dart';

class QuizConfig {
  List<QuizModel> questionList = [
    QuizModel(image: "assets/images/imagen01.png", option1: "Iron Man", answer1: true, option2: "Iron Boy", answer2: false),
    QuizModel(image: "assets/images/imagen02.png", option1: "Trueno", answer1: false, option2: "Thor", answer2: true),
    QuizModel(image: "assets/images/imagen03.png", option1: "Mole", answer1: false, option2: "Hulk", answer2: true),
    QuizModel(image: "assets/images/imagen04.png", option1: "Ojo de Halcon", answer1: true, option2: "Mano de Halcon", answer2: false),
    QuizModel(image: "assets/images/imagen05.png", option1: "Capitan America", answer1: true, option2: "Capitan Britanea", answer2: false),
    QuizModel(image: "assets/images/imagen06.png", option1: "Pantera Negra", answer1: true, option2: "Tigre Negro", answer2: false),
  ];
  int questionIndex = 0;

  String getQuestionImagen() {
    return questionList[questionIndex].image;
  }

  String getQuestionOption1() {
    return questionList[questionIndex].option1;
  }

  bool getQuestionAnswer1() {
    return questionList[questionIndex].answer1;
  }

    String getQuestionOption2() {
    return questionList[questionIndex].option2;
  }

  bool getQuestionAnswer2() {
    return questionList[questionIndex].answer2;
  }

  String getAnswerNumber() {
    return (questionIndex + 1).toString();
  }

  void nextQuestion() {
    if (questionIndex < questionList.length - 1) {
      questionIndex++;
    }
  }

  bool isFinished() {
    // if (questionIndex > questionList.length - 1) {
    //   return true;
    // } else {
    //   return false;
    // }

    return questionIndex > questionList.length - 2 ? true : false;
  }

  void restarQuizz() {
    questionIndex = 0;
  }
}
