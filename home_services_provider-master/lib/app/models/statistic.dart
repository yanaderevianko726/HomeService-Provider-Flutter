import 'package:flutter/material.dart';

import 'parents/model.dart';

class Statistic extends Model {
  String id;
  String value;
  String description;
  Color textColor;
  Color backgroundColor;

  Statistic({this.id, this.value, this.description, this.textColor, this.backgroundColor});

  Statistic.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    value = stringFromJson(json, 'value', defaultValue: '0');
    description = stringFromJson(json, 'description');
  }

  Map<String, dynamic> toJson() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["value"] = value;
    map["description"] = description;
    return map;
  }
}
