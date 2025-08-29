//
//  TaskViewModel.swift
//  Market
//
//  Created by Kevin Wu on 5/20/25.
//

import SwiftUI
import Combine

// vm.run1()
// 调用同步方法时，如果里面的 Task 用到 vm 的成员，且把 Task 存到 vm，视图消失时不会取消 task，会等它执行完
//    Task { [weak self] in
//        guard let self = self else { return } // 不能要这句
//    }
//    .store(in: &bag)
// 其它网络框架，在回调里面 [weak self]，就放开了 self 的生命控制权，self 能被释放，因为回调还没执行，将来执行的时候才会 guard let 重新强引用 self
// 但是这里，Task 马上执行，看着像是 [weak self] 放开了 self，实际马上又抓住了

// vm.can2 = Task { await vm.run2() }.asCancellable()
// 调用异步方法，并把 cancellable 存到 vm 里，就算不用到 vm 的成员都会造成不能及时取消任务
//    Task { [weak vm] in
//        await vm?.run2()
//    }
//    .store(in: &vm.bag)
// 就算这样，在回退时也不能及时取消任务

// 感觉结论是：task 调的任务写成 async，其它按钮调的任务写成同步任务。或者不考虑取消的任务也能写成 async

// 任务 debounce
//    .task(id: query) {
//        do {
//            try await Task.sleep(for: .seconds(1))
//            print("request")
//        } catch {
//            // Task cancelled without network request.
//        }
//    }

@MainActor
@Observable
final class TaskViewModel {
    init() {
        print("task vm init")
    }
    deinit {
        print("task vm deinit")
    }

    var bag = Set<AnyCancellable>()

    var data = "--"

    func load() async {
        print("load begin")
        do {
            try await Task.sleep(for: .seconds(5))
            print("got data")
            data = "kevin"
        } catch {
            print("cancelled")
        }
        print("load end")
    }

//    var can1: AnyCancellable?
//    var job1: Task<Void, Never>? {
//        didSet { oldValue?.cancel() }
//    }
    func run1() {
        Task { [weak self] in
            // guard let self = self else { return }
            print("run1 begin")
            do {
                try await Task.sleep(for: .seconds(5))
                print("run1 done \(self?.data ?? "")")
                // print("run1 done \(data)")
            } catch {
                print("run1 cancelled")
            }
            print("run1 end")
        }
        .store(in: &bag)
    }

//    var can2: AnyCancellable?
//    var job2: Task<Void, Never>? {
//        didSet { oldValue?.cancel() }
//    }
    func run2() async {
        print("run2 begin")
        do {
            try await Task.sleep(for: .seconds(5))
            print("run2 done")
        } catch {
            print("run2 cancelled")
        }
        print("run2 end")
    }
}
