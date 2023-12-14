
# Google DeepMind Gemini

Google Gemini is a set of cutting-edge large language models (LLMs) designed to be the driving force behind Google's future AI initiatives.

<img  alt="Gemini " src="https://raw.githubusercontent.com/ged-flod/google_gemini/main/assets/gemini.jpeg"/>

This package provides a powerful bridge between your Flutter application and Google's revolutionary Gemini AI. It empowers you to seamlessly integrate Gemini's capabilities into your app, unlocking a world of possibilities for building innovative, intelligent, and engaging experiences that redefine user interaction.



## Features

- [x] [Get Stated](#getting-started)
- [x] [Create Gemini Instance](#create-openai-instance)
- [ ] [Generate content](#generate-content)
  - [x] [Text only input](#text-only-input)
  - [ ] [Text and image input](#text-and-image-input)
- [ ] [Gemini Response](#gemini-response)
- [ ] [Gemini Methods](#gemini-methods)



## Getting started

To get the API key you have to create a Gemini account on the [ai.google.dev](https://ai.google.dev/). Once you have to Gemini API key, you are ready to start building.

## Create Gemini Instance

```dart
final gemini = GoogleGemini(
    apiKey: "--- Your Gemini Api Key --- ", // Replace this
    model: "gemini-pro"
);
```

## Generate content

With Gemini you use both text and image data for prompting, depending on what model variation you use. 

For example, you can generate text using text prompt with the gemini-pro model and use both text and image data to prompt the gemini-pro-vision model

### Text only input

This feature lets you perform natural language processing (NLP) tasks such as text completion and summarization.

```dart
gemini.generateText("Tell me a story").then((response){
    print(response)
})
```

### Text and image input

You can send a text prompt with an image to the gemini-pro-vision model to perform a vision related task. For example, captioning an image or identifying what's in an image.

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




