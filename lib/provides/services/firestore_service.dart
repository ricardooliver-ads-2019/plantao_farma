// ignore_for_file: unused_element, avoid_print, unnecessary_brace_in_string_interps, await_only_futures
import 'dart:math';

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
  List<Farmacia> listDetailFarma = [];
  String collectionFirestore = 'farmacias';
  bool isLoading = true;

  FirestoreService(){
    _startFirestore();
    
  }

  _startFirestore()async{
    //await _listFirestore();
    await _listFirestoreAtual();
  }

  void _addList(Farmacia farma) async{
    listDetailFarma.add(farma);
    notifyListeners();
  }


  cadastrar(Farmacia farmacia)async{
    try{
      await dbFirestore.collection(collectionFirestore).doc().set({
        'name': farmacia.nome,
        'cnpj': farmacia.cnpj,
        'email': farmacia.email,
        'logo': farmacia.logo,
        'telefone': farmacia.telefone,
        'telefone2': farmacia.telefone2,
        'whatsapp': farmacia.whatsapp,
        'endereco': farmacia.endereco,
        'bairro': farmacia.bairro,
        'cidade': farmacia.cidade,
        'uf': farmacia.uf,
        'cep': farmacia.cep,
        'horarioAbertura': farmacia.horarioAbertura,
        'horarioFechamento': farmacia.horarioFechamento,
        'horaAber': farmacia.horarioA,
        'horaFech': farmacia.horarioF,
        'plantao':farmacia.plantao,
      });

      //list.add(farmacia);
      //  notifyListeners();
      
    } on FirebaseFirestore catch (e){

      throw FirestoreExceptions(e.toString());
        
    }

  }

  _listFirestoreAtual() async{
    list.clear();
    await dbFirestore.collection(collectionFirestore).snapshots().listen(
      (event) { 
        list.clear();
        for (DocumentSnapshot item in event.docs) {
          //var docs = item.data();
          //var name = item.get('name');
          //var dados = item.id;
          
          Farmacia farma = Farmacia(
            id: item.id,
            nome: item.get('name'), 
            cnpj: item.get('cnpj'),
            email: item.get('email'), 
            logo: item.get('logo'),
            telefone: item.get('telefone'),
            telefone2: item.get('telefone2'),
            whatsapp: item.get('whatsapp'),
            endereco: item.get('endereco'),
            bairro: item.get('bairro'),
            cidade: item.get('cidade'),
            cep: item.get('cep'),
            uf: item.get('uf'),         
            horarioAbertura: item.get('horarioAbertura'), 
            horarioFechamento: item.get('horarioFechamento'),
            horarioA: item.get('horaAber'),
            horarioF: item.get('horaFech'), 
            plantao: item.get('plantao')
          );
            
            list.add(farma);
            notifyListeners();
          print('Dasdos exibicao: ${farma} - ${farma.nome} -  ${farma.horarioA} - ${farma.horarioF}');
        }
        
      }
    );
    
  }

  listDetailsFarmaFirestore(Farmacia farmacia) async{
    
    // metodo para buscar um registro pelo seu id
    await dbFirestore.collection(collectionFirestore).doc(farmacia.id).snapshots().listen(
      (event) {
          listDetailFarma.clear();
          Farmacia farma = Farmacia(
            id: event.id,
            nome: event.get('name'), 
            cnpj: event.get('cnpj'),
            email: event.get('email'), 
            logo: event.get('logo'),
            telefone: event.get('telefone'),
            telefone2: event.get('telefone2'),
            whatsapp: event.get('whatsapp'),
            endereco: event.get('endereco'),
            bairro: event.get('bairro'),
            cidade: event.get('cidade'),
            cep: event.get('cep'),
            uf: event.get('uf'), 
            horarioAbertura: event.get('horarioAbertura'), 
            horarioFechamento: event.get('horarioFechamento'),
            horarioA: event.get('horaAber'),
            horarioF: event.get('horaFech'), 
            plantao: event.get('plantao')
          );
          listDetailFarma.add(farma);
          notifyListeners();
          notifyListeners();
          notifyListeners();
          notifyListeners();
          notifyListeners();
          print('**********: ${farma} - ${farma.nome} -  ${farma.horarioA}');
          print('List teste ${listDetailFarma}');
        

    });
  }
  




   
  _listFirestore() async{
    var result = await dbFirestore.collection(collectionFirestore).get();
    for (var doc in result.docs) {  
      Farmacia farmacia = Farmacia(
        id: doc.reference.id.toString(),
        nome: doc.get('name'),
        cnpj: doc.get('cnpj'),
        email: doc.get('email'),  
        logo: doc.get('logo'),
        telefone: doc.get('telefone'),
        telefone2: doc.get('telefone2'),
        whatsapp: doc.get('whatsapp'),
        endereco: doc.get('endereco'),
        bairro: doc.get('bairro'),
        cidade: doc.get('cidade'),
        cep: doc.get('cep'),
        uf: doc.get('uf'), 
        horarioAbertura: doc.get('horarioAbertura'), 
        horarioFechamento: doc.get('horarioFechamento'), 
        horarioA: doc.get('horaAber'),
        horarioF: doc.get('horaFech'),
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
        'horaAber': farmacia.horarioA,
        'horaFech': farmacia.horarioF,
        'plantao':farmacia.plantao,
      });
     
    } on FirebaseFirestore catch (e){

      throw FirestoreExceptions(e.toString());
        
    }

  }

  remove(Farmacia farma) async{  
    if (list.length == 1){
      dbFirestore.collection(collectionFirestore).doc(farma.id).delete();
      list.remove(farma);
      notifyListeners();
    }else{
      dbFirestore.collection(collectionFirestore).doc(farma.id).delete();
    }
    

  }

}