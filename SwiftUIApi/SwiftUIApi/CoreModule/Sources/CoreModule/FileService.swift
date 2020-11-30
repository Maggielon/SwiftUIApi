//
//  FileService.swift
//  
//
//  Created by Анастасия on 30.11.2020.
//

import Foundation

public protocol IFileService {
    func saveToFile<T: Codable>(data: T)
    func getFromFile<T: Codable>() -> T?
}

public class FileService: IFileService {
    
    var path: URL? {
        guard let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return directory.appendingPathComponent("data")
    }
    
    public init() { }
    
    public func saveToFile<T: Codable>(data: T) {
        guard let path = self.path else { return }
        do {
            let encoder = JSONEncoder()
            let string = try encoder.encode(data)
            do {
                try string.write(to: path)
            } catch {
                print(error.localizedDescription)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    public func getFromFile<T: Codable>() -> T? {
        guard let path = self.path else {
            return nil
        }
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: path)
            do {
                let decodedData = try decoder.decode(T.self, from: data)
                return decodedData
            } catch {
                print(error.localizedDescription)
                return nil
            }
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
