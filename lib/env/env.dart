import 'package:flutter/foundation.dart';

import 'package:flutter_todo_redux/env/configs/dev.dart' as dev;
import 'package:flutter_todo_redux/env/configs/prod.dart' as prod;

bool prodEnv = kReleaseMode;

Map<String, dynamic> get env => prodEnv ? prod.config : dev.config;
