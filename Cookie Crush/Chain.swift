//
//  Chain.swift
//  Cookie Crush
//
//  Created by Jose Luis Molina on 27/1/15.
//  Copyright (c) 2015 Jose Luis Molina. All rights reserved.
//

import Foundation

func ==(lhs: Chain, rhs: Chain) -> Bool {
    return lhs.cookies == rhs.cookies
}

class Chain: Hashable, Printable {
    var cookies = [Cookie]()
    var score = 0
    
    enum ChainType: Printable {
        case Horizontal
        case Vertical
        
        var description: String {
            switch self {
            case .Horizontal: return "Horizontal"
            case .Vertical: return "Vertical"
            }
        }
    }
    
    var chainType: ChainType
    
    init(chainType: ChainType) {
        self.chainType = chainType
    }
    
    func addCookie(cookie: Cookie) {
        cookies.append(cookie)
    }
    
    func firstCookie() -> Cookie {
        return cookies[0]
    }
    
    func lastCookie() -> Cookie {
        return cookies[cookies.count - 1]
    }
    
    var length: Int {
        return cookies.count
    }
    
    var description: String {
        return "type:\(chainType) cookies:\(cookies)"
    }
    
    var hashValue: Int {
        return reduce(cookies, 0) { $0.hashValue ^ $1.hashValue }
    }
    
}