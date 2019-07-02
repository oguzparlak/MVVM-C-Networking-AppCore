//
//  Constants.swift
//  Networking
//
//  Created by Oguz Parlak on 27.06.2019.
//  Copyright © 2019 Oguz Parlak. All rights reserved.
//

import Foundation

public struct Constants {
    
    /// The API's base URL
    public static let baseUrl = "https://api.themoviedb.org/3/"
    
    /// Paste your API Key over here
    public static let tmdbApiKey = "c5e241681c87e0206115395de7435e28"
    
    /// The parameters (Queries) that we're gonna use
    public struct Parameters {
        public static let api_key = "api_key"
    }
    
    /// The header fields
    public enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }
    
    /// The content type (JSON)
    public enum ContentType: String {
        case json = "application/json"
    }
    
}
