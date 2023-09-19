//
//  NetworkRequest.swift
//  M1L7 CleanSwift
//
//  Created by Alibek Kozhambekov on 19.09.2023.
//

import Foundation

/// Протокол для создания пути запроста.
protocol NetworkRequest {
	/// Путь запроса.
	var path: String { get }
	/// HTTP метод, указывающий тип запроса.
	var method: HTTPMethod { get }
	/// HTTP заголовок.
	var header: HTTPHeader? { get }
	/// Параметры запроса.
	var parameters: Parameters { get }
}
