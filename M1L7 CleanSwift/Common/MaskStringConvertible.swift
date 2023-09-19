//
//  MaskStringConvertible.swift
//  M1L7 CleanSwift
//
//  Created by Alibek Kozhambekov on 19.09.2023.
//

import Foundation

public protocol MaskStringConvertible: CustomStringConvertible, CustomDebugStringConvertible { }

public extension MaskStringConvertible {
	var description: String {
		"***********"
	}

	var debugDescription: String {
		"***********"
	}
}
