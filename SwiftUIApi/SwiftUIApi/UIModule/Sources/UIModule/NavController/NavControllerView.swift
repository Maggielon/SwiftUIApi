//
//  NavControllerView.swift
//  SwiftUIApi
//
//  Created by Анастасия on 16.09.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

public struct NavControllerView<Content>: View where Content: View {
    
    @ObservedObject private var viewModel: NavControllerViewModel
    
    private let content: Content
    private let transition: (push: AnyTransition, pop: AnyTransition)
    
    public init(transition: NavTransiton, viewModel: NavControllerViewModel, @ViewBuilder content: @escaping () -> Content) {
        self.viewModel = viewModel
        self.content = content()
        switch transition {
        case .custom(let pushTransition, let popTransition):
            self.transition = (pushTransition, popTransition)
        case .none:
            self.transition = (.identity, .identity)
        }
    }
    
    public var body: some View {
        let isRoot = viewModel.currentScreen == nil
        return ZStack {
            if isRoot {
                content
                    .environmentObject(viewModel)
                    .transition(viewModel.navigationType == .push ? transition.push : transition.pop)
            } else {
                viewModel.currentScreen!.nextScreen
                    .environmentObject(viewModel)
                    .transition(viewModel.navigationType == .push ? transition.push : transition.pop)
            }
        }
    }
    
}


public extension AnyTransition {
    
    static var slideIn: AnyTransition {
        return .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    }
    
    static var slideOut: AnyTransition {
        return .asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing))
    }
}
