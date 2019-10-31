//
//  APIManager.swift
//  Onboarding
//
//  Created by Ariel Congestri on 30/10/2019.
//  Copyright © 2019 Ariel Congestri. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

class APIManager {
    
    class func executeArray<T: Decodable>(Request theRequest: RequestBuilder) -> Promise<[T]> {
        return Promise<[T]> { seal in
            request(theRequest).responseJSON { (response) in
                var codableArray = [T]()
                guard let data = response.data else { seal.fulfill(codableArray); return}
                do {
                    let decoder = JSONDecoder()
                    codableArray = try decoder.decode([T].self, from: data)
                    seal.fulfill(codableArray)
                } catch {
                    seal.reject(error)
                }
            }
        }
    }

    class func search(Request theRequest: RequestBuilder) -> Promise<[Show]> {
        return Promise<[Show]> { seal in
            request(theRequest).responseJSON { (response) in
                var showArray = [Show]()
                guard let data = response.data else { seal.fulfill(showArray); return}
                do {
                    let decoder = JSONDecoder()
                    let responseArray = try decoder.decode([SearchResponse].self, from: data)
                    responseArray.forEach { (response) in
                        showArray.append(response.show)
                    }
                    seal.fulfill(showArray)
                } catch {
                    seal.reject(error)
                }
            }
        }
    }

}
