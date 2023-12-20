import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:google_gemini/src/config/constants.dart';
import 'package:google_gemini/src/models/config/gemini_safety_settings.dart';
import 'package:google_gemini/src/models/config/gemini_config.dart';
import 'package:google_gemini/src/models/gemini/gemini_reponse.dart';
import 'package:http/http.dart' as http;

/// Convert safetySettings List int a json
List<Map<String, dynamic>> _convertSafetySettings(
    List<SafetySettings> safetySettings) {
  List<Map<String, dynamic>> list = [];
  for (var element in safetySettings) {
    list.add(element.toJson());
  }
  return list;
}

/// Generate Text from a query with Gemini Api and http
/// requires a query, an apiKey,
Future<GeminiHttpResponse> apiGenerateText(
    {required String query,
    required String apiKey,
    required GenerationConfig? config,
    required List<SafetySettings>? safetySettings,
    String model = 'gemini-pro'}) async {
  var url = Uri.https(Constants.endpoit, 'v1beta/models/$model:generateContent',
      {'key': apiKey});

  log("--- Generating ---");

  var response = await http.post(url,
      body: json.encode({
        "contents": [
          {
            "parts": [
              {"text": query}
            ]
          }
        ],
        "safetySettings": _convertSafetySettings(safetySettings ?? []),
        "generationConfig": config?.toJson()
      }));

  log("--- Http Status ${response.statusCode} ---");

  if (response.statusCode == 200) {
    return GeminiHttpResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception(
        'Failed to Generate Text: ${response.statusCode}\n${response.body}');
  }
}

/// Convert a File into a base64 String
String _convertIntoBase64(File file) {
  log("--- ${file.path} ---");
  List<int> imageBytes = file.readAsBytesSync();
  String base64File = base64Encode(imageBytes);
  return base64File;
}

/// Generate Text from a query with Gemini pro-vision model
/// requires an image File, and a query
Future<GeminiHttpResponse> apiGenerateTextAndImages(
    {required String query,
    required String apiKey,
    required File image,
    required GenerationConfig? config,
    required List<SafetySettings>? safetySettings,
    String model = 'gemini-pro-vision'}) async {
  var url = Uri.https(Constants.endpoit, 'v1beta/models/$model:generateContent',
      {'key': apiKey});

  log("--- Generating From Text and Image ---");

  var base64Imge = _convertIntoBase64(image);

  var response = await http.post(url,
      body: json.encode({
        "contents": [
          {
            "parts": [
              {"text": query},
              {
                "inline_data": {
                  "mime_type": "image/jpeg",
                  "data": base64Imge,
                }
              },
            ]
          }
        ],
        "safetySettings": _convertSafetySettings(safetySettings ?? []),
        "generationConfig": config?.toJson()
      }));

  log("--- Http Status ${response.statusCode} ---");

  if (response.statusCode == 200) {
    return GeminiHttpResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception(
        'Failed to Generate Text: ${response.statusCode}\n${response.body}');
  }
}
