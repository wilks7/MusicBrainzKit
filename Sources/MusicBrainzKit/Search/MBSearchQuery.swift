//
//  File.swift
//  
//
//  Created by Michael on 6/19/23.
//

import Foundation

public protocol MBSearchQuery: Encodable {
    var query: [String:String]? {get}
    var inc: [String]? {get}
}
