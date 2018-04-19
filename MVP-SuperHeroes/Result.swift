//
//  Result.swift
//  MVP-SuperHeroes
//
//  Created by appsistemas on 18/4/18.
//  Copyright © 2018 eloysn. All rights reserved.
//

import Foundation

enum Result<S, E > {
    case Success(_: S)
    case Failure(_: E)
    
    func map<T> (tranform: @escaping (S) -> T) -> Result<T, E> {
        switch self {
        case .Failure(let reason):
            return .Failure(reason)
        case .Success(let result):
            return    .Success(tranform(result))
        }
    }
    
}
