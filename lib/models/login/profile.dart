import 'package:json_annotation/json_annotation.dart';
import 'package:wananandroidflutter/models/login/UserDetailModel.dart';
import "cacheConfig.dart";
part 'profile.g.dart';

@JsonSerializable()
class Profile {
  Profile();

  UserDetailModel user;
  String token;
  num theme;
  CacheConfig cache;
  String lastLogin;
  String locale;

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
