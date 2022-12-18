import 'dart:convert';

import 'package:media_player/model/media.dart';
import 'package:media_player/model/services/base_service.dart';
import 'package:media_player/model/services/media_service.dart';

class MediaRepository {
  BaseService _mediaService = MediaService();

  Future<List<Media>> fetchMediaList(String value) async {
    dynamic response = await _mediaService.getResponse(value);
    final jsonData = response['results'] as List;
    List<Media> mediaList =
        jsonData.map((data) => Media.fromJson(data)).toList();
    return mediaList;
  }
}
