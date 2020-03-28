class model{

  List questions = List();
  List grades = List();
  var res;
  var quizName;
  
  void setResponse(res){
    this.res = res;
  }

  bool get getResponse => res;

  void setQuestions(questions){
    questions.forEach((q){
      this.questions.add(q);
    });
  }

  void setQuizName(name){
    quizName = name;
  }

  get getQuestions => questions;


  void addAnswer(a){
    grades.add(a);
  }

  get getGrades => grades;

}
