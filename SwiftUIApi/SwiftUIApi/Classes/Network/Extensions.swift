//
//  Extensions.swift
//  SwiftUIApi
//
//  Created by Анастасия on 14.09.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

protocol URLQueryParameterStringConvertible {
    
    var queryParameters: String { get }
}

extension Dictionary: URLQueryParameterStringConvertible {
    
    var queryParameters: String {
        var parts: [String] = []
        for (key, value) in self {
            let part = String(
                format: "%@=%@",
                String(describing: key).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!,
                String(describing: value).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            )
            parts.append(part as String)
        }
        return parts.joined(separator: "&")
    }
}

extension URL {
    
    func appendinQueryParameters(_ parametersDictionary: Dictionary<String, Any>) -> URL {
        let URLString: String = String(format: "%@?%@", self.absoluteString, parametersDictionary.queryParameters)
        return URL(string: URLString)!
    }
}

protocol JSONEncodable {
    
    func encodeToJSON() -> Any
}

extension Int: JSONEncodable {
    
    func encodeToJSON() -> Any {
        return self as Any
    }
}

extension String: JSONEncodable {
    
    func encodeToJSON() -> Any {
        return self as Any
    }
}

extension RandomAccessCollection where Self.Element: Identifiable {
    
    func isLastItem<Item: Identifiable>(_ item: Item) -> Bool {
        guard !isEmpty else {
            return false
        }
        
        guard let itemIndex = firstIndex(where: { AnyHashable($0.id) == AnyHashable(item.id) }) else {
            return false
        }
        
        let distance = self.distance(from: itemIndex, to: endIndex)
        
        return distance == 1
    }
}

extension RandomAccessCollection where Self.Element: Identifiable {
    
    func isThresholdItem<Item: Identifiable>(offset: Int, item: Item) -> Bool {
        guard !isEmpty else {
            return false
        }
        
        guard let itemIndex = firstIndex(where: { AnyHashable($0.id) == AnyHashable(item.id) }) else {
            return false
        }
        
        let distance = self.distance(from: itemIndex, to: endIndex)
        let offset = offset < count ? offset : count - 1
        
        return offset == (distance - 1)
    }
}

extension UIImage {
    
    convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}
