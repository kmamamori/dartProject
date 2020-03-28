class view{
  void displayQuestion(q){
    print(q);
  }

  void displayQuestions(questions){
    var i=0;
    questions.forEach((q){
      print('Question${++i}');
      print('\t'+q['stem']+'\n');
    });
  }

  int displayOptions(ops){
    var i = 0;
    ops.forEach((o){
      print('\tEnter ${++i} for option-${o}');
    });
    return i;
  }

  void displayReview(grades, questions){
    var i = 0;
    questions.forEach((q){
      if(grades[i++]==0){
        displayQuestion('${i} - ${q['stem']}');
        print('\n');
      }
    });
  }

}