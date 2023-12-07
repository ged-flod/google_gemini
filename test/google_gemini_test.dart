import 'package:flutter_test/flutter_test.dart';

import 'package:google_gemini/google_gemini.dart';

void main() {
  test('create google gemini instance', () {
    final gemini = GoogleGemini(apiKey:"API_KEY");
    expect(gemini.apiKey, "API_KEY");
  });
}
