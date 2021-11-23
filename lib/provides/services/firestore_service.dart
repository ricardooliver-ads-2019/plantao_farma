
// ignore_for_file: unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plantao_farma/models/farmacia.dart';

class FirestoreExceptions implements Exception{
  String message;
  FirestoreExceptions(this.message);
}

class FirestoreService extends ChangeNotifier{
  final FirebaseFirestore dbFirestore = FirebaseFirestore.instance;
  List<Farmacia> list = [];
  String collectionFirestore = 'farmacias';
  bool isLoading = true;

  FirestoreService(){
    _startFirestore();
  }

  _startFirestore()async{
    await _listFirestore();
  }


  cadastrar(Farmacia farmacia)async{
    try{
      await dbFirestore.collection(collectionFirestore).doc().set({
        'name': farmacia.nome,
        'cnpj': farmacia.cnpj,
        'logo': farmacia.logo,
        'horarioAbertura': farmacia.horarioAbertura,
        'horarioFechamento': farmacia.horarioFechamento,
        'plantao':farmacia.plantao,
      });

      list.add(farmacia);
        notifyListeners();
      
    } on FirebaseFirestore catch (e){

      throw FirestoreExceptions(e.toString());
        
    }

  }
   
  _listFirestore() async{
    var result = await dbFirestore.collection(collectionFirestore).get();
    for (var doc in result.docs) {
      Farmacia farmacia = Farmacia(
        id: doc.reference.id.toString(),
        nome: doc.get('name'),
        cnpj: doc.get('cnpj'),  
        logo: doc.get('logo'), 
        horarioAbertura: doc.get('horarioAbertura'), 
        horarioFechamento: doc.get('horarioFechamento'), 
        plantao: doc.get('plantao'),
      );
        list.add(farmacia);
        notifyListeners();

    }
  }

  update(Farmacia farmacia)async{
    try{
      await dbFirestore.collection(collectionFirestore).doc(farmacia.id).update({
        'name': farmacia.nome,
        'cnpj': farmacia.cnpj,
        'logo': farmacia.logo,
        'horarioAbertura': farmacia.horarioAbertura,
        'horarioFechamento': farmacia.horarioFechamento,
        'plantao':farmacia.plantao,
      });

      list.add(farmacia);
        notifyListeners();
      
    } on FirebaseFirestore catch (e){

      throw FirestoreExceptions(e.toString());
        
    }

  }

  remove(Farmacia farma) async{
    list.remove(farma);
    notifyListeners();
    dbFirestore.collection(collectionFirestore).doc(farma.id).delete();

  }

}