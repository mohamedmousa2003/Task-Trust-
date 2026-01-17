import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/enum/enum_language.dart';

class LanguageCubit extends Cubit<Language> {
  LanguageCubit() : super(Language.en);

  void changeLanguage(Language lang) => emit(lang);
}