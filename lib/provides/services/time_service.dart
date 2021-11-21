// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

class TimeService extends ChangeNotifier{
  TimeOfDay horarioAbertura = TimeOfDay(hour: 8, minute: 0);
  TimeOfDay horarioFechamento = TimeOfDay(hour: 8, minute: 0);
  

  getHorarioAbertura(TimeOfDay horario){ // captura o usuario atural
    horarioAbertura = horario;
    print(horarioAbertura);
    notifyListeners();
  }

  getHorarioFechamento(TimeOfDay horario){ // captura o usuario atural
    horarioFechamento = horario;
    print(horarioFechamento);
    notifyListeners();
  }

  
}