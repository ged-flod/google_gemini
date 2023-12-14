
/// The Response from the Google Generativeai can hold multiple candidates
/// This class is used to create a instance of a candidate
class GeminiHttpResponseCandidate {

  final String? finishReason;
  final int index;
  Map<String, dynamic>? content = {
    "parts": [],
    "role": "model"
  };
  final List safetyRatings;

  GeminiHttpResponseCandidate({
    this.finishReason,
    required this.index,
    this.content,
    required this.safetyRatings
  });

  /// Create a GeminiHttpResponseCandidate from a json
  factory GeminiHttpResponseCandidate.fromJson(Map<String, dynamic> json) {
    return GeminiHttpResponseCandidate(
      finishReason: json['finishReason'],
      index: json['index'],
      content: json['content'],
      safetyRatings: json['safetyRatings']
    );
  }

  /// Convert a GeminiHttpResponseCandidate to a json
  Map<String, dynamic> toJson() {
    return {
      'finishReason': finishReason,
      'index': index,
      'content': content,
      'safetyRatings': safetyRatings
    };
  }

}



/// Format the response from the google generativeai server into a more readable format
/// This class is used to create a instance of GeminiHttpResponse from http response
class GeminiHttpResponse{

  final List<GeminiHttpResponseCandidate> candidates;
  Map<String, dynamic>? promptFeedback = {
    "safetyRatings": []
  };

  GeminiHttpResponse({
    required this.candidates,
    this.promptFeedback
  });

  /// Create a GeminiHttpResponse from a json
  /// populates the candidates list from the json
  /// populates the promptFeedback from the json
  factory GeminiHttpResponse.fromJson(Map<String, dynamic> json) {
    List<GeminiHttpResponseCandidate> responseCandidates = [];
    for (var candidate in json['candidates']) {
      responseCandidates.add(GeminiHttpResponseCandidate.fromJson(candidate));
    }
    return GeminiHttpResponse(
      candidates: responseCandidates,
      promptFeedback: json['promptFeedback']
    );
  }

  /// Convert a GeminiHttpResponse to a json
  /// converts the candidates list to a json
  /// populates the promptFeedback 
  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> localCandidates = [];
    for (var candidate in candidates) {
      localCandidates.add(candidate.toJson());
    }
    return {
      'candidates': candidates,
      'promptFeedback': promptFeedback
    };
  }

}
