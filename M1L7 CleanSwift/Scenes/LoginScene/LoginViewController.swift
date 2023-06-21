//
//  LoginViewController.swift
//  M1L7 CleanSwift
//
//  Created by Alibek Kozhambekov on 14.06.2023.
//

import UIKit
import SwiftUI
import PinLayout

protocol ILoginViewController: AnyObject {
	func render(viewModel: LoginModels.ViewModel)
}

class LoginViewController: UIViewController {

	private lazy var textFieldLogin: UITextField = makeTextFieldLogin()
	private lazy var textFieldPass: UITextField = makeTextFieldPass()
	private lazy var buttonLogin: UIButton = makeButtonLogin()

	var interactor: ILoginInteractor?
	var router: ILoginRouter?

	var loginText: String {
		get {
			textFieldLogin.text ?? ""
		}

		set {
			textFieldLogin.text = newValue
		}
	}

	var passText: String  {
		get {
			textFieldPass.text ?? ""
		}

		set {
			textFieldPass.text = newValue
		}
	}

	@objc
	func login() {
		let request = LoginModels.Request(login: loginText, password: passText)
		interactor?.login(request: request)
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		setup()
	}

	private func setup() {
		view.backgroundColor = .white
		title = "Authorization"
		navigationController?.navigationBar.prefersLargeTitles = true
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		layoutPin()
	}

}

extension LoginViewController: ILoginViewController {
	func render(viewModel: LoginModels.ViewModel) {
		switch viewModel {
		case .success:
			router?.routeToTodoList()
		case .failure(let message):
			router?.showError(message: message)
		}
	}
}

private extension LoginViewController {

	func makeTextFieldLogin() -> UITextField {
		let textField = UITextField()

		textField.backgroundColor = .white
		textField.textColor = .black
		textField.borderStyle = .roundedRect
		textField.translatesAutoresizingMaskIntoConstraints = false

		return textField
	}

	func makeTextFieldPass() -> UITextField {
		let textField = UITextField()

		textField.backgroundColor = .white
		textField.textColor = .black
		textField.borderStyle = .roundedRect
		textField.translatesAutoresizingMaskIntoConstraints = false

		return textField
	}

	func makeButtonLogin() -> UIButton {
		let button = UIButton()

		button.configuration = .filled()
		button.configuration?.cornerStyle = .medium
		button.configuration?.baseBackgroundColor = .red
		button.configuration?.title = "Authorization.login".localized
		button.addTarget(self, action: #selector(login), for: .touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false

		print(L10n.Filter.description("Some filter"))
		return button
	}

	func layoutPin() {

		view.backgroundColor = .cyan
		view.addSubview(textFieldLogin)
		view.addSubview(textFieldPass)
		view.addSubview(buttonLogin)

		textFieldLogin
			.pin
			.vertically(Sizes.Padding.top)
			.hCenter()
			.width(Sizes.L.maxWidth)
			.height(Sizes.L.height)

		textFieldPass
			.pin
			.below(of: textFieldLogin, aligned: .center)
			.margin(Sizes.Padding.normal)
			.width(Sizes.L.maxWidth)
			.height(Sizes.L.height)

		buttonLogin
			.pin
			.below(of: textFieldPass, aligned: .center)
			.margin(Sizes.Padding.double)
			.width(Sizes.L.width)
			.height(Sizes.L.height)
	}
}

struct ViewControllerProvider: PreviewProvider {
	static var previews: some View {
		Group {
			LoginViewController().preview()
		}
	}
}
