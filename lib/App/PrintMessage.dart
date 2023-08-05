import 'PreferenceManager.dart';

class PrintMessage{
  static printMessage(String message){
    PreferenceManager().saveLogs(logs: message);
    print(message);
  }
}