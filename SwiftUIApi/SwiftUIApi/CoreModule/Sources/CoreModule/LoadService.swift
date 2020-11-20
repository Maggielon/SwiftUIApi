//
//  LoadService.swift
//  SwiftUIApi
//
//  Created by Анастасия on 19.11.2020.
//  Copyright © 2020 Анастасия. All rights reserved.
//

import Foundation
import RealmSwift

public typealias ErrorHandler = (_ error: Error?) -> Void

public protocol ILoadService {
    func sync(_ completion: ErrorHandler?)
    func syncIfNeed(_ completion: ErrorHandler?)
}


public class LoadService {
    let syncInterval: TimeInterval = 60
    let lastLoadDateKey = "LastLoadDateKey"
    
    
    private let cardService: ICardNetworkService
    private let databaseService: DataBaseService
    private let mainService: IMainService
    
    private var lastLoadDate: Date {
        get {
            let value = UserDefaults().value(forKey: lastLoadDateKey)
            return  value as? Date ?? Date.distantPast
        }
        set {
            UserDefaults().set(newValue, forKey: lastLoadDateKey)
        }
    }
    
    init(cardService: ICardNetworkService, databaseService: DataBaseService, mainService: IMainService) {
        self.cardService = cardService
        self.databaseService = databaseService
        self.mainService = mainService
    }
}

extension LoadService: ILoadService {
    public func syncIfNeed(_ completion: ErrorHandler?) {
        
        let lastLoadDateTimeIntervalSinseNow = Date().timeIntervalSince(lastLoadDate)
        
        if lastLoadDateTimeIntervalSinseNow > syncInterval {
            sync(completion)
        } else if let syncCompletion = completion {
            syncCompletion(NSError(domain: "domain", code: 200))
        }
    }
    
    public func sync(_ completion: ErrorHandler?) {
//        var syncErrors = [Error]()
//        var date = Date()
//        
//        let syncQueue = OperationQueue()
//        
//        var waitResult: DispatchTimeoutResult = .timedOut
//        
//        let requestOperation = BlockOperation {
//            
//            let requestsGroup = DispatchGroup()
//            
//            date = Date()
//            
//            self.cardService.getCards(page: <#T##Int#>, size: <#T##Int#>)
//            
//            for resource in resourceNames {
//                requestsGroup.enter()
//                
//                guard let requestURL = self.makeRequestUrl(for: resource) else {break}
//                
//                self.networkService.loadData(from: requestURL, completion:
//                    {[weak self] (resultData, error) in
//                        
//                        if let someData = resultData, someData.count > 0
//                        {
//                            self?.contactsService.writeContacts(from: someData)
//                        }
//                        
//                        if let syncError = error
//                        {
//                            syncErrors.append(syncError)
//                        }
//                        requestsGroup.leave()
//                })
//            }
//            
//            //            requestsGroup.wait()
//            waitResult = requestsGroup.wait(timeout: .now() + 30)
//            date = Date()
//        }
//        
//        let responseOperation = BlockOperation
//        {[weak self] in
//            
//            DispatchQueue.main.async
//                {
//                    date = Date()
//                    if waitResult == .success
//                    {
//                        self?.lastLoadDate = Date()
//                    }
//                    else
//                    {
//                        let error = NSError(code: 502, message: "Connection error")
//                        
//                        syncErrors.append(error)
//                    }
//                    
//                    if let syncCompletion = completion
//                    {
//                        if syncErrors.isEmpty
//                        {
//                            syncCompletion(nil)
//                        }
//                        else
//                        {
//                            for error in syncErrors
//                            {
//                                syncCompletion(error)
//                            }
//                        }
//                    }
//            }
//        }
//        
//        responseOperation.addDependency(requestOperation)
//        
//        syncQueue.addOperation(requestOperation)
//        syncQueue.addOperation(responseOperation)
    }
}
