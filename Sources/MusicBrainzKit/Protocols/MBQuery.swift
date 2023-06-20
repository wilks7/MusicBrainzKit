//
//  File.swift
//  
//
//  Created by Michael on 6/19/23.
//

import Foundation

public protocol MBQuery: Encodable {
    associatedtype Include: Includes
}

extension [String:String]:MBQuery {
    public typealias Include = MiscIncludes
}

public struct DefaultQuery: MBQuery {
    public var id: String?
    public var artistName: String?
        
    public init(id: String? = nil, artistName: String? = nil) {
        self.id = id
        self.artistName = artistName
    }
    public typealias Include = RelationsIncludes
}
