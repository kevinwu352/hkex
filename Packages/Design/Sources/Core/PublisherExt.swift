//
//  PublisherExt.swift
//  Design
//
//  Created by Kevin Wu on 4/6/25.
//

import Foundation
import Combine

public extension Publisher where Failure == Never {
    func toEvent(_ handler: @escaping (Output) -> Bool) -> AnyPublisher<Void, Never> {
        self.filter(handler)
            .map { _ in () }
            .eraseToAnyPublisher()
    }
}

public extension Publisher {
    func fallVal(_ handler: @escaping (Output) -> Void) -> AnyPublisher<Output, Failure> {
        self.map {
            handler($0)
            return $0
        }
        .eraseToAnyPublisher()
    }
    func fallErr(_ handler: @escaping (Failure) -> Void) -> AnyPublisher<Output, Failure> {
        self.mapError {
            handler($0)
            return $0
        }
        .eraseToAnyPublisher()
    }
}

public extension Subscribers.Completion {
    var isFinished: Bool {
        if case .finished = self { return true } else { return false }
    }
    var isFailure: Bool {
        if case .failure = self { return true } else { return false }
    }
}

public extension Task {
    func asCancellable() -> AnyCancellable {
        // .init { self.cancel() }
        AnyCancellable(cancel)
    }
    func store(in set: inout Set<AnyCancellable>) {
        // set.insert(AnyCancellable(cancel))
        AnyCancellable(cancel).store(in: &set)
    }
}
