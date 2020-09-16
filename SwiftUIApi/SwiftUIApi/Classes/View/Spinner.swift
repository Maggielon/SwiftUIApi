//
//  Spinner.swift
//  SwiftUIApi
//
//  Created by Анастасия on 14.09.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import SwiftUI
import UIKit

struct Spinner: UIViewRepresentable {
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let spinner = UIActivityIndicatorView(style: style)
        spinner.hidesWhenStopped = true
        spinner.startAnimating()
        return spinner
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
}

struct Spinner_Previews: PreviewProvider {
    static var previews: some View {
        Spinner(style: .large)
    }
}

