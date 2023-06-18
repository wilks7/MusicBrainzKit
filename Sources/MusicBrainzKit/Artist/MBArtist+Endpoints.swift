
/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
Artist Endpoints for the MusicBrainz API.
*/

public extension MusicBrainzClient {
    
    
    /// Fetches an artist for a given Musicbrainz MBID
    ///
    /// - Parameter mbid: A Musicbrainz MBID, e.g. 0bfba3d3-6a04-4779-bb0a-df07df5b0558
    /// - Returns: A `MBArtist` instance representing the artist associated with the provided MBID.
    func getArtist(mbid: String) async throws -> MBArtist {
        logger.debug("Fetching Artist")
        let endpoint = "artist/\(mbid)?inc=aliases"
        return try await self.fetch(endpoint: endpoint)
    }
    
    
    /// Searches for an artist using the MusicBrainz API.
    ///
    /// - Parameters:
    ///   - alias: (Part of) any alias attached to the artist.
    ///   - primaryAlias: (Part of) any primary alias attached to the artist.
    ///   - area: (Part of) the name of the artist's main associated area.
    ///   - arid: The artist's MBID.
    ///   - artist: (Part of) the artist's name.
    ///   - artistaccent: (Part of) the artist's name (with the specified diacritics).
    ///   - begin: The artist's begin date (e.g. "1980-01-22").
    ///   - beginArea: (Part of) the name of the artist's begin area.
    ///   - comment: (Part of) the artist's disambiguation comment.
    ///   - country: The 2-letter code (ISO 3166-1 alpha-2) for the artist's main associated country.
    ///   - end: The artist's end date (e.g. "1980-01-22").
    ///   - endArea: (Part of) the name of the artist's end area.
    ///   - ended: A boolean flag (true/false) indicating whether or not the artist has ended (is dissolved/deceased).
    ///   - gender: The artist's gender (“male”, “female”, “other” or “not applicable”).
    ///   - ipi: An IPI code associated with the artist.
    ///   - isni: An ISNI code associated with the artist.
    ///   - sortname: (Part of) the artist's sort name.
    ///   - tag: (Part of) a tag attached to the artist.
    ///   - type: The artist's type (“person”, “group”, etc.).
    ///
    /// - Throws: An error if the network request fails.
    /// - Returns: An array of `MBArtist` objects that match the search query.
    func searchArtist(
        alias: String? = nil,
        primaryAlias: String? = nil,
        area: String? = nil,
        arid: String? = nil,
        artist: String? = nil,
        artistaccent: String? = nil,
        begin: String? = nil,
        beginArea: String? = nil,
        comment: String? = nil,
        country: String? = nil,
        end: String? = nil,
        endArea: String? = nil,
        ended: Bool? = nil,
        gender: String? = nil,
        ipi: String? = nil,
        isni: String? = nil,
        sortname: String? = nil,
        tag: String? = nil,
        type: String? = nil
    ) async throws -> [MBArtist] {
        logger.debug("Searching Artists")
        guard let artist else {
            throw APIError.message("Bad Parameters")
        }
        let escapedString = artist.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? artist
        let endpoint = "artist?query=artist:\(escapedString)&fmt=json"
        let result:MBArtistResults = try await fetch(endpoint: endpoint)
        return result.artists

    }
//    #warning("fix this ")
    
}




public struct MBArtistResults: Decodable {
    public let artists: [MBArtist]
}



