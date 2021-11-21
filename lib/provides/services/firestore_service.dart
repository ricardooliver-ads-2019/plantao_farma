
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreExceptions implements Exception{
  String message;
  FirestoreExceptions(this.message);
}

class FirestoreService extends ChangeNotifier{
  final FirebaseFirestore dbFirestore = FirebaseFirestore.instance;
  String collectionFirestore = 'farmacias';
  bool isLoading = true;

   cadastrar(String nome, String email, String cnpj, String telefone, String whatsapp, String cep, String endereco, String horarioAbertura, String horarioFechamento, bool platao,)async{
    try{
      await dbFirestore.collection(collectionFirestore).doc().set({
        'name': nome,
        'e-mail': email,
        'cnpj': cnpj,
        'phone': telefone,
        'whatsapp': whatsapp,
        'cep': cep,
        'endereco': endereco,
        'horario_abertura': horarioAbertura,
        'horario_fechamento': horarioFechamento,
        'plantonista': platao,
      });
      
    } on FirebaseFirestore catch (e){

      throw FirestoreExceptions(e.toString());
        
    }

  }

  
}