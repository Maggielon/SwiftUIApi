//
//  NavControllerViewModel.swift
//  SwiftUIApi
//
//  Created by Анастасия on 16.09.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import SwiftUI

// MARK: - Structs & Enums

enum NavTransiton {
    case none
    case custom(push: AnyTransition, pop: AnyTransition)
}

enum NavType {
    case push
    case pop
}

enum PopDestination {
    case previous
    case root
}


struct Screen: Identifiable, Equatable {
    
    let id: String
    let nextScreen: AnyView
    
    static func == (lhs: Screen, rhs: Screen) -> Bool {
        lhs.id == rhs.id
    }
    
}

// MARK: - Logic

final class NavControllerViewModel: ObservableObject {
    
    private let easing: Animation
    
    var navigationType = NavType.push
    
    @Published var currentScreen: Screen?
    
    private var screenStack = ScreenStack() {
        didSet {
            currentScreen = screenStack.top()
        }
    }
    
    // Init
    
    init(easing: Animation) {
        self.easing = easing
    }
    
    // API
    
    func push<S: View>(_ screenView: S) {
        withAnimation(easing) {
            navigationType = .push
            let screen = Screen(id: UUID().uuidString, nextScreen: AnyView(screenView))
            screenStack.push(screen)
        }
    }
    
    func pop(to: PopDestination = .previous) {
        withAnimation(easing) {
            navigationType = .pop
            switch to {
            case .root:
                screenStack.popToRoot()
            case .previous:
                screenStack.popToPrevious()
            }
        }
    }
    
    // Nested Stack Model
    
    private struct ScreenStack {
        
        private var screens = [Screen]()
        
        func top() -> Screen? {
            screens.last
        }
        
        mutating func push(_ s: Screen) {
            screens.append(s)
        }
        
        mutating func popToPrevious() {
            _ = screens.popLast()
        }
        
        mutating func popToRoot() {
            screens.removeAll()
        }
    }
    
}
