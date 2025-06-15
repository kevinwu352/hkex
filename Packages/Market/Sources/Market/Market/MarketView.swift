//
//  MarketView.swift
//  Market
//
//  Created by Kevin Wu on 5/3/25.
//

import SwiftUI
import Design

struct MarketView: View {

    @State var vm: MarketViewModel
    // init(vm: MarketViewModel) {
    //     self.vm = vm
    //     print("market init")
    // }

    var body: some View {
        ZStack {
            Color.kViewBg.ignoresSafeArea()
            List(vm.posts) { post in
                VStack(alignment: .leading) {
                    Text(String(post.id))
                    Text(post.title)
                }
            }
            .listStyle(.plain)
        }
        // .onAppear {
        //     print("market appear")
        // }
        // .onDisappear {
        //     print("market disappear")
        // }
        .onFirstTask {
            print("market task")
            await vm.getPosts()
        }
        .refreshable {
            print("market refreshable")
            await vm.getPosts()
        }
        .navBarBackable(false)
        .navBarTitleView(Text("market_title"))
        .navBarLeadView(
            NavigationLink(value: Route.task) {
                Image(systemName: "arrow.down.to.line")
                    .padding(.leading)
            }
        )
        .navBarTrailView(
            Button {
                vm.plusId()
            } label: {
                Image(systemName: "plus")
                    .padding(.trailing)
            }
        )
        .applyRoute()
    }
}

#Preview {
    MarketView(vm: .init(provider: MarketProvider()))
}
