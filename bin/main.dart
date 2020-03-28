import '../lib/src/view/index.dart';
import '../lib/src/model/index.dart';
import '../lib/src/controller/index.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) async {
  var r = Random();
  var o = 1;
  while (o == 1) {
    var response;
    try {
      response = await http.get(
          'http://www.cs.utep.edu/cheon/cs4381/homework/quiz?quiz=quiz0${r.nextInt(7)}');
      await startQuiz(response);
    } catch (e) {
      print('NO INTERNET CONNECT!');
    }
    print('Enter 1 if take another quiz.');
    print('Enter 2 if exit program.\n');
    o = optionInput(2);
  }
  print('THANK YOU!');
}

void startQuiz(response) async {
  view v = view();
  model m = model();
  controller c = controller(m, v);
  var data = await json.decode(response.body);
  c.setResponse(data['response']);
  if (c.getResponse) {
    c.setQuizInfo(data['quiz']);
    c.displayQuestions();
    var i = 0;
    var l = 0;
    c.getQuestions.forEach((q) {
      if (q['type'] == 1) {
        //multiple choice
        c.displayQuestion("${++i} - ${q['stem']}");
        l = c.displayOptions(q['option']);
        c.addAnswer(c.optionInput(l) == q['answer'] ? 1 : 0);
      } else {
        //fill in the blank
        c.displayQuestion("${++i} - ${q['stem']}");
        c.addAnswer(c.fillBlankInput() == q['answer'] ? 1 : 0);
      }
    });
    print('The grade you received is ${c.calculateGrades()}/${i}');
    print('Would you like to review the questions you got wrong?\n');
    print('\tEnter 1 if so.\n\tEnter 2 if not.');
    if (c.optionInput(2) == 1) {
      c.displayReview();
    }
  } else {
    print(data['reason']);
  }
}

int optionInput(l) {
  var cc;
  try {
    var c = stdin.readLineSync();
    cc = int.parse(c);
  } catch (e) {
    print('Pick the number between 1-${l}');
    stdout.write('Invalid Input.\n');
    return optionInput(l);
  }
  if (cc > 0 && cc < l + 1) {
    return cc;
  } else {
    print('Pick the number between 1-${l}\n');
    return optionInput(l);
  }
}
