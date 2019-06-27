//
//  ApiClient.swift
//  Networking
//
//  Created by Oguz Parlak on 27.06.2019.
//  Copyright © 2019 Oguz Parlak. All rights reserved.
//

import Foundation
import Alamofire

public enum Result<T, Failure> where Failure: Error {
    case success(value: T)
    case error(error: Failure)
}

public class ApiClient {
    
    //-------------------------------------------------------------------------------------------------
    //MARK: - The request function to get results
    public static func request<T: Codable> (_ urlConvertible: URLRequestConvertible, completion: @escaping (Result<T, ApiError>) -> Void) {
        //Trigger the HttpRequest using AlamoFire (AF)
        AF.request(urlConvertible).responseDecodable { (response: DataResponse<T>) in
            //Check the result from Alamofire's response and check if it's a success or a failure
            switch response.result {
            case .success(let value):
                //Everything is fine
                completion(Result.success(value: value))
            case .failure( _):
                //Something went wrong
                switch response.response?.statusCode {
                case 403:
                    completion(Result.error(error: ApiError.forbidden))
                case 404:
                    completion(Result.error(error: ApiError.notFound))
                case 409:
                    completion(Result.error(error: ApiError.conflict))
                case 500:
                    completion(Result.error(error: ApiError.internalServerError))
                default:
                    completion(Result.error(error: ApiError.unknownError))
                }
            }
        }
    }
}
