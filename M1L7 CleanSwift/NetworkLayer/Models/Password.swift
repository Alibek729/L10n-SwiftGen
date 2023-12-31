//
//  Password.swift
//  M1L7 CleanSwift
//
//  Created by Alibek Kozhambekov on 19.09.2023.
//

import Foundation

/// Пароль пользователя.
public struct Password: MaskStringConvertible {
	/// Значение пароля.
	let rawValue: String
}
