public extension MusicBrainzClient {
    
    private func browse<T: Decodable, Q: MBSearchQuery>(endpoint: String, query: Q) async throws -> T {
        return try await fetch(endpoint: endpoint, query: query)
    }
    
    /// Browse areas
    ///
    /// - Parameter query: Query parameters for browsing areas.
    /// - Throws: An error if the network request fails.
    /// - Returns: An `MBBrowseAreasResult` representing the browse result for areas.
    func browseAreas<Q: MBSearchQuery>(query: Q) async throws -> MBBrowseAreasResult {
        let endpoint = "area/"
        return try await browse(endpoint: endpoint, query: query)
    }
    
    /// Browse artists
    ///
    /// - Parameter query: Query parameters for browsing artists.
    /// - Throws: An error if the network request fails.
    /// - Returns: An `MBBrowseArtistsResult` representing the browse result for artists.
    func browseArtists<Q: MBSearchQuery>(query: Q) async throws -> MBBrowseArtistsResult {
        let endpoint = "artist/"
        return try await browse(endpoint: endpoint, query: query)
    }
    
    /// Browse collections
    ///
    /// - Parameter query: Query parameters for browsing collections.
    /// - Throws: An error if the network request fails.
    /// - Returns: An `MBBrowseCollectionsResult` representing the browse result for collections.
    func browseCollections<Q: MBSearchQuery>(query: Q) async throws -> MBBrowseCollectionsResult {
        let endpoint = "collection/"
        return try await browse(endpoint: endpoint, query: query)
    }
    
    /// Browse events
    ///
    /// - Parameter query: Query parameters for browsing events.
    /// - Throws: An error if the network request fails.
    /// - Returns: An `MBBrowseEventsResult` representing the browse result for events.
    func browseEvents<Q: MBSearchQuery>(query: Q) async throws -> MBBrowseEventsResult {
        let endpoint = "event/"
        return try await browse(endpoint: endpoint, query: query)
    }
    
    /// Browse instruments
    ///
    /// - Parameter query: Query parameters for browsing instruments.
    /// - Throws: An error if the network request fails.
    /// - Returns: An `MBBrowseInstrumentsResult` representing the browse result for instruments.
    func browseInstruments<Q: MBSearchQuery>(query: Q) async throws -> MBBrowseInstrumentsResult {
        let endpoint = "instrument/"
        return try await browse(endpoint: endpoint, query: query)
    }
    
    /// Browse labels
    ///
    /// - Parameter query: Query parameters for browsing labels.
    /// - Throws: An error if the network request fails.
    /// - Returns: An `MBBrowseLabelsResult` representing the browse result for labels.
    func browseLabels<Q: MBSearchQuery>(query: Q) async throws -> MBBrowseLabelsResult {
        let endpoint = "label/"
        return try await browse(endpoint: endpoint, query: query)
    }
    
    /// Browse places
    ///
    /// - Parameter query: Query parameters for browsing places.
    /// - Throws: An error if the network request fails.
    /// - Returns: An `MBBrowsePlacesResult` representing the browse result for places.
    func browsePlaces<Q: MBSearchQuery>(query: Q) async throws -> MBBrowsePlacesResult {
        let endpoint = "place/"
        return try await browse(endpoint: endpoint, query: query)
    }
    
    /// Browse recordings
    ///
    /// - Parameter query: Query parameters for browsing recordings.
    /// - Throws: An error if the network request fails.
    /// - Returns: An `MBBrowseRecordingsResult` representing the browse result for recordings.
    func browseRecordings<Q: MBSearchQuery>(query: Q) async throws -> MBBrowseRecordingsResult {
        let endpoint = "recording/"
        return try await browse(endpoint: endpoint, query: query)
    }
    
    /// Browse releases
    ///
    /// - Parameter query: Query parameters for browsing releases.
    /// - Throws: An error if the network request fails.
    /// - Returns: An `MBBrowseReleasesResult` representing the browse result for releases.
    func browseReleases<Q: MBSearchQuery>(query: Q) async throws -> MBBrowseReleasesResult {
        let endpoint = "release/"
        return try await browse(endpoint: endpoint, query: query)
    }
    
    /// Browse release groups
    ///
    /// - Parameter query: Query parameters for browsing release groups.
    /// - Throws: An error if the network request fails.
    /// - Returns: An `MBBrowseReleaseGroupsResult` representing the browse result for release groups.
    func browseReleaseGroups<Q: MBSearchQuery>(query: Q) async throws -> MBBrowseReleaseGroupsResult {
        let endpoint = "release-group/"
        return try await browse(endpoint: endpoint, query: query)
    }
    
    /// Browse series
    ///
    /// - Parameter query: Query parameters for browsing series.
    /// - Throws: An error if the network request fails.
    /// - Returns: An `MBBrowseSeriesResult` representing the browse result for series.
//    func browseSeries<Q: MBSearchQuery>(query: Q) async throws -> MBBrowseSeriesResult {
//        let endpoint = "series/"
//        return try await browse(endpoint: endpoint, query: query)
//    }
    
    /// Browse works
    ///
    /// - Parameter query: Query parameters for browsing works.
    /// - Throws: An error if the network request fails.
    /// - Returns: An `MBBrowseWorksResult` representing the browse result for works.
    func browseWorks<Q: MBSearchQuery>(query: Q) async throws -> MBBrowseWorksResult {
        let endpoint = "work/"
        return try await browse(endpoint: endpoint, query: query)
    }
    
    /// Browse URLs
    ///
    /// - Parameter query: Query parameters for browsing URLs.
    /// - Throws: An error if the network request fails.
    /// - Returns: An `MBUrl` representing the browse result for URLs.
    func browseUrls<Q: MBSearchQuery>(query: Q) async throws -> MBUrl {
        let endpoint = "url/"
        return try await browse(endpoint: endpoint, query: query)
    }
}
