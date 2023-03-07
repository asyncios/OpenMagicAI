import Foundation

public final class OpenMagicAI {

    public private(set) lazy var models: ModelsApi = {
        .init(apiKey: apiKey)
    }()

    public private(set) lazy var completions: CompletionsApi = {
        .init(apiKey: apiKey)
    }()

    public private(set) lazy var images: ImagesApi = {
        .init(apiKey: apiKey)
    }()

    public private(set) lazy var edits: EditsApi = {
        .init(apiKey: apiKey)
    }()

    private let apiKey: String
    public init(apiKey: String) {
        self.apiKey = apiKey
    }

}
