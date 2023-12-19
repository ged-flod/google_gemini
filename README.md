
# Google DeepMind Gemini

Google Gemini is a set of cutting-edge large language models (LLMs) designed to be the driving force behind Google's future AI initiatives.

<img  alt="Gemini " src="https://raw.githubusercontent.com/ged-flod/google_gemini/main/assets/gemini.jpeg"/>

This package provides a powerful bridge between your Flutter application and Google's revolutionary Gemini AI. It empowers you to seamlessly integrate Gemini's capabilities into your app, unlocking a world of possibilities for building innovative, intelligent, and engaging experiences that redefine user interaction.

# Example 

<table>
  <tr>
    <td>
      <img width="450" src="https://miro.medium.com/v2/resize:fit:640/format:webp/1*tcrU-YN9FAwesIYyZZUSVw.gif" />
    </td>
    <td>
      <img width="450" src="https://miro.medium.com/v2/resize:fit:640/format:webp/1*GHFRVTpXRLgHwtjiBRNR6Q.gif" />
    </td>
  </tr>
</table>


## Features

- [x] [Get Stated](#getting-started)
- [x] [Create Gemini Instance](#create-openai-instance)
- [ ] [Generate content](#generate-content)
  - [x] [Generate text from text-only input](#text-only-input)
  - [ ] [Generate text from text-and-image input](#text-and-image-input)
- [ ] [Build multi-turn conversations (chat)](#build-multi-turn-conversations)
- [ ] [Use streaming for faster interactions](#use-streaming-for-faster-interactions)

- [ ] [Gemini Response](#gemini-response)
- [ ] [Gemini Methods](#gemini-methods)



## Getting started

To get the API key you have to create a Gemini account on the [ai.google.dev](https://ai.google.dev/). Once you have to Gemini API key, you are ready to start building.

## Create Gemini Instance

```dart
final gemini = GoogleGemini(
  apiKey: "--- Your Gemini Api Key --- ",
);
```

## Generate content

With Gemini you use both text and image data for prompting, depending on what model variation you use. 

For example, you can generate text using text prompt with the gemini-pro model and use both text and image data to prompt the gemini-pro-vision model

### Text only input

This feature lets you perform natural language processing (NLP) tasks such as text completion and summarization.

```dart
gemini.generateFromText("Tell me a story")
.then((value) => print(value.text))
.catchError((e) => print(e));
```

<img height="350" src="https://miro.medium.com/v2/resize:fit:640/format:webp/1*tcrU-YN9FAwesIYyZZUSVw.gif" />

### Text and image input

You can send a text prompt with an image to the gemini-pro-vision model to perform a vision related task. For example, captioning an image or identifying what's in an image.

```dart
File image = File("assets/images.png")

gemini.generateFromTextAndImages(
  query: "What is this picture?",
  image: image
)
.then((value) => print(value.text))
.catchError((e) => print(e));
```

<img height="350" src="https://miro.medium.com/v2/resize:fit:640/format:webp/1*GHFRVTpXRLgHwtjiBRNR6Q.gif" />

## Configuration

Every prompt you send to the model includes parameter values that control how the model generates a response. The model can generate different results for different parameter values.

### Model parameters

The most common model parameters are:

1. **Max output tokens**: Specifies the maximum number of tokens that can be generated in the response. A token is approximately four characters. 100 tokens correspond to roughly 60-80 words.


2. **Temperature**: The temperature controls the degree of randomness in token selection. Lower temperatures are good for prompts that require a more deterministic or less open-ended response, while higher temperatures can lead to more diverse or creative results.

3. **topK**: The topK parameter changes how the model selects tokens for output. 

4. **topP**: The topP parameter changes how the model selects tokens for output.

5. **stop_sequences**: Set a stop sequence to tell the model to stop generating content. A stop sequence can be any sequence of characters. Try to avoid using a sequence of characters that may appear in the generated content.

**Example**
```dart
// Generation Configuration
final config = GenerationConfig(
    temperature: 0.5,
    maxOutputTokens: 100,
    topP: 1.0,
    topK: 40,
    stopSequences: []
);

// Gemini Instance
final gemini = GoogleGemini(
    apiKey: "--- Your Gemini Api Key ---",
    config: config // pass the config here
);
```


### Safety settings

Safety settings are part of the request you send to the text service. It can be adjusted for each request you make to the API.

#### Categories

These categories cover various kinds of harms that developers may wish to adjust.


```dart
HARM_CATEGORY_UNSPECIFIED
HARM_CATEGORY_DEROGATORY
HARM_CATEGORY_TOXICITY
HARM_CATEGORY_VIOLENCE
HARM_CATEGORY_SEXUAL
HARM_CATEGORY_MEDICAL
HARM_CATEGORY_DANGEROUS
HARM_CATEGORY_HARASSMENT
HARM_CATEGORY_HATE_SPEECH
HARM_CATEGORY_SEXUALLY_EXPLICIT
HARM_CATEGORY_DANGEROUS_CONTENT	
```

#### Threshold

Block at and beyond a specified harm probability.


```dart
HARM_BLOCK_THRESHOLD_UNSPECIFIED	
BLOCK_LOW_AND_ABOVE	
BLOCK_MEDIUM_AND_ABOVE
BLOCK_ONLY_HIGH	
BLOCK_NONE
```

**Example**

```dart
// Safety Settings
final safety1 = SafetySettings(
  category: SafetyCategory.HARM_CATEGORY_DANGEROUS_CONTENT,
  threshold: SafetyThreshold.BLOCK_ONLY_HIGH
);


//  Gemini Instance
final gemini = GoogleGemini(
  apiKey:"--- Your Gemini Api Key ---",
  safetySettings: [
    safety1,
    // safety2
  ]  
);
```


## Build multi-turn conversations

```dart
// In progress
```

## Use streaming for faster interactions

```dart
// In progress
```

## Gemini Response

```dart
// In progress
```

## Gemini Methods

```dart
// In progress
```




