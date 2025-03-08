import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task3/cubit/widgetstate.dart';
class CubitThemeState extends Cubit<ThemeMode>{
  CubitThemeState() :super(ThemeMode.light);
  dark(){
    emit(ThemeMode.dark );
  }
  light(){
    emit(ThemeMode.light);
  }
}
class CubitGenderState extends Cubit<GenderState>{
  CubitGenderState() : super(None());
  male(){
    emit(Male());
  }
  female(){
    emit(Female());
  }
}
class CubitCheckBoxState extends Cubit<CheckBoxState>{
  CubitCheckBoxState(): super(FalseState());
  truemark(){
    emit(TrueState());
  }
  nonemark(){
    emit(FalseState());
  }
}