//
//  NavPopButton.swift
//  SwiftUIApi
//
//  Created by Анастасия on 16.09.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import SwiftUI

public struct NavPopButton<Label>: View where Label: View {
    
    @EnvironmentObject private var viewModel: NavControllerViewModel
    
    private let destination: PopDestination
    private let label: Label
    
    public init(destination: PopDestination, @ViewBuilder label: @escaping () -> Label) {
        self.destination = destination
        self.label = label()
    }
    
    public var body: some View {
        label.onTapGesture {
            self.pop()
        }
    }
    
    private func pop() {
        viewModel.pop(to: destination)
    }
}
