// ignore_for_file: constant_identifier_names

/// Safety Category
enum SafetyCategory {
  HARM_CATEGORY_UNSPECIFIED,
  HARM_CATEGORY_DEROGATORY,
  HARM_CATEGORY_TOXICITY,
  HARM_CATEGORY_VIOLENCE,
  HARM_CATEGORY_SEXUAL,
  HARM_CATEGORY_MEDICAL,
  HARM_CATEGORY_DANGEROUS,
  HARM_CATEGORY_HARASSMENT,
  HARM_CATEGORY_HATE_SPEECH,
  HARM_CATEGORY_SEXUALLY_EXPLICIT,
  HARM_CATEGORY_DANGEROUS_CONTENT
}

/// Safety Threshold
enum SafetyThreshold {
  HARM_BLOCK_THRESHOLD_UNSPECIFIED,
  BLOCK_LOW_AND_ABOVE,
  BLOCK_MEDIUM_AND_ABOVE,
  BLOCK_ONLY_HIGH,
  BLOCK_NONE
}

/// Safety settings are part of the request you send to the text service.
/// It can be adjusted for each request you make to the API.
class SafetySettings {
  final SafetyCategory category;
  final SafetyThreshold threshold;

  SafetySettings({required this.category, required this.threshold});

  /// from json
  factory SafetySettings.fromJson(Map<String, dynamic> json) {
    return SafetySettings(
        category: SafetyCategory.values
            .firstWhere((e) => e.toString() == '${json['category']}'),
        threshold: SafetyThreshold.values
            .firstWhere((e) => e.toString() == '${json['threshold']}'));
  }

  /// to json
  Map<String, dynamic> toJson() {
    return {'category': category.name, 'threshold': threshold.name};
  }
}
