/*
 * Copyright (c) 2020 .
 */
import 'e_service_model.dart';
import 'parents/model.dart';
import 'user_model.dart';

class Review extends Model {
  String id;
  double rate;
  String review;
  DateTime createdAt;
  User user;
  EService eService;

  Review({this.id, this.rate, this.review, this.createdAt, this.user, this.eService});

  Review.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    rate = doubleFromJson(json, 'rate');
    review = stringFromJson(json, 'review');
    createdAt = dateFromJson(json, 'created_at', defaultValue: DateTime.now().toLocal());
    user = objectFromJson(json, 'user', (v) => User.fromJson(v));
    eService = objectFromJson(json, 'e_service', (v) => EService.fromJson(v));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['rate'] = this.rate;
    data['review'] = this.review;
    data['created_at'] = this.createdAt;
    if (this.user != null) {
      data['user_id'] = this.user.id;
    }
    if (this.eService != null) {
      data['e_service_id'] = this.eService.id;
    }
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is Review &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          rate == other.rate &&
          review == other.review &&
          createdAt == other.createdAt &&
          user == other.user &&
          eService == other.eService;

  @override
  int get hashCode => super.hashCode ^ id.hashCode ^ rate.hashCode ^ review.hashCode ^ createdAt.hashCode ^ user.hashCode ^ eService.hashCode;
}
