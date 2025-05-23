//
//  HomeViewModel.swift
//  Home
//
//  Created by Kevin Wu on 5/3/25.
//

import SwiftUI
import Design

@MainActor
@Observable
final class HomeViewModel {
    // init() {
    //     print("home vm init \(dev_obj_addr(self))")
    // }
    // deinit {
    //     print("home vm deinit \(dev_obj_addr(self))")
    // }

    var task: Task<Void, Never>?

    func load() {
        print("load begin")
        task = Task {
            do {
                try await Task.sleep(for: .seconds(5))
                print("got data")
            } catch {
                print("cancelled")
            }
        }
        print("load end")
    }

    func cancel() {
        print("cancel")
        task?.cancel()
    }
}
