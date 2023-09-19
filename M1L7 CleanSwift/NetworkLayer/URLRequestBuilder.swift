//
//  URLRequestBuilder.swift
//  M1L7 CleanSwift
//
//  Created by Alibek Kozhambekov on 18.09.2023.
//

import Foundation

/// Протокол, собирающий запрос из NetworkRequest.
protocol IURLRequestBuilder {
	/// Функция, собирающий запрос из NetworkRequest.
	/// - Parameters:
	///   - request: Сетевой запрос.
	///   - token: Авторизованный токен.
	/// - Returns: Сформированный URLRequest.
	func build(forRequest request: NetworkRequest, token: AuthToken?) -> URLRequest
}

/// Сервис, собирающий запрос из NetworkRequest.
struct URLRequestBuilder: IURLRequestBuilder {
	/// Базовый URL сервиса для которого будут создаваться запросы.
	var baseURL: URL

	func build(forRequest request: NetworkRequest, token: AuthToken?) -> URLRequest {
		let url = baseURL.appendingPathComponent(request.path)

		var urlRequest = URLRequest(url: url)
		urlRequest.httpMethod = request.method.rawValue
		urlRequest.allHTTPHeaderFields = request.header

		urlRequest.add(parameters: request.parameters)

		if let contentType = request.parameters.contentType {
			urlRequest.add(header: .contentType(contentType))
		}

		if let token = token {
			urlRequest.add(header: .authorization(token))
		}

		return urlRequest
	}
}
