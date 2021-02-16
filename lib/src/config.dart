import 'package:global_configuration/global_configuration.dart';

class Config {
  void loadFromMap(Map<String, dynamic> map) {
    GlobalConfiguration().loadFromMap(map);
  }

  dynamic readValue(String key) => GlobalConfiguration().getValue(key);
}
