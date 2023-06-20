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
    ///

    func search<P:MBQuery, R:MBResults>(endpoint: String, parameters: P?, includes: [P.Include] = []) async throws -> R {
        
        
        var searchEndpoint = "\(endpoint)"

        if let parameters {
            let encoder = JSONEncoder()
            let data = try encoder.encode(parameters)
            let encodedQuery = String(data: data, encoding: .utf8)?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            searchEndpoint += "?query=\(encodedQuery)"

        }
        
        if !includes.isEmpty {
            let incQuery = includes.map{$0.rawValue}.joined(separator: "+")
            searchEndpoint += "&inc=\(incQuery)"
        }
        
        return try await fetch(endpoint: searchEndpoint)
    }
    
//    
//    func search<T: MBSearchResult, Q: Encodable>(endpoint: String, query: MBSearchQuery<Q>) async throws -> T {
//        let encoder = JSONEncoder()
//        let data = try encoder.encode(query.query)
//        let encodedQuery = String(data: data, encoding: .utf8)?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
//        let searchEndpoint = "\(endpoint)?query=\(encodedQuery)"
//        return try await fetch(endpoint: searchEndpoint)
//    }
//    
//    func search<T: MBSearchResult, Q: Encodable>(endpoint: String, query: MBQuery<T,T,Q>) async throws -> T {
//        let encoder = JSONEncoder()
//        let data = try encoder.encode(query.query)
//        let encodedQuery = String(data: data, encoding: .utf8)?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
//        let searchEndpoint = "\(endpoint)?query=\(encodedQuery)"
//        return try await fetch(endpoint: searchEndpoint)
//    }

//    func search<T: MBSearchResult, Q: Encodable>(endpoint: String, query: MBSearchQuery<Q>) async throws -> T {
//        let encoder = JSONEncoder()
//        encoder.keyEncodingStrategy = .convertToSnakeCase
//        let data = try encoder.encode(query.query)
//        let jsonString = String(data: data, encoding: .utf8) ?? ""
//        let encodedQuery = jsonString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
//        let searchEndpoint = "\(endpoint)/search"
//        let queryURL = "\(searchEndpoint)?query=\(encodedQuery)"
//        return try await fetch(endpoint: queryURL)
//    }



//
//    
//    /// Searches for artists using the MusicBrainz API.
//    ///
//    /// - Parameters:
//    ///   - query: The search query parameters for artists.
//    /// - Throws: An error if the network request fails.
//    /// - Returns: An `MBArtistList` containing the list of artists that match the search query.
//    func searchArtist(query: MBArtistQuery<MBArtist>) async throws -> MBArtistResult {
//        let endpoint = "artist"
//        return try await search(endpoint: endpoint, query: query)
//    }
//    
//
//        
//    
//    /// Searches for releases using the MusicBrainz API.
//    ///
//    /// - Parameters:
//    ///   - query: The search query parameters for releases.
//    /// - Throws: An error if the network request fails.
//    /// - Returns: An `MBReleaseList` containing the list of releases that match the search query.
//    func searchRelease(query: MBReleaseQuery) async throws -> MBReleaseResult {
//        let endpoint = "release/"
//        return try await search(endpoint: endpoint, query: query)
//    }
//
//    /// Searches for release groups using the MusicBrainz API.
//    ///
//    /// - Parameters:
//    ///   - query: The search query parameters for release groups.
//    /// - Throws: An error if the network request fails.
//    /// - Returns: An `MBReleaseGroupList` containing the list of release groups that match the search query.
//    func searchReleaseGroup(query: MBReleaseGroupQuery) async throws -> MBReleaseGroupResult {
//        let endpoint = "release-group/"
//        return try await search(endpoint: endpoint, query: query)
//    }
//
//    /// Searches for URLs using the MusicBrainz API.
//    ///
//    /// - Parameters:
//    ///   - query: The search query parameters for URLs.
//    /// - Throws: An error if the network request fails.
//    /// - Returns: An `MBUrlList` containing the list of URLs that match the search query.
//    func searchUrl(query: MBUrlQuery) async throws -> MBUrlResult {
//        let endpoint = "url/"
//        return try await search(endpoint: endpoint, query: query)
//    }
//
//    /// Searches for events using the MusicBrainz API.
//    ///
//    /// - Parameters:
//    ///   - query: The search query parameters for events.
//    /// - Throws: An error if the network request fails.
//    /// - Returns: An `MBEventList` containing the list of events that match the search query.
//    func searchEvent(query: MBEventQuery) async throws -> MBEventResult {
//        let endpoint = "event/"
//        return try await search(endpoint: endpoint, query: query)
//    }
//    
}
