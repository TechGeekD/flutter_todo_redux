import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config.g.dart';

@JsonSerializable(createToJson: false)
class Config {
  final String env;
  final bool production;
  final String apiKey;
  final String apiUrl;

  Config({this.env, this.production, this.apiKey, this.apiUrl});

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);
}

class _InheritedConfig extends InheritedWidget {
  const _InheritedConfig(
      {Key key, @required this.config, @required Widget child})
      : assert(config != null),
        assert(child != null),
        super(key: key, child: child);
  final Config config;

  @override
  bool updateShouldNotify(_InheritedConfig oldWidget) =>
      config != oldWidget.config;
}

class ConfigWrapper extends StatelessWidget {
  ConfigWrapper({Key key, this.config, this.child});

  @override
  Widget build(BuildContext context) {
    return new _InheritedConfig(config: this.config, child: this.child);
  }

  static Config of(BuildContext context) {
    final _InheritedConfig inheritedConfig =
    context.inheritFromWidgetOfExactType(_InheritedConfig);
    return inheritedConfig.config;
  }

  final Config config;
  final Widget child;
}
