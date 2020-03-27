import 'package:kenamamorihw1/src/controller/index.dart' as controller;
import 'package:kenamamorihw1/src/model/index.dart' as model;
import 'package:kenamamorihw1/src/view/index.dart' as view;

void main(List<String> arguments) async {
  var data = await model.getQuiz();
  var i = 0;
  var c1 = 0;
  var c2;
  var grade = 0;
  List n = List();
  if (data['response'] == true) {
    await view.displayQuiz(data['quiz']['question']);
    data['quiz']['question'].forEach((t) {
      print('\nQuestion ${++i}');
      if (t['type'] == 1) {
        view.type1Q(t['option']);
        c1 = controller.getAnswerInput();
        if (t['answer'] == c1) {
          grade++;
          n.add(0);
        } else {
          n.add(1);
        }
      } else {
        view.type2Q();
        c2 = controller.getFillInblank();
        if (c2 == t['answer']) {
          grade++;
          n.add(0);
        } else {
          n.add(1);
        }
      }
    });
    view.displayGrade(grade);
    c1 = controller.getAnswerInput();
    if(c1==1){
      view.displayReview(n, data['quiz']['question']);
    }
  } else {
    print(data['reason']);
  }

  print('Thank you for using Quiz software!!!'); 
}
