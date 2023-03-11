[![Swift](https://img.shields.io/badge/Swift-5.7_|_5.6_|_5.5-red)](https://img.shields.io/badge/Swift-5.7_|_5.6_|_5.5-red)
[![Platforms](https://img.shields.io/badge/Platforms-macOS_iOS_tvOS_watchOS_Linux_Windows-green?style=flat-square)](https://img.shields.io/badge/Platforms-macOS_iOS_tvOS_watchOS_Linux_Windows-Green?style=flat-square)
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-Compatible-green)](https://img.shields.io/badge/Swift_Package_Manager-Compatible-green)
[![Async Await](https://img.shields.io/badge/Async_Await-Support-blue)](https://img.shields.io/badge/Async_Await-Support-blue)
[![Combine](https://img.shields.io/badge/Combine-Support-blue)](https://img.shields.io/badge/Combine-Support-blue)
<div id="badges">
  <a href="https://www.linkedin.com/in/francocadillo/">
    <img src="https://img.shields.io/badge/Linkedin-blue?style=flat&logo=linkedin&labelColor=blue" alt="LinkedIn Badge"/>
  </a>
</div>


# OpenMagicAI: A Non-official OpenAI iOS library

OpenMagicAI is a friendly Swift library for accesing to OpenAI API. OpenAI api official [docs](https://platform.openai.com/docs/introduction) reference.

## Example usage

There's a sample app [here](https://github.com/asyncios/OpenMagicAI/tree/master/SampleApp) using the methods of OpenMagicAI library.

<table>
<tr>
    <th>Chat</th>
    <th>Create Image</th>
  </tr>
  <tr>
    <th>
      <img src="https://user-images.githubusercontent.com/11830293/224502596-b7a2d90c-bcd2-4f4d-b2c7-9d2ff0b08971.gif" width="220"/>
    </th>
    <th>
      <img src="https://user-images.githubusercontent.com/11830293/224502600-d18b51e3-892e-403c-a36b-314e8ff0b6cf.gif" width="220"/>
    </th>
  </tr>
</table>

## Installation

#### Swift Package Manager (SPM)

[SPM](https://swift.org/package-manager/) is a tool for managing the distribution of Swift code.

```swift
dependencies: [ 
  .package(url: "https://github.com/asyncios/OpenMagicAI.git", from: "1.0.0") 
 ]
```

## Usage

Set your API Key, if you don't have one [create it here](https://platform.openai.com/account/api-keys)

`let openMagicAI = OpenAISwift(authToken: "APIKEY")`

#### Closure usage

```swift
openMagicAI.images.createImage(prompt: "dog in a park") { result in
   debugPrint(result)
}
```

#### Async Await usage

```swift
Task {
  let result = try await openMagicAI.images.createImage("dog in a park")
  debugPrint(result)
}
```

#### Combine usage

```swift
openMagicAI.images.createImageFuture(prompt: "dog in a park").sink { _ in
} receiveValue: { value in
  debugPrint(value)
}.store(in: &cancellables)
```

## Licenses

All source code is licensed under the [MIT License](https://github.com/asyncios/OpenMagicAI/blob/master/LICENSE).
