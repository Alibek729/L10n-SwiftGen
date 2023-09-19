//
//  AuthToken.swift
//  M1L7 CleanSwift
//
//  Created by Alibek Kozhambekov on 19.09.2023.
//

import Foundation

/// Авторизационный токен.
public struct AuthToken: MaskStringConvertible {
	/// Значение авторизационного токена
	let rawValue: String
}
