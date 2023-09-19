//
//  HTTPNetworkServiceError.swift
//  M1L7 CleanSwift
//
//  Created by Alibek Kozhambekov on 19.09.2023.
//

import Foundation

/// Ошибки сетевого слоя.
public enum HTTPNetworkServiceError: Error {
	/// Сетевая ошибка.
	case networkError(Error)
	/// Ответ сервера имеет неожиданный формат.
	case invalidResponse(URLResponse?)
	/// Ответ статуса кода не входит в диапазон успешных `(200..<300)`.
	case invalidStatusCode(Int, Data?)
	/// Данные отсувствуют.
	case noData
	/// Не удалось декодировать ответ.
	case failedToDecodeResponce(Error)
}
