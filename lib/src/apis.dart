import 'dart:convert';
import 'dart:developer';

import 'package:google_gemini/src/constants.dart';
import 'package:google_gemini/src/models/gemini_reponse.dart';
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
