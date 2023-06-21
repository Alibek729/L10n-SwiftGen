//
//  UIViewController + Preview.swift
//  M1L7 CleanSwift
//
//  Created by Alibek Kozhambekov on 20.06.2023.
//

import UIKit
import SwiftUI

extension UIViewController {

	struct Preview: UIViewControllerRepresentable {

		let viewController: UIViewController

		func makeUIViewController(context: Context) -> some UIViewController {
			viewController
		}

		func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
	}

	func preview() -> some View {
		Preview(viewController: self).edgesIgnoringSafeArea(.all)
	}
}
