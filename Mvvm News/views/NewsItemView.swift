//
//  NewsItemView.swift
//  Mvvm News
//
//  Created by Aashiq on 26/9/21.
//

import SwiftUI
import URLImage

struct NewsItemView: View {
    
    let article : Article
    

    var body: some View {
    
        HStack{
            
            if let imgURL = article.image,
               let url = URL(string: imgURL){
                URLImage(url,
                         failure :{error ,_ in
                            Image(systemName: "photo.fill")
                                .foregroundColor(.white)
                                .background(Color.gray)
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                         },
                         content :{ image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        
                         }
                
                )
                
                .frame(width : 100, height : 100)
                    
                    .cornerRadius(10)
            }else{
        
                PlaceHolderImageView()
                
            }
            
            VStack(alignment: .leading, spacing: 4){
                
                Text(article.title ?? "")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight : .semibold))
                
                Text(article.source ?? "N/A")
                    .foregroundColor(.gray)
                    .font(.footnote)
                
            }
            
            
        }
        
    }
}


struct PlaceHolderImageView : View {
    var body : some View{
    Image(systemName: "photo.fill")
        .foregroundColor(.white)
        .background(Color.gray)
        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
    

}

struct NewsItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewsItemView( article : Article.dummyData)
            .previewLayout(.sizeThatFits)
    }
}
