//
//  AuthTokenRepository.swift
//  M1L7 CleanSwift
//
//  Created by Alibek Kozhambekov on 19.09.2023.
//

import Foundation

protocol IAuthTokenRepository {
	func getSecret() -> AuthToken?
	func saveSecret(_ token: AuthToken) -> Bool
	func deleteSecret() -> Bool
	func updateSecret(_ token: AuthToken) -> Bool
}

final class AuthTokenRepository: IAuthTokenRepository {
	//MARK: - Public properties

	let service: String
	let account: String

	//MARK: - Initialization

	init(service: String, account: String) {
		self.service = service
		self.account = account
	}

	//MARK: - Public methods

	func getSecret() -> AuthToken? {
		if let secret = KeychainService().getSecret(service: service, account: account) {
			return AuthToken(rawValue: secret)
		} else {
			return nil
		}
	}

	func saveSecret(_ token: AuthToken) -> Bool {
		return KeychainService().saveSecret(service: service, account: account, secret: token.rawValue)
	}

	func deleteSecret() -> Bool {
		return KeychainService().deleteSecret(service: service, account: account)
	}

	func updateSecret(_ token: AuthToken) -> Bool {
		KeychainService().updateSecret(service: service, account: account, secret: token.rawValue)
	}
}
