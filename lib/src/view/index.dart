void displayQuiz(questions) async {
  var i = 0;
  await questions.forEach(await (q) {
    print('${++i}\t' + q['stem'] + '\n');
  });
  return;
}

void type1Q(options) {
  var op = 0;
  print('This is a Multiple choice questins');
  print('The opcions are ');
  options.forEach((o) {
    print('Enter ${++op} for option-${o}');
  });
}

void type2Q() {
  print('This is a fill-in-the-blank question.');
  print('Enter your answer:');
}

void displayGrade(grade) {
  print('The grade you received is: ${grade}');
  print('Would you like to review the question you got wrong? Enter 1 if so.');
}

void displayReview(n, questions) {
  var i = 0;
  questions.forEach((q) {
    if (n[i]==1) {
      print('${i++}\t' + q['stem']);
    }
  });
}
