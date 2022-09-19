//
//  MockData.swift
//  Foods
//
//  Created by Saidaxmad on 16/09/22.
//

import Foundation

struct MockData {
    
    static let shared = MockData()
    
    private let sales: ListSection = {
       
        .sales([.init(title: "", image: ""),
                .init(title: "", image: ""),
                .init(title: "", image: "")])
    }()
    
    private let category: ListSection = {
        .category([.init(title: "Burger", image: ""),
                   .init(title: "Chicken", image: ""),
                   .init(title: "Hot-dog", image: ""),
                   .init(title: "Pizza", image: ""),
                   .init(title: "Taco", image: ""),
                   .init(title: "Wok", image: "")])
    }()
    
    private let example: ListSection = {
        .example([.init(title: "", image: ""),
                  .init(title: "", image: ""),
                  .init(title: "", image: ""),])
    }()
    
    var pageData: [ListSection] {
        [sales, category, example]
    }
}
