//
//  FakeNavBar.swift
//  SwiftUIApi
//
//  Created by Анастасия on 16.09.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import SwiftUI

public struct FakeNavBar: View {
    
    @EnvironmentObject private var viewModel: NavControllerViewModel
    
    let label: String
    //let backAction: ()->Void
    
    public init(label: String) {
        self.label = label
    }
    
    public var body: some View {
        ZStack {
            HStack {
                if viewModel.currentScreen != nil {
                    backView
                    .simultaneousGesture(TapGesture()
                        .onEnded {
                            self.viewModel.pop(to: .previous)
                            //self.backAction()
                        }
                    )
                    .padding(.top, UIDevice.current.hasNotch ? 40 : 20)
                }
                Spacer()
            }
            .frame(height: UIDevice.current.hasNotch ? 64 : 44)
            .frame(maxWidth: .infinity)
            .background(Color("BackgroundMain"))
            .compositingGroup()
            .shadow(color: Color("BackgroundMain").opacity(0.2), radius: 0, x: 0, y: 2)
            Text(label)
                .foregroundColor(.primary)
                .font(Font.body.weight(.bold))
                .padding(.top, UIDevice.current.hasNotch ? 40 : 20)
        }
    }
    
    var backView: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
                .opacity(0.02)
                .frame(width: 60, height: 60)
                .allowsHitTesting(false)
            HStack {
                Spacer()
                Image(systemName: "chevron.left")
                    .font(Font.system(size: 20).weight(.semibold))
                    .foregroundColor(.primary)
                Spacer()
            }
            .frame(width: 50, height: 50)
            .contentShape(Rectangle())
        }
    }
    
}

