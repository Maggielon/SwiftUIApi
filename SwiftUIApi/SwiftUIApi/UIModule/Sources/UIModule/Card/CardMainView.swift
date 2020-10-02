//
//  CardMainView.swift
//  SwiftUIApi
//
//  Created by Анастасия on 02.10.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import SwiftUI
import NetworkModule

public struct CardMainView: View {
    
    private let attacks: [Attack]
    
    public init(attacks: [Attack]) {
        self.attacks = attacks
    }
    
    public var body: some View {
        VStack {
            ForEach(attacks) { attack in
                VStack {
                    HStack {
                        Text(attack.name ?? "")
                            .font(.system(size: 16, weight: .regular))
                        Divider()
                        Text(attack.damage ?? "")
                            .font(.system(size: 16, weight: .regular))
                    }.frame(height: 30)
                    Text(attack.text ?? "")
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .font(.system(size: 14, weight: .light))
                }
            }
        }
    }
}

struct CardMainView_Previews: PreviewProvider {
    static var previews: some View {
        CardMainView(attacks: [])
    }
}
