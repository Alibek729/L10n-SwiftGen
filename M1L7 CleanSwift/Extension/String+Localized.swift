//
//  String+Locolized.swift
//  M1L7 CleanSwift
//
//  Created by Alibek Kozhambekov on 21.06.2023.
//

import Foundation

extension String {
	var localized: String {
		return NSLocalizedString(self, comment: "")
	}
}
