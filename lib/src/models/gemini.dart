import 'dart:developer';

import 'package:google_gemini/src/apis.dart';
import 'package:google_gemini/src/models/gemini_reponse.dart';

/// Google Gemini Main Class.
class GoogleGemini {
  
  String apiKey; // The API Key from Google
  String? model = 'gemini-pro'; // The model to use, gemini-pro by default

  GoogleGemini({
    required this.apiKey,
    this.model
  });

 

  /// Generate content from a query
  /// 
  /// Returns a [Future<String>] with the generated text
  /// If the request fails, it returns the [Error] as a [String] instead
  /// 
  Future<String> generateText(String query) async {
    String text = '';
    try {
      GeminiHttpResponse response = await apiGenerateText(
        query: query,
        apiKey: apiKey,
        model: model!
      );

      if(response.candidates.isNotEmpty) { 
        for(var part in response.candidates[0].content!['parts']) {
          text += part['text'];
        }
      }
      
    } catch (e) {
      log("Generate Text Error : ${e.toString()}");
      text = "Error: ${e.toString()}";
    }
    return text;
  }

  

}