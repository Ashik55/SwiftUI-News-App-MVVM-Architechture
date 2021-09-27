//
//  HomeView.swift
//  Mvvm News
//
//  Created by Aashiq on 26/9/21.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.openURL) var openURL
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
                            .onTapGesture {
                                load(url: item.url)
                            }
                    }.navigationTitle(Text("News"))
                }
            case .failed(error: let error):
                ErrorView(error: error, handler: viewmodel.getArticles)
            }
            
        }.onAppear(perform: viewmodel.getArticles)
    }
    
    
    func load(url : String?){
        guard  let link = url,
               let url = URL(string: link) else {return}
        
        openURL(url)
    }
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
