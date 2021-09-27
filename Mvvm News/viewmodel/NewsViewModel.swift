//
//  NewsViewModel.swift
//  Mvvm News
//
//  Created by Aashiq on 26/9/21.
//

import Foundation
import Combine

protocol NewsViewmodel {
    func getArticles()
}


class NewsViewmodelImp: ObservableObject, NewsViewmodel {
    
    private let service : NewsService
    
    private(set) var articles = [Article]()
    private var cancellable = Set<AnyCancellable>()
    
    @Published private(set) var state : ResultState = .loading
    
    init(service : NewsService) {
        self.service = service
    }
    
    func getArticles() {
        
        self.state  = .loading
        
        let cancellable =  service
            .request(from: .getNews)
            .sink{ res in
                switch res{
                case .finished :
                    self.state = .success(content: self.articles)
                    break
                    
                case .failure(let error):
                    print(error)
                    self.state = .failed(error: error)
                    break
                }
            } receiveValue: { response in
                
                print(response)
                self.articles =  response.articles
            }
        
        
        self.cancellable.insert(cancellable)
        
    }
    
}
