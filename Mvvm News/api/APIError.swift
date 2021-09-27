//
//  APIError.swift
//  Mvvm News
//
//  Created by Aashiq on 26/9/21.
//

import Foundation

enum APIError : Error{
    case decodingError
    case errorCode(Int)
    case unknown
}

extension APIError : LocalizedError{
    
    var errorDescription: String? {
        switch self{
        case .decodingError : return "Failed to decode the object from service"
        case .errorCode(let code):
            return "\(code) - Something went wrong"
        case .unknown:
            return "The error is unknown"
        }
    }
    
}
