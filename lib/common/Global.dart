import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wananandroidflutter/models/login/cacheConfig.dart';
import 'package:wananandroidflutter/models/login/profile.dart';

import 'CacheObject.dart';
import '../api/CommonService.dart';

// 提供五套可选主题色
const _themes = <Color>[
  Colors.blue,
  Color(0xfff34540),
  Color(0xFFF48FB1),
  Color(0xFFBA68C8),
];

class Global {
  static SharedPreferences _prefs;
  static Profile profile = Profile();
  // 网络缓存对象
  static NetCache netCache = NetCache();
  // 可选的主题列表
  static List<Color> get themes => _themes;
  // 是否为release版
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");
  //初始化全局信息，会在APP启动时执行
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
    var _profile = _prefs.getString("profile");
    if (_profile != null) {
      try {
        profile = Profile.fromJson(jsonDecode(_profile));
      } catch (e) {
        print(e);
      }
    }
    // 如果没有缓存策略，设置默认缓存策略
    profile.cache = profile.cache ?? CacheConfig()
      ..enable = true
      ..maxAge = 3600
      ..maxCount = 100;
    //初始化网络请求相关配置
    CommonService.init();
  }

  // 持久化Profile信息
  static saveProfile() => _prefs.setString("profile", jsonEncode(profile.toJson()));
}
