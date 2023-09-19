//
//  NetworkMonitor.swift
//  M1L7 CleanSwift
//
//  Created by Alibek Kozhambekov on 18.09.2023.
//

import Foundation
import Network

/// Мониторинг сетевого подключения.
protocol INetworkMonitor {
	/// Свойство, показывающий наличие сетевого подключения.
	var isConnected:Bool { get }
	/// Тип сетевого подключения.
	var connectionType: ConnectionType { get }

	/// Запуск мониторинга сети.
	func start()
	/// Остановка мониторинга сети.
	func stop()
}

/// Тип сетевого подключения.
enum ConnectionType {
	/// Подключение по беспроводному интерфейсу.
	case wifi
	/// Подключение через сотовую сеть.
	case cellular
	/// Подключение по провожному интерфейсу.
	case ethernet
	/// Неизвестный источник подключения или отсутствие подключения.
	case unknown

	init(_ path: NWPath) {
		if path.usesInterfaceType(.wifi) {
			self = .wifi
		} else if path.usesInterfaceType(.cellular) {
			self = .cellular
		} else if path.usesInterfaceType(.wiredEthernet) {
			self = .ethernet
		} else {
			self = .unknown
		}
	}
}


/// Мониторинг сетевого подключения. Выполнен в виде Singleton, рекомендуется передавать только как зависимость.
class NetworkMonitor: INetworkMonitor {
	//MARK: - Public properties

	/// Инстанс мониторига сети.
	static let shared = NetworkMonitor()

	/// Свойство, показывающий наличие сетевого подключения.
	public private(set) var isConnected: Bool
	/// Тип сетевого подключения.
	public private(set) var connectionType: ConnectionType

	//MARK: - Dependencies

	private let queue = DispatchQueue.global()
	private let monitor: NWPathMonitor

	//MARK: - Initialization

	private init() {
		self.isConnected = false
		self.connectionType = .unknown
		self.monitor = NWPathMonitor()
	}

	//MARK: - Public methods

	/// Запуск мониторинга сети.
	func start() {
		monitor.start(queue: queue)
		monitor.pathUpdateHandler = { [weak self] path in
			self?.isConnected = path.status != .unsatisfied
			self?.connectionType = ConnectionType(path)
		}
	}

	/// Остановка мониторинга сети.
	func stop() {
		monitor.cancel()
	}
}
