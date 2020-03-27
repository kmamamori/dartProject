import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';

dynamic getQuiz() async{
  var r = Random();
  var url = 'http://www.cs.utep.edu/cheon/cs4381/homework/quiz?quiz=quiz0${r.nextInt(7)}';
  var response = await http.get(url);
  return await json.decode(response.body);
}
