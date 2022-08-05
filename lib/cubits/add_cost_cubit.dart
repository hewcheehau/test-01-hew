
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCostCubit extends Cubit<double> {
  AddCostCubit():super(0.00);

  void addCost(double newvalue) => emit(newvalue);

}