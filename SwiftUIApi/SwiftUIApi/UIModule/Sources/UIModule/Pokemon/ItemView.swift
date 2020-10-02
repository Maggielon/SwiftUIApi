//
//  ItemView.swift
//  SwiftUIApi
//
//  Created by Анастасия on 02.10.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import SwiftUI

public struct ItemView: View {
    
    private let title: String
    private let value: String?
    
    public init(title: String, value: String?) {
        self.title = title
        self.value = value
    }
    
    public var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 14, weight: .light))
                .foregroundColor(.gray)
            Text(value ?? "-")
                .font(.system(size: 18, weight: .regular))
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(title: "Title", value: "Value")
    }
}
