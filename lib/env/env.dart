import 'dev.dart' as dev;
import 'prod.dart' as prod;

bool prodEnv = false;

Map<String, dynamic> get env => prodEnv ? prod.config : dev.config;
