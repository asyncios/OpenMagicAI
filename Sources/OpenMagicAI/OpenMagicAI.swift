import Foundation

public final class OpenMagicAI {

    /// List and describe the various models available in the API
    public private(set) lazy var models: ModelsApi = {
        .init(apiKey: apiKey)
    }()

    /// Given a prompt, the model will return one or more predicted completions, and can also return the probabilities of alternative tokens at each position.
    public private(set) lazy var completions: CompletionsApi = {
        .init(apiKey: apiKey)
    }()

    /// Given a chat conversation, the model will return a chat completion response.
    public private(set) lazy var chat: ChatApi = {
        .init(apiKey: apiKey)
    }()

    /// Given a prompt and an instruction, the model will return an edited version of the prompt.
    public private(set) lazy var edits: EditsApi = {
        .init(apiKey: apiKey)
    }()

    /// Given a prompt and/or an input image, the model will generate a new image.
    public private(set) lazy var images: ImagesApi = {
        .init(apiKey: apiKey)
    }()

    /// Get a vector representation of a given input that can be easily consumed by machine learning models and algorithms.
    public private(set) lazy var embeddings: EmbeddingsApi = {
        .init(apiKey: apiKey)
    }()

    private let apiKey: String
    public init(apiKey: String) {
        self.apiKey = apiKey
    }

}
