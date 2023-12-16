
# Google DeepMind Gemini

Google Gemini is a set of cutting-edge large language models (LLMs) designed to be the driving force behind Google's future AI initiatives.

<img  alt="Gemini " src="https://raw.githubusercontent.com/ged-flod/google_gemini/main/assets/gemini.jpeg"/>

This package provides a powerful bridge between your Flutter application and Google's revolutionary Gemini AI. It empowers you to seamlessly integrate Gemini's capabilities into your app, unlocking a world of possibilities for building innovative, intelligent, and engaging experiences that redefine user interaction.



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




