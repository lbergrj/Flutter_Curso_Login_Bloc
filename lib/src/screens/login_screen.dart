// Documentação oficial de bibliotecas em dart
//https://pub.dev/

import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';


class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
      margin: EdgeInsets.all(50.0),
      child: Column(
        children:[
          emailField(bloc),
          passwordField(bloc),
          Container(
            margin:EdgeInsets.only(top:25),
          ),
          submitButton(bloc),
        ]
      ),
    );
    
  }

  Widget emailField(Bloc bloc){
      bloc.changeEmail;
      return StreamBuilder(
      stream: bloc.email,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return TextField(
            onChanged:  bloc.changeEmail,
            obscureText: false,
            decoration: InputDecoration(
            hintText: 'Digite seu email',
            labelText: 'Email',
            errorText: snapshot.error,
          ),
        );
      },        
    );
  }
  

  Widget passwordField(Bloc bloc){
      return StreamBuilder(
      stream: bloc.password,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {           
         return TextField( 
           onChanged:  bloc.changePassword,                              
           obscureText: false,
           decoration: InputDecoration(
            hintText: 'Password',
            labelText: 'Password',            
            errorText: snapshot.error,
                              
          ),
        );
        },      
      );
      
  }

  //Na Classe Bloc temos o método get submitValid fazendo a soma dos strems de get Email e get Passsword e retornado um bool
  //No método onPressend é verificado se há erro no stream submitValic , com im IF ternário

  Widget submitButton(Bloc bloc){
      return StreamBuilder(
        stream: bloc.submitValid,
        builder: (context, snapshot){
           return RaisedButton(
              color: Colors.blue[200],       
              child: Text ('Login'),
               onPressed: snapshot.hasData ? bloc.submit : null,
          );
        }
      );
  }

}