import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:google_gemini/src/config/constants.dart';
import 'package:google_gemini/src/models/gemini/gemini_reponse.dart';
import 'package:http/http.dart' as http;

/// Generate Text from a query with Gemini Api and http
Future<GeminiHttpResponse> apiGenerateText({
  required String query, 
  required String apiKey, 
  String model = 'gemini-pro'
}) async {

  var url = Uri.https(
    Constants.endpoit, 
    'v1beta/models/$model:generateContent', 
    {'key': apiKey}
  );

  log("--- Generating ---");

  var response = await http.post(url, body:json.encode({
    "contents": [{ 
        "parts": [{
            "text": query
        }]
    }]
  }));

  log("--- Http Status ${response.statusCode} ---");

  if (response.statusCode == 200) {
    return GeminiHttpResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to Generate Text: ${response.statusCode}\n${response.body}');
  }

}

String _convertIntoBase64(File file) {
  log("--- ${file.path} ---");
  List<int> imageBytes = file.readAsBytesSync();
  String base64File = base64Encode(imageBytes);
  return base64File;
}


Future<GeminiHttpResponse> apiGenerateTextAndImages({
  required String query, 
  required String apiKey, 
  required File image,
  String model = 'gemini-pro-vision'
}) async {

  var url = Uri.https(
    Constants.endpoit, 
    'v1beta/models/$model:generateContent', 
    {'key': apiKey}
  );

  


  log("--- Generating From Text and Image ---");

  var base64Imge = _convertIntoBase64(image);

  var response = await http.post(url, body:json.encode({
    "contents": [{ 
        "parts": [
          {
            "text": query
          },
          {
            "inline_data": {
              "mime_type":"image/jpeg",
              "data": base64Imge,
            }
          }
        ]
    }]
  }));

  log("--- Http Status ${response.statusCode} ---");

  if (response.statusCode == 200) {
    return GeminiHttpResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to Generate Text: ${response.statusCode}\n${response.body}');
  }

}
