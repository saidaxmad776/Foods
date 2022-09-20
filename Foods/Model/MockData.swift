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
       
        .sales([.init(title: "", image: "burger"),
                .init(title: "", image: "burger"),
                .init(title: "", image: "burger")])
    }()
    
    private let category: ListSection = {
        .category([.init(title: "Burger", image: "burger"),
                   .init(title: "Chicken", image: "burger"),
                   .init(title: "Hot-dog", image: "burger"),
                   .init(title: "Pizza", image: "burger"),
                   .init(title: "Taco", image: "burger"),
                   .init(title: "Wok", image: "burger")])
    }()
    
    private let example: ListSection = {
        .example([.init(title: "", image: "burger"),
                  .init(title: "", image: "burger"),
                  .init(title: "", image: "burger"),])
    }()
    
    var pageData: [ListSection] {
        [sales, category, example]
    }
}
