//
//  NetworkMonitorService.swift
//  MoviesApp
//
//  Created by Work on 10/8/24.
//

import Foundation
import Network
import Combine

class NetworkMonitorService: ObservableObject {
    private let monitor: NWPathMonitor
    private let queue = DispatchQueue(label: "NetworkMonitorQueue")
    @Published private(set) var isConnected = false

    init() {
        monitor = NWPathMonitor()
        startMonitoring()
    }

    private func startMonitoring() {
        monitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                self?.isConnected = path.status == .satisfied
            }
        }
        monitor.start(queue: queue)
    }

    deinit {
        monitor.cancel()
    }
}
