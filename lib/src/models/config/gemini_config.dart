/// Every prompt you send to the model includes parameter values that control how the model generates a response.
/// The model can generate different results for different parameter values.
/// This class is used to create a instance of a Generation Config to control the model
class GenerationConfig {
  double temperature;
  int maxOutputTokens;
  double topP;
  int topK;
  List<String>? stopSequences;

  GenerationConfig(
      {required this.temperature,
      required this.maxOutputTokens,
      required this.topP,
      required this.topK,
      this.stopSequences});

  /// from json
  factory GenerationConfig.fromJson(Map<String, dynamic> json) {
    return GenerationConfig(
        temperature: json['temperature'],
        maxOutputTokens: json['maxOutputTokens'],
        topP: json['topP'],
        topK: json['topK'],
        stopSequences: json['stopSequences']);
  }

  /// to json
  Map<String, dynamic> toJson() {
    return {
      'temperature': temperature,
      'maxOutputTokens': maxOutputTokens,
      'topP': topP,
      'topK': topK,
      'stopSequences': stopSequences
    };
  }
}
