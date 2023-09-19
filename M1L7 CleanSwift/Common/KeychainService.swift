//
//  KeychainService.swift
//  M1L7 CleanSwift
//
//  Created by Alibek Kozhambekov on 18.09.2023.
//

import Foundation
import Security

struct KeychainService {
	
	func saveSecret(service: String, account: String, secret: String) -> Bool {
		let keychainItem = [
			kSecAttrService: service,
			kSecAttrAccount: account,
			kSecValueData: secret.data(using: .utf8)!,
			kSecClass: kSecClassGenericPassword
		] as CFDictionary

		let status = SecItemAdd(keychainItem, nil)
		return status == errSecSuccess
	}

	func getSecret(service: String, account: String) -> String? {
		let query = [
			kSecAttrService: service,
			kSecAttrAccount: account,
			kSecReturnData: true,
			kSecMatchLimit: kSecMatchLimitOne,
			kSecClass: kSecClassGenericPassword
		] as CFDictionary

		var dataTypeRef: AnyObject?
		let status = SecItemCopyMatching(query, &dataTypeRef)

		if status == errSecSuccess, let data = dataTypeRef as? Data {
			return String(data: data, encoding: .utf8)
		} else {
			return nil
		}
	}

	func deleteSecret(service: String, account: String) -> Bool {
		let query = [
			kSecAttrService: service,
			kSecAttrAccount: account,
			kSecClass: kSecClassGenericPassword
		] as CFDictionary

		let status = SecItemDelete(query)
		return status == errSecSuccess
	}

	func updateSecret(service: String, account: String, secret: String) -> Bool {
		let query = [
			kSecAttrService: service,
			kSecAttrAccount: account,
			kSecClass: kSecClassGenericPassword
		] as CFDictionary

		let field = [
			kSecValueData: secret.data(using: .utf8)!
		] as CFDictionary

		let status = SecItemUpdate(query, field)
		return status == errSecSuccess
	}
}
