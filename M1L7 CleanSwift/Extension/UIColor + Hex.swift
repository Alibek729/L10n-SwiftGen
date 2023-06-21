//
//  UIColor + Hex.swift
//  M1L7 CleanSwift
//
//  Created by Alibek Kozhambekov on 21.06.2023.
//

import UIKit

extension UIColor {

	convenience init(red: Int, green: Int, blue: Int, alpha: Int = 255) throws {
		self.init(
			red: CGFloat(red) / 255.0,
			green: CGFloat(green) / 255.0,
			blue: CGFloat(blue) / 255.0,
			alpha: CGFloat(alpha) / 255.0)
	}
}
