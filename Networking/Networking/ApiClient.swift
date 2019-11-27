//
//  ApiClient.swift
//  Networking
//
//  Created by Oguz Parlak on 27.06.2019.
//  Copyright © 2019 Oguz Parlak. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

public enum Result<T, Failure> where Failure: Error {
    case success(value: T)
    case error(error: Failure)
}

public class ApiClient {
    
    //-------------------------------------------------------------------------------------------------
    //MARK: - The request function to get results
    public static func request<T: Codable> (_ urlConvertible: URLRequestConvertible) -> Observable<T> {
        //Trigger the HttpRequest using AlamoFire (AF)
        return Observable<T>.create { observer -> Disposable in
            let task = AF.request(urlConvertible).responseDecodable { (response: DataResponse<T>) in
                //Check the result from Alamofire's response and check if it's a success or a failure
                switch response.result {
                case .success(let value):
                    //Everything is fine
                    observer.onNext(value)
                case .failure( _):
                    //Something went wrong
                    switch response.response?.statusCode {
                    case 403:
                        observer.onError(ApiError.forbidden)
                    case 404:
                        observer.onError(ApiError.notFound)
                    case 409:
                        observer.onError(ApiError.conflict)
                    case 500:
                        observer.onError(ApiError.internalServerError)
                    default:
                        observer.onError(ApiError.unknownError)
                    }
                }
                observer.onCompleted()
            }
            return Disposables.create {
                task.cancel()
            }
        }
        
    }
}
