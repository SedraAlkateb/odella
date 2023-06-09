import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/presentation/resources/language_manager.dart';

const String PREFS_KEY_LANG="PREFS_KEY_LANG";
const String PREFS_KEY_LS_USER_LOGGED_IN="PREFS_KEY_IS_USER_LOGGED_IN";
const String PREFS_KEY_TOKEN="PREFS_KEY_TOKEN";

class  AppPreferences{
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);

  Future<String>getAppLanguage()async{
    String? language = _sharedPreferences.getString(PREFS_KEY_LANG);
      if(language!=null&&language.isNotEmpty){
        return language;
      }else{
        //return default lang
        return LanguageType.ENGLISH.getValue();
      }


  }
  Future<void> changeAppLanguage()async{
     String currentLang= await getAppLanguage();
     if(currentLang==LanguageType.ARABIC.getValue()){
       _sharedPreferences.setString(PREFS_KEY_LANG, LanguageType.ENGLISH.getValue());
     }else{
       _sharedPreferences.setString(PREFS_KEY_LANG, LanguageType.ARABIC.getValue());

     }
  }


  Future<Locale> getLocale()async{
    String currentLang= await getAppLanguage();
    if(currentLang==LanguageType.ARABIC.getValue()){
      return ARABIC_LOCALE;
    }else{
     return ENGLISH_LOCALE;
    }
  }
  // on board is logging
Future<bool> setLoggedIn(String token)async{
 await   _sharedPreferences.setBool(PREFS_KEY_LS_USER_LOGGED_IN, true);
  await  _sharedPreferences.setString(PREFS_KEY_TOKEN,token );

return true;
}
  Future<bool> isUserLoggedIn()async{

   return _sharedPreferences.getBool(PREFS_KEY_LS_USER_LOGGED_IN) ?? false;

  }
/////////////////Token
/*
  Future<void> setToken(String token)async{
    _sharedPreferences.setString(PREFS_KEY_TOKEN,token );

  }
 */

  Future<String> getToken()async{
    return _sharedPreferences.getString(PREFS_KEY_TOKEN) ?? "";

  }
  Future<void> signOut()async{
    await _sharedPreferences.remove(PREFS_KEY_TOKEN);
    await _sharedPreferences.remove(PREFS_KEY_LS_USER_LOGGED_IN);

  }


}