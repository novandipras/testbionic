// To parse this JSON data, do
//
//     final photosResponseData = photosResponseDataFromJson(jsonString);

import 'dart:convert';

List<PhotosResponseData> photosResponseDataFromJson(String str) => List<PhotosResponseData>.from(json.decode(str).map((x) => PhotosResponseData.fromJson(x)));

String photosResponseDataToJson(List<PhotosResponseData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PhotosResponseData {
  final int? albumId;
  final int? id;
  final String? title;
  final String? url;
  final String? thumbnailUrl;

  PhotosResponseData({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  factory PhotosResponseData.fromJson(Map<String, dynamic> json) => PhotosResponseData(
    albumId: json["albumId"],
    id: json["id"],
    title: json["title"],
    url: json["url"],
    thumbnailUrl: json["thumbnailUrl"],
  );

  Map<String, dynamic> toJson() => {
    "albumId": albumId,
    "id": id,
    "title": title,
    "url": url,
    "thumbnailUrl": thumbnailUrl,
  };
}
