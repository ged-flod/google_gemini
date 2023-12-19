import 'dart:io';

import 'package:google_gemini/src/models/config/gemini_safety_settings.dart';
import 'package:google_gemini/src/models/config/gemini_config.dart';
import 'package:google_gemini/src/repository/apis.dart';
import 'package:google_gemini/src/models/gemini/gemini_reponse.dart';

/// Google Gemini Main Class.
class GoogleGemini {
  
  String apiKey; // The API Key from Google
  GenerationConfig? config;
  List<SafetySettings>? safetySettings;
  String? model = 'gemini-pro'; // The model to use, gemini-pro by default

  GoogleGemini({
    required this.apiKey,
    this.config,
    this.safetySettings,
    this.model
  });

 
  /// Generate content from a query
  /// 
  /// Returns a [Future<String>] with the generated text
  /// If the request fails, it returns the [Error] as a [String] instead
  /// 
  Future<GeminiResponse> generateFromText(String query) async {
    String text = '';
   
    GeminiHttpResponse httpResponse = await apiGenerateText(
      query: query,
      apiKey: apiKey,
      config: config,
      safetySettings: safetySettings,
      model: "gemini-pro"
    );

    if(httpResponse.candidates.isNotEmpty) { 
      for(var part in httpResponse.candidates[0].content!['parts']) {
        text += part['text'];
      }
    }

    GeminiResponse response = GeminiResponse(
      text: text,
      response: httpResponse
    );
    return response;

  }

  Future<GeminiResponse> generateFromTextAndImages({required String query, required File image}) async {
    String text = '';
   
    GeminiHttpResponse httpResponse = await apiGenerateTextAndImages(
      query: query,
      apiKey: apiKey,
      image: image,
      config: config,
      safetySettings: safetySettings,
      model: "gemini-pro-vision"
    );

    if(httpResponse.candidates.isNotEmpty) { 
      for(var part in httpResponse.candidates[0].content!['parts']) {
        text += part['text'];
      }
    }

    GeminiResponse response = GeminiResponse(
      text: text,
      response: httpResponse
    );
    return response;

  }


  

}