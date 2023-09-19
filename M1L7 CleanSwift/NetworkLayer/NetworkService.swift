//
//  NetworkService.swift
//  M1L7 CleanSwift
//
//  Created by Alibek Kozhambekov on 18.09.2023.
//

import Foundation

final class NetworkService {
	private let session: URLSession
	private let requestBuilder: IURLRequestBuilder

	internal init(session: URLSession, requestBuilder: IURLRequestBuilder) {
		self.session = session
		self.requestBuilder = requestBuilder
	}

	func perform(urlRequest: URLRequest, completion: @escaping (Result<Data?, HTTPNetworkServiceError>) -> Void) {
		let task = session.dataTask(with: urlRequest) { data, urlResponse, error in
			let networkResponse = NetworkResponse(data: data, urlResponse: urlResponse, error: error)
			completion(networkResponse.result)
		}

		task.resume()
	}

	func perform(_ request: NetworkRequest, token: AuthToken?, completion: @escaping (Result<Data?, HTTPNetworkServiceError>) -> Void) {
		let urlRequest = requestBuilder.build(forRequest: request, token: token)
		perform(urlRequest: urlRequest, completion: completion)
	}

	public func perform<T: Codable>(_ request: NetworkRequest, token: AuthToken?, compelition: @escaping (Result<T, HTTPNetworkServiceError>) -> Void) {
		let urlRequest = requestBuilder.build(forRequest: request, token: token)

		perform(urlRequest: urlRequest) { result in
			switch result {
			case .success(let data):
				guard let data = data else {
					compelition(.failure(.noData))
					return
				}
				do {
					let object = try JSONDecoder().decode(T.self, from: data)
					compelition(.success(object))
				} catch {
					compelition(.failure(.failedToDecodeResponce(error)))
				}
			case .failure(let error):
				compelition(.failure(error))
			}
		}
	}
}
