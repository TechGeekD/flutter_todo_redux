import 'package:json_annotation/json_annotation.dart';

part 'package:flutter_todo_redux/env/configs/prod.g.dart';

@JsonLiteral('prod.json', asConst: true)
Map<String, dynamic> get config => _$configJsonLiteral;
