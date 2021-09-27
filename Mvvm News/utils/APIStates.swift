//
//  APIStates.swift
//  Mvvm News
//
//  Created by Aashiq on 26/9/21.
//

import Foundation

enum ResultState {
    case loading
    case success(content : [Article])
    case failed(error : Error)
}
