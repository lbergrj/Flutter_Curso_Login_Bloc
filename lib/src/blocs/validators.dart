import 'dart:async';

class Validators{
  
  final validateEmail = StreamTransformer<String,String>.fromHandlers(
    handleData: (email, sink){
      if(email.contains('@' ) ){
        sink.add(email);
      }
      else{
        sink.addError('Enter a valid Email');
      }
    }
  );

  final validatePassword = StreamTransformer<String,String>.fromHandlers(
    handleData: (pass, sink){
      if(pass.isEmpty){
         sink.addError('Insira sua senha');
      }
      else if(pass.length > 3){
        sink.add(pass);
      }
      else{
        sink.addError('Password must be at list 4 characters');
      }
    }
  );


}
