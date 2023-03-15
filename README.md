[![Swift](https://img.shields.io/badge/Swift-5.7_|_5.6_|_5.5-red)](https://img.shields.io/badge/Swift-5.7_|_5.6_|_5.5-red)
[![Platforms](https://img.shields.io/badge/Platforms-macOS_iOS_tvOS_watchOS_Linux_Windows-green?style=flat-square)](https://img.shields.io/badge/Platforms-macOS_iOS_tvOS_watchOS_Linux_Windows-Green?style=flat-square)
[![CHAT GPT-4](https://img.shields.io/badge/CHAT_GPT_4-Support-blue)](https://img.shields.io/badge/CHAT_GPT_4-Support-blue)
[![CHAT GPT-3.5](https://img.shields.io/badge/CHAT_GPT_3.5-Support-blue)](https://img.shields.io/badge/CHAT_GPT_3.5-Support-blue)
[![CHAT GPT-3](https://img.shields.io/badge/CHAT_GPT_3-Support-blue)](https://img.shields.io/badge/CHAT_GPT_3-Support-blue)
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-Compatible-green)](https://img.shields.io/badge/Swift_Package_Manager-Compatible-green)
[![Async Await](https://img.shields.io/badge/Async_Await-Support-blue)](https://img.shields.io/badge/Async_Await-Support-blue)
[![Combine](https://img.shields.io/badge/Combine-Support-blue)](https://img.shields.io/badge/Combine-Support-blue)
<div id="badges">
  <a href="https://www.linkedin.com/in/francocadillo/">
    <img src="https://img.shields.io/badge/Linkedin-blue?style=flat&logo=linkedin&labelColor=blue" alt="LinkedIn Badge"/>
  </a>
</div>


# OpenMagicAI: A Non-official OpenAI iOS library

This is a **non-official** iOS library of OpenAI.

OpenMagicAI is a friendly Swift library for accesing to OpenAI API. OpenAI api official [docs](https://platform.openai.com/docs/introduction) reference.
> Chat GPT-4 support :heart:

## Example usage

There's a sample app [here](https://github.com/asyncios/OpenMagicAI/tree/master/SampleApp) using the methods of OpenMagicAI library.

<table>
<tr>
    <th>Chat</th>
    <th>Create Image</th>
    <th>List Models</th>
  </tr>
  <tr>
    <th>
      <img src="https://user-images.githubusercontent.com/11830293/225047055-a2a1fd22-9920-4e2e-a5c2-20181db4bc18.gif" width="220"/>
    </th>
    <th>
      <img src="https://user-images.githubusercontent.com/11830293/225047312-4e5ac16b-51af-4499-9417-790a5ec01cd7.gif" width="220"/>
    </th>
    <th>
      <img src="https://user-images.githubusercontent.com/11830293/225047637-5026a063-e131-4363-80e7-70ee3d09423c.gif" width="220"/>
    </th>
  </tr>
</table>

## Installation

#### Swift Package Manager (SPM)

[SPM](https://swift.org/package-manager/) is a tool for managing the distribution of Swift code.

```swift
dependencies: [ 
  .package(url: "https://github.com/asyncios/OpenMagicAI.git", .upToNextMajor(from: "1.2.0"))
 ]
```

## Usage

Set your API Key, if you don't have one [create it here](https://platform.openai.com/account/api-keys)

`let openMagicAI = OpenMagicAI(apiKey: "APIKEY")`

### Chat

```swift
openMagicAI.chat.createChatCompletion(
    messages: [.init(role: .user, content: "Give me some movie options for tonight")]
) { result in
       debugPrint(result)
}

// GPT-4 model
openMagicAI.chat.createChatCompletion(
    model: .gpt4,
    messages: [.init(role: .user, content: "Give me some movie options for tonight")]
) { result in
       debugPrint(result)
}
```

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
openMagicAI.images.createImage(prompt: "dog in a park").sink { _ in
} receiveValue: { value in
  debugPrint(value)
}.store(in: &cancellables)
```

## Licenses

All source code is licensed under the [MIT License](https://github.com/asyncios/OpenMagicAI/blob/master/LICENSE).
