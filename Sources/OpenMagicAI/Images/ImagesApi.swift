//
//  ImagesApi.swift
//  OpenMagicAI
//
//  Created by admin on 6/03/23.
//

import Foundation

public final class ImagesApi: ApiQueryable {

    private let apiKey: String
    private let urlSession: URLSession
    init(apiKey: String, urlSession: URLSession = .shared) {
        self.apiKey = apiKey
        self.urlSession = urlSession
    }

    /// Creates an image given a prompt.
    ///
    /// - Parameters:
    ///   - prompt: String
    ///   - onCompletion: ``ImagesCreated``
    public func createImage(
        prompt: String,
        n: Int = 1,
        size: ImageSize = ImageSize.defaultSize,
        responseFormat: ImagesResponseFormat? = .url,
        user: String? = nil,
        onCompletion: @escaping (Result<ImagesCreated, Error>) -> Void
    ) {
        if prompt.isEmpty {
            onCompletion(.failure(OpenMagicAI.OMError.missingRequiredInput))
            return
        }
        let parameters = CreateImage(
            prompt: prompt,
            n: n,
            size: size,
            responseFormat: responseFormat,
            user: user
        )
        dataTask(urlSession: urlSession, endPoint: .images(.createEdit), apiKey: apiKey, parameters: parameters, onCompletion: onCompletion)
    }

    public func createImageEdit(
        image: Data,
        mask: Data?,
        prompt: String,
        n: Int = 1,
        size: ImageSize = ImageSize.defaultSize,
        responseFormat: ImagesResponseFormat? = .url,
        onCompletion: @escaping (Result<ImagesCreated, Error>) -> Void
    ) {
        if prompt.isEmpty {
            onCompletion(.failure(OpenMagicAI.OMError.missingRequiredInput))
            return
        }
        let formDataRequest = MultipartFormDataRequest(url: EndPoint.images(.createEdit).url)
        formDataRequest.addDataField(
            fieldName:  "image",
            fileName: "image.png",
            data: image,
            mimeType: "image/png"
        )
        if let mask = mask {
            formDataRequest.addDataField(
                fieldName:  "mask",
                fileName: "mask.png",
                data: mask,
                mimeType: "image/png"
            )
        }
        formDataRequest.addTextField(named: "prompt", value: prompt)
        formDataRequest.addTextField(named: "n", value: String(n))
        formDataRequest.addTextField(named: "size", value: size.stringValue)
        multiformDataTask(urlSession: urlSession, apiKey: apiKey, formData: formDataRequest, onCompletion: onCompletion)
    }
}
