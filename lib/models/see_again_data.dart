import 'package:flutter/cupertino.dart';

@immutable
class StoryData {
  const StoryData({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;
}