//
//  DocumentService.swift
//  M1L7 CleanSwift
//
//  Created by Alibek Kozhambekov on 19.09.2023.
//

import Foundation

protocol IDocumentService {
	func upload()
	func download(id: String)
	func delete(id: String)
	func fileList()
}

struct DocumentService: IDocumentService {
	func upload() {
		<#code#>
	}

	func download(id: String) {
		<#code#>
	}

	func delete(id: String) {
		<#code#>
	}

	func fileList() {
		<#code#>
	}
}
