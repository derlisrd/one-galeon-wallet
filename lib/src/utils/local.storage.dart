import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage{
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  
  


  void storeString(String key, String value)async{
    final SharedPreferences prefs = await _prefs;
    prefs.setString(key, value);
  }

   
   
   getString(String key)async{
    final SharedPreferences prefs = await _prefs;
    var obtener =  prefs.getString(key);
    return (obtener);
  }

  removeString(String key)async{
    final SharedPreferences prefs = await _prefs;
    await prefs.remove(key);
  }

}