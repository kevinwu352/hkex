//
//  TaskView.swift
//  Market
//
//  Created by Kevin Wu on 5/20/25.
//

import SwiftUI
import Design

struct TaskView: View {
    @State var vm = TaskViewModel()

    var body: some View {
        ZStack {
            Color.kViewBg.ignoresSafeArea()
            VStack {

                Text(vm.data)

                NavigationLink(value: 1) {
                    Image(systemName: "play")
                        .padding()
                }

                Button {
                     vm.run1()
                    // vm.can2 = Task { await vm.run2() }.asCancellable()
//                    Task { [weak vm] in
//                        await vm?.run2()
//                    }
//                    .store(in: &vm.bag)
                } label: { Image(systemName: "figure.walk").padding() }

            }
        }
        // .task {
        //     await vm.load()
        // }
//        .onDisappear {
//            vm.job1?.cancel()
//            vm.job2?.cancel()
//        }
        .navDestination(for: Int.self) { val in
            Text(String(val))
        }
    }
}

#Preview {
    TaskView()
}
