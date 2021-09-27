//
//  NewsResponse.swift
//  Mvvm News
//
//  Created by Aashiq on 26/9/21.
//

import Foundation

// MARK: - NewsResponseModel
struct NewsResponseModel: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Identifiable {
    let id = UUID()
    let author: String?
    let url: String?
    let source, title: String?
    let articleDescription: String?
    let image: String?
    let date: Date?

    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}


extension Article{
    static var dummyData : Article{
        .init(
        author: "Jesse Holland",
            url: "https://www.mmamania.com/2021/9/25/22692513/nick-diaz-vs-robbie-lawler-full-fight-video-preview-ufc-266-mma",
            source:"MMA Mania",
            title: "Nick Diaz vs Robbie Lawler full fight video preview for UFC 266 - MMA Mania",
            articleDescription: "Nick Diaz vs. Robbie Lawler full fight video preview for UFC 266 middleweight rematch TONIGHT (Sat., Sept. 25, 2021) inside T-Mobile Arena in Las Vegas, Nevada.",
            image: "https://cdn.vox-cdn.com/thumbor/AGY6hHRvO_3g_S4ec35M5scxQbc=/0x0:4355x2450/1600x900/cdn.vox-cdn.com/uploads/chorus_image/image/69907258/462598690.jpg.0.jpg",
            date: Date()
        )
    }
}
