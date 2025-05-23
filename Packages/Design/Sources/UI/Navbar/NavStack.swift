//
//  NavStack.swift
//  Design
//
//  Created by Kevin Wu on 4/2/25.
//

import SwiftUI

public struct NavStack<Root: View>: View {

    @Binding var path: NavigationPath
    let root: Root

    public init(path: Binding<NavigationPath> = .constant(NavigationPath()), @ViewBuilder root: () -> Root) {
        self._path = path
        self.root = root()
    }

    public var body: some View {
        NavigationStack(path: $path) {
            NavContentView {
                root
            }
        }
    }
}

#Preview {
    NavStack {
        ZStack {
            Color.red.ignoresSafeArea()
            VStack {
                Text("<head>")
                Spacer()
                Text("<foot>")
            }
        }
        .navBarTitleView(Text("<title>"))
    }
}
