//
//  DocumentService.swift
//  M1L7 CleanSwift
//
//  Created by Alibek Kozhambekov on 19.09.2023.
//

import Foundation

struct File {
	let name: String
	let id: ID

	struct ID {
		let rawValue: String
	}
}

enum DocumentServiceError: Error { }

protocol IDocumentService {
	func upload(completion: (Result<File, DocumentServiceError>) -> Void)
	func download(id: File.ID, body: Data, completion: (Result<Void, DocumentServiceError>) -> Void)
	func delete(id: File.ID, completion: (Result<Void, DocumentServiceError>) -> Void)
	func fileList(completion: (Result<File, DocumentServiceError>) -> Void)
}

struct DocumentService: IDocumentService {
	func upload(completion: (Result<File, DocumentServiceError>) -> Void) {

	}

	func download(id: File.ID, body: Data, completion: (Result<Void, DocumentServiceError>) -> Void) {

	}

	func delete(id: File.ID, completion: (Result<Void, DocumentServiceError>) -> Void) {

	}

	func fileList(completion: (Result<File, DocumentServiceError>) -> Void) {
		
	}

}
