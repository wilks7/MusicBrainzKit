//
//  File.swift
//  
//
//  Created by Michael on 6/19/23.
//

import Foundation

public enum MBSearchError: Error {
    case searchFailed(String)
}

public extension MusicBrainzClient {
    /// <ENTITY_TYPE>?query=<QUERY>&limit=<LIMIT>&offset=<OFFSET>

    /// This function searches for entities of a given type with optional query, limit and offset parameters.
    /// - Parameters:
    ///   - type: The type of entity to search for.
    ///   - parameters: Optional query, limit and offset parameters.
    ///   - includes: Optional array of includes to include in the search.
    /// - Returns: An array of entities of the given type that match the search criteria.
    func search<E:MBEntity>(for type: E.Type, parameters: E.Search.Query?, includes: [E.Search.Query.Include] = []) async throws -> [E] {
        let url = try makeEndpoint(for: E.endpoint, parameters: parameters, includes: includes)
        let results: E.Search.Results =  try await fetch(url: url)
        return results.results
    }
    
    func search<E:MBEntity>(parameters: E.Search.Query?, includes: [E.Search.Query.Include] = []) async throws -> [E] {
        let url = try makeEndpoint(for: E.endpoint, parameters: parameters, includes: includes)
        let results: E.Search.Results =  try await fetch(url: url)
        return results.results
    }
    
    func search<E:MBEntity>(parameters: [String:String], includes: [E.Search.Query.Include] = []) async throws -> [E] {
        let url = try makeEndpoint(for: E.endpoint, parameters: parameters, includes: includes)
        let results: E.Search.Results =  try await fetch(url: url)
        return results.results
    }

}
