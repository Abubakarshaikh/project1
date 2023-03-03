import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'survey_form_state.dart';

class SurveyFormCubit extends Cubit<int> {
  SurveyFormCubit() : super(1);

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    emit(state - 1);
  }

  void reset() {
    emit(1);
  }
}
