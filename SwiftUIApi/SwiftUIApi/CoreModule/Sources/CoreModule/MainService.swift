//
//  MainService.swift
//  SwiftUIApi
//
//  Created by Анастасия on 19.11.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import Foundation
import RealmSwift

public protocol IMainService {
    
    func read<T: RealmSwift.Object>() -> Results<T>?
    func read<T: RealmSwift.Object>(with id: String) -> T?
    
    func write<T: RealmSwift.Object>(data: [T])
    func write<T: RealmSwift.Object>(data: T)
}


public class MainService {
    private var readRealm: Realm?
    
    public let databaseService: IDataBaseService?
    
    public init(databaseService: IDataBaseService?){
        self.readRealm = databaseService?.readRealm
        
        self.databaseService = databaseService
    }
}

extension MainService: IMainService {
    
    public func read<T: RealmSwift.Object>() -> Results<T>? {
        return readRealm?.objects(T.self)
    }
    
    public func read<T: RealmSwift.Object>(with id: String) -> T? {
        return readRealm?.object(ofType: T.self, forPrimaryKey: id)
    }
    
    public func write<T: RealmSwift.Object>(data: [T]) {
        DispatchQueue.global().async {
            autoreleasepool { [weak self] in
                guard let strongify = self else {return}
                let writeRealm = strongify.databaseService?.newRealm
                do {
                    try writeRealm?.write {
                        writeRealm?.add(data, update: .all)
                    }
                } catch {
                    print(error)
                }
            }
        }
    }
    
    public func write<T: RealmSwift.Object>(data: T) {
        DispatchQueue.global().async {
            autoreleasepool { [weak self] in
                guard let strongify = self else {return}
                let writeRealm = strongify.databaseService?.newRealm
                do {
                    try writeRealm?.write {
                        writeRealm?.add(data, update: .all)
                    }
                } catch {
                    print(error)
                }
            }
        }
    }
}
