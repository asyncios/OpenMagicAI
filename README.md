[![Swift](https://img.shields.io/badge/Swift-5.7_|_5.6_|_5.5-red)](https://img.shields.io/badge/Swift-5.7_|_5.6_|_5.5-red)
[![Platforms](https://img.shields.io/badge/Platforms-macOS_iOS_tvOS_watchOS_Linux_Windows-Green?style=flat-square)](https://img.shields.io/badge/Platforms-macOS_iOS_tvOS_watchOS_Linux_Windows-Green?style=flat-square)
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-Compatible-green)](https://img.shields.io/badge/Swift_Package_Manager-Compatible-green)
[![Async Await](https://img.shields.io/badge/Async_Await-Support-blue)](https://img.shields.io/badge/Async_Await-Support-blue)
[![Combine](https://img.shields.io/badge/Combine-Support-blue)](https://img.shields.io/badge/Combine-Support-blue)

# OpenMagicAI

OpenMagicAI is a friendly Swift library for accesing to OpenAI API. OpenAI api [docs](https://platform.openai.com/docs/introduction) reference

## Example usage

There's a sample app [here](https://github.com/asyncios/OpenMagicAI/tree/master/SampleApp) using the methods of OpenMagicAI library.

![Simulator Screen Recording - iPhone 14 Pro - 2023-03-11 at 00 06 08](https://user-images.githubusercontent.com/11830293/224493181-1373c862-a3c6-4fec-995a-d6949fcfc3ce.gif)


## Usage

Set your API Key, if you don't have one [create it here](https://platform.openai.com/account/api-keys)

`let openMagicAI = OpenAISwift(authToken: "APIKEY")`

### Closure usage

```swift
openMagicAI.images.createImage(prompt: "dog in the park") { result in
   debugPrint(result)
}
```

### Async Await usage

```swift
Task {
  let result = try await openMagicAI.images.createImage("dog in the park")
  debugPrint(result)
}
```

### Combine usage

```swift
openMagicAI.images.createImageFuture(prompt: "").sink { _ in
} receiveValue: { value in
  debugPrint(value)
}.store(in: &cancellables)
```

## Licenses

All source code is licensed under the [MIT License](https://github.com/asyncios/OpenMagicAI/blob/master/LICENSE).
