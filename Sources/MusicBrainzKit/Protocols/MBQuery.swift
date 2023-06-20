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

public struct DefaultQuery: MBQuery {
    public var id: String?
    public typealias Include = RelationsIncludes
}
