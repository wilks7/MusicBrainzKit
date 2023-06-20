
import Foundation

public extension MusicBrainzClient {
        
    func browse<B: MBEntity, R:MBResults>(_ type: B.Type, id: String) async throws -> R where R.Result:MBEntity {
        let query: DefaultQuery? = nil
        return try await self.browse(type, id: id, parameters: query, includes: [])
    }
    
    
    func browse<B: MBEntity, P:MBQuery, R:MBResults>(_ type: B.Type, id: String, parameters: P? = nil, includes: [P.Include] = []) async throws -> R where R.Result:MBEntity {
        var endpoint: String = "\(R.Result.endpoint)?\(B.endpoint)=\(id)"
        
        if let parameters {
            let encoder = JSONEncoder()
            let data = try encoder.encode(parameters)
            let encodedQuery = String(data: data, encoding: .utf8)?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            endpoint += "&query=\(encodedQuery)"

        }
        
        if !includes.isEmpty {
            let incQuery = includes.map{$0.rawValue}.joined(separator: "+")
            endpoint += "&inc=\(incQuery)"
        }
        return try await fetch(endpoint: endpoint)


    }

    
//    func browse<R: BrowseResults, Q: MBQuery>(
//        with id: String,
//        query: Q
//    ) async throws -> R {
//
//        let encoder = JSONEncoder()
//        let data = try encoder.encode(query.query)
//        let encodedQuery = String(data: data, encoding: .utf8)?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
//        
////        let incQuery = inc.joined(separator: "+")
//        let browseEndpoint = "\(R.Result.endpoint)?\(R.Browse.endpoint)=\(id)"//&inc=\(encodedQuery)"
//        return try await fetch(endpoint: browseEndpoint)
//    }
//    
    
//    func browse<Browse: MBEntity, Returns: MBEntity, Query: MBQuery>(
//        with id: String,
//        query: Query
//    ) async throws -> MBResults {
//
//        let encoder = JSONEncoder()
//        let data = try encoder.encode(query.query)
//        let encodedQuery = String(data: data, encoding: .utf8)?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
//        
////        let incQuery = inc.joined(separator: "+")
//        let browseEndpoint = "\(resultType.endpoint)?\(browseType.endpoint)=\(id)"//&inc=\(encodedQuery)"
//        return try await fetch(endpoint: browseEndpoint)
//    }
    
    
//    func browse<T: Decodable, Q: Encodable>(endpoint: String, query: MBSearchQuery<Q>) async throws -> T {
//        let encoder = JSONEncoder()
//        let data = try encoder.encode(query.query)
//        let encodedQuery = String(data: data, encoding: .utf8)?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
//        let searchEndpoint = "\(endpoint)?\(encodedQuery)"
//        return try await fetch(endpoint: searchEndpoint)
//    }


    
//    func browse<T: MBSearchResult, Q: Encodable>(endpoint: String, query: MBSearchQuery<Q>) async throws -> T {
//        let encoder = JSONEncoder()
//        let data = try encoder.encode(query.query)
//        let encodedQuery = String(data: data, encoding: .utf8)?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
//        let browseEndpoint = "\(endpoint)/browse?query=\(encodedQuery)"
//        return try await fetch(endpoint: browseEndpoint)
//    }

    
    /// Browse areas
    ///
    /// - Parameter query: Query parameters for browsing areas.
    /// - Throws: An error if the network request fails.
    /// - Returns: An `MBBrowseAreasResult` representing the browse result for areas.
//    func browseArea<R: MBEntity>(for entity: R.Type, query: MBAreaQuery) async throws -> MBResult<R> {
//        let endpoint = "area/"
//        return try await browse(endpoint: endpoint, query: query)
//    }
    
    /// Browse artists
    ///
    /// - Parameter query: Query parameters for browsing artists.
    /// - Throws: An error if the network request fails.
    /// - Returns: An `MBBrowseArtistsResult` representing the browse result for artists.
//    func browseArtist<R:MBEntity>(for entity: R.Type, id: String, query: MBArtistQuery<R>) async throws -> MBResult<R> {
////        let endpoint = "artist/"
////        return try await browse(endpoint: endpoint, query: query)
//        return try await browse(id: id, query: query)
////        return try await browse(resultType: R.endpoint, browseType: MBArtist.endpoint, browseID: id, query: query)
//    }
    
    /// Browse collections
    ///
    /// - Parameter query: Query parameters for browsing collections.
    /// - Throws: An error if the network request fails.
    /// - Returns: An `MBBrowseCollectionsResult` representing the browse result for collections.
//    func browseCollections(query: MBCollectionQuery) async throws -> MBCollectionResult {
//        let endpoint = "collection/"
//        return try await browse(endpoint: endpoint, query: query)
//    }
    
    /// Browse events
    ///
    /// - Parameter query: Query parameters for browsing events.
    /// - Throws: An error if the network request fails.
    /// - Returns: An `MBBrowseEventsResult` representing the browse result for events.
//    func browseEvents(query: MBBrowseEventQuery) async throws -> MBEventResult {
//        let endpoint = "event/"
//        return try await browse(endpoint: endpoint, query: query)
//    }
    
    /// Browse instruments
    ///
    /// - Parameter query: Query parameters for browsing instruments.
    /// - Throws: An error if the network request fails.
    /// - Returns: An `MBBrowseInstrumentsResult` representing the browse result for instruments.
//    func browseInstruments(query: MBInstrumentQuery) async throws -> MBInstrumentResult {
//        let endpoint = "instrument/"
//        return try await browse(endpoint: endpoint, query: query)
//    }
    
    /// Browse labels
    ///
    /// - Parameter query: Query parameters for browsing labels.
    /// - Throws: An error if the network request fails.
    /// - Returns: An `MBBrowseLabelsResult` representing the browse result for labels.
//    func browseLabels(query: MBLabelQuery) async throws -> MBLabelResult {
//        let endpoint = "label/"
//        return try await browse(endpoint: endpoint, query: query)
//    }
    
    /// Browse places
    ///
    /// - Parameter query: Query parameters for browsing places.
    /// - Throws: An error if the network request fails.
    /// - Returns: An `MBBrowsePlacesResult` representing the browse result for places.
//    func browsePlaces(query: MBPlacesQuery) async throws -> MBPlacesResult {
//        let endpoint = "place/"
//        return try await browse(endpoint: endpoint, query: query)
//    }
    
    /// Browse recordings
    ///
    /// - Parameter query: Query parameters for browsing recordings.
    /// - Throws: An error if the network request fails.
    /// - Returns: An `MBBrowseRecordingsResult` representing the browse result for recordings.
//    func browseRecordings(query: MBRecordingsQuery) async throws -> MBRecordingsResult {
//        let endpoint = "recording/"
//        return try await browse(endpoint: endpoint, query: query)
//    }
    
    /// Browse releases
    ///
    /// - Parameter query: Query parameters for browsing releases.
    /// - Throws: An error if the network request fails.
    /// - Returns: An `MBBrowseReleasesResult` representing the browse result for releases.
//    func browseReleases(query: MBReleaseQuery) async throws -> MBReleaseResult {
//        let endpoint = "release/"
//        return try await browse(endpoint: endpoint, query: query)
//    }
//    
    /// Browse release groups
    ///
    /// - Parameter query: Query parameters for browsing release groups.
    /// - Throws: An error if the network request fails.
    /// - Returns: An `MBBrowseReleaseGroupsResult` representing the browse result for release groups.
//    func browseReleaseGroups(query: MBReleaseGroupQuery) async throws -> MBReleaseGroupResult {
//        let endpoint = "release-group/"
//        return try await browse(endpoint: endpoint, query: query)
//    }
    
    /// Browse works
    ///
    /// - Parameter query: Query parameters for browsing works.
    /// - Throws: An error if the network request fails.
    /// - Returns: An `MBBrowseWorksResult` representing the browse result for works.
//    func browseWorks(query: MBWorkQuery) async throws -> MBWorksResult {
//        let endpoint = "work/"
//        return try await browse(endpoint: endpoint, query: query)
//    }
    
    /// Browse URLs
    ///
    /// - Parameter query: Query parameters for browsing URLs.
    /// - Throws: An error if the network request fails.
    /// - Returns: An `MBUrl` representing the browse result for URLs.
//    func browseUrls(query: MBUrlQuery) async throws -> MBUrlResult {
//        let endpoint = "url/"
//        return try await browse(endpoint: endpoint, query: query)
//    }
//    
    
    
    /// Browse series
    ///
    /// - Parameter query: Query parameters for browsing series.
    /// - Throws: An error if the network request fails.
    /// - Returns: An `MBBrowseSeriesResult` representing the browse result for series.
//    func browseSeries<Q: MBSearchQuery>(query: Q) async throws -> MBBrowseSeriesResult {
//        let endpoint = "series/"
//        return try await browse(endpoint: endpoint, query: query)
//    }
}
