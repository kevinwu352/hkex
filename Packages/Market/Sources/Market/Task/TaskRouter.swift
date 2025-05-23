//
//  TaskRouter.swift
//  Market
//
//  Created by Kevin Wu on 5/20/25.
//

import SwiftUI

public struct TaskRouter {

    @MainActor
    public static func createView() -> some View {
        TaskView()
    }

}
