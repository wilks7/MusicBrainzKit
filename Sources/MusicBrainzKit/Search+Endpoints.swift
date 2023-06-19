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
    
    func fetch<T: Decodable, Q: MBSearchQuery>(endpoint: String, query: Q) async throws -> T {
        let keyValuePairs: [String: String] = query.query ?? [:]
        let joinedPairs = keyValuePairs.map { key, value in "\(key):\"\(value)\"" }.joined(separator: " AND ")
        let searchEndpoint = "\(endpoint)?query=\(joinedPairs)"
        return try await fetch(endpoint: searchEndpoint)
    }

    private func search<T: Decodable, Q: MBSearchQuery>(endpoint: String, query: Q) async throws -> T {
        return try await fetch(endpoint: endpoint, query: query)
    }
    
    /// Searches for artists using the MusicBrainz API.
    ///
    /// - Parameters:
    ///   - query: The search query parameters for artists.
    /// - Throws: An error if the network request fails.
    /// - Returns: An `MBArtistList` containing the list of artists that match the search query.
    func searchArtist<Q: MBSearchQuery>(query: Q) async throws -> MBArtistList {
        let endpoint = "artist"
        return try await search(endpoint: endpoint, query: query)
    }
    
    /// Searches for areas using the MusicBrainz API.
    ///
    /// - Parameters:
    ///   - query: The search query parameters for areas.
    /// - Throws: An error if the network request fails.
    /// - Returns: An `MBAreaList` containing the list of areas that match the search query.
    func searchArea<Q:MBSearchQuery>(query: Q) async throws -> MBAreaList {
        let endpoint = "area/"
        return try await search(endpoint: endpoint, query: query)
    }
        
    
    /// Searches for releases using the MusicBrainz API.
    ///
    /// - Parameters:
    ///   - query: The search query parameters for releases.
    /// - Throws: An error if the network request fails.
    /// - Returns: An `MBReleaseList` containing the list of releases that match the search query.
    func searchRelease<Q: MBSearchQuery>(query: Q) async throws -> MBReleaseList {
        let endpoint = "release/"
        return try await search(endpoint: endpoint, query: query)
    }

    /// Searches for release groups using the MusicBrainz API.
    ///
    /// - Parameters:
    ///   - query: The search query parameters for release groups.
    /// - Throws: An error if the network request fails.
    /// - Returns: An `MBReleaseGroupList` containing the list of release groups that match the search query.
    func searchReleaseGroup<Q: MBSearchQuery>(query: Q) async throws -> MBReleaseGroupList {
        let endpoint = "release-group/"
        return try await search(endpoint: endpoint, query: query)
    }

    /// Searches for URLs using the MusicBrainz API.
    ///
    /// - Parameters:
    ///   - query: The search query parameters for URLs.
    /// - Throws: An error if the network request fails.
    /// - Returns: An `MBUrlList` containing the list of URLs that match the search query.
    func searchUrl<Q: MBSearchQuery>(query: Q) async throws -> MBUrlList {
        let endpoint = "url/"
        return try await search(endpoint: endpoint, query: query)
    }

    /// Searches for events using the MusicBrainz API.
    ///
    /// - Parameters:
    ///   - query: The search query parameters for events.
    /// - Throws: An error if the network request fails.
    /// - Returns: An `MBEventList` containing the list of events that match the search query.
//    func searchEvent<Q: MBSearchQuery>(query: Q) async throws -> MBEventList {
//        let endpoint = "event/"
//        return try await search(endpoint: endpoint, query: query)
//    }
    
}
