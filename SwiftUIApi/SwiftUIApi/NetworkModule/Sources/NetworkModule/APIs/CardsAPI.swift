//
// CardsAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation



open class CardsAPI {
    /**
     Get All Cards
     
     - parameter page: (query) Page number (optional)
     - parameter pageSize: (query) Page size (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getAllCards(page: Int? = nil, pageSize: Int? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: CardsList?,_ error: Error?) -> Void)) {
        getAllCardsWithRequestBuilder(page: page, pageSize: pageSize).execute(apiResponseQueue) { result -> Void in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get All Cards
     - GET /cards
     - parameter page: (query) Page number (optional)
     - parameter pageSize: (query) Page size (optional)
     - returns: RequestBuilder<CardsList> 
     */
    open class func getAllCardsWithRequestBuilder(page: Int? = nil, pageSize: Int? = nil) -> RequestBuilder<CardsList> {
        let path = "/cards"
        let URLString = OpenAPIClientAPI.basePathCard + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "page": page?.encodeToJSON(), 
            "pageSize": pageSize?.encodeToJSON()
        ])

        let requestBuilder: RequestBuilder<CardsList>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()
        
        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
