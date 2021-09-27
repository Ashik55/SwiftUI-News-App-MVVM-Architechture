//
//  HomeView.swift
//  Mvvm News
//
//  Created by Aashiq on 26/9/21.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewmodel = NewsViewmodelImp(service: NewsServiceImpl())
    
    var body: some View {
        Group {
            
            switch viewmodel.state {
            case .loading :
                ProgressView()
                
            case .success(content: let articles):
                NavigationView{
                    List(articles){ item in
                        NewsItemView(article: item)
                    }.navigationTitle(Text("News"))
                }
            case .failed(error: let error):
                ErrorView(error: error, handler: viewmodel.getArticles)
            }
            
        }.onAppear(perform: viewmodel.getArticles)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
