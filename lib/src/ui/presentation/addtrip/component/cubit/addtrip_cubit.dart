import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


class AddtripCubit extends Cubit<String> {
  AddtripCubit() : super('male');

  void onGenderSelected(String genderKey) => emit(genderKey);
}
