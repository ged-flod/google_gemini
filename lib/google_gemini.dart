library google_gemini;

/// Google Gemini Main Class.
class GoogleGemini {
  
  String apiKey; // The API Key from Google

  GoogleGemini(this.apiKey);

  // Ask to google gemini api
  Future<String> ask(String query) {
    // TODO: implement ask
    return Future.value("Hello, I'm Google Gemini, $query");
  }
  
}