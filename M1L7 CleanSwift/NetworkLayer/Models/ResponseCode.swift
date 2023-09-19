//
//  ResponseCode.swift
//  M1L7 CleanSwift
//
//  Created by Alibek Kozhambekov on 19.09.2023.
//

import Foundation

/// Статусы кодов ответа от сервера.
public enum ResponseCode {
	static let informationalCodes = 100..<200
	static let successCodes = 200..<300
	static let redirectCodes = 300..<400
	static let clientErrorCodes = 400..<500
	static let serverErrorCodes = 500..<600
}
