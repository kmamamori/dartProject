import 'dart:io';

int getAnswerInput(){
  var s = stdin.readLineSync();
  try{
    return int.parse(s);
  }catch(e){
    return -1;
  }
}

String getFillInblank(){
  return stdin.readLineSync();
}
