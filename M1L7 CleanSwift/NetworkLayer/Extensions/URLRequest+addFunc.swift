//
//  URLRequest+addFunc.swift
//  M1L7 CleanSwift
//
//  Created by Alibek Kozhambekov on 19.09.2023.
//

import Foundation

extension URLRequest {
	public mutating func add(header: HeaderField) {
		setValue(header.value, forHTTPHeaderField: header.key)
	}

	/// Метод добавляющий параметры
	/// - Parameters:
	///  - parameters: параметры типа RequestParameters
	public mutating func add(parameters: Parameters) {
		switch parameters {
		case .none:
			break
		case .url(let dictionary):
			guard let url = url, var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else { break }
			components = components.setParameters(dictionary)
			guard let newURL = components.url else { break }
			self.url = newURL
		case .json(let dictionary):
			httpBody = try? JSONSerialization.data(withJSONObject: dictionary)
		case .formData(let dictionary):
			httpBody = URLComponents().setParameters(dictionary).query?.data(using: .utf8)
		case .data(let data, _):
			httpBody = data
		}
	}
}
