//
//  ListSection.swift
//  Foods
//
//  Created by Saidaxmad on 16/09/22.
//

import Foundation

enum ListSection {
    case sales([ListItem])
    case category([ListItem])
    case example([ListItem])
    
    var items: [ListItem] {
        switch self {
        case .sales(let items),
                .category(let items),
                .example(let items):
            return items
        }
    }
    
    var count: Int {
        items.count
    }
    var title: String {
        switch self {
        case .sales(_):
            return "Menu"
        case .category(_):
            return "Category"
        case .example(_):
            return "Example"
        }
    }
}
