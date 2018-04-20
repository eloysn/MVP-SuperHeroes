//
//  Heroe.swift
//  MVP-SuperHeroes
//
//  Created by appsistemas on 18/4/18.
//  Copyright © 2018 eloysn. All rights reserved.
//

import Foundation

struct Heroe: Codable, Comparable {
    
    
    
    
    let name: String
    let photo: URL
    let realName: String
    let power: String
    let abilities: String
    let groups: String
    let height: String
    
    // MARK: - Comparable
    static func <(lhs: Heroe, rhs: Heroe) -> Bool {
       return lhs.name > rhs.name
    }
    
    static func ==(lhs: Heroe, rhs: Heroe) -> Bool {
        return lhs.name == lhs.name
    }
    
}
