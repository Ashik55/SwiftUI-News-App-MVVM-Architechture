//
//  NewsEndpoint.swift
//  Mvvm News
//
//  Created by Aashiq on 26/9/21.
//

import Foundation

protocol APIBuilder {
    var baseURL : URL { get }
    var path : String { get }
    var urlRequest : URLRequest{ get }
}

enum NewsAPI{
    case getNews
}

extension NewsAPI : APIBuilder{
    var baseURL: URL {
        switch self{
        //https://api.lil.software/news
        case .getNews : return URL( string: "https://api.lil.software")!
        }
        
    }
    
    var path: String {
        return "/news"
    }
    
    var urlRequest: URLRequest {
        return URLRequest(url: self.baseURL.appendingPathComponent(self.path))
    }
    

    
}
