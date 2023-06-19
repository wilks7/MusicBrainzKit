
/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
Lookup Endpoints for the MusicBrainz API.
*/

import Foundation

public extension MusicBrainzClient {
    
    
    private func fetch<T:Decodable>(endpoint: String, inc: [String]) async throws -> T {
        let parameters = inc.map { $0 }.joined(separator: "+")
        let endpoint = "\(endpoint)?inc=\(parameters)"
        return try await fetch(endpoint: endpoint)
    }
    
    /// Lookup an event for a given Event MBID with specified includes.
    ///
    /// - Parameters:
    ///   - eventId: An Event MBID.
    ///   - eventIncludes: List of sub-queries to enable.
    /// - Returns: A `Promise` that resolves to the specified event.
    func lookupEvent(eventId: String, inc: [String] = []) async throws -> MBEvent {
        logger.debug("Fetching Event")
        let endpoint = "event/\(eventId)"
        return try await fetch(endpoint: endpoint, inc: inc)
    }

    
    /// Fetches an artist for a given Musicbrainz MBID
    ///
    /// - Parameters:
    ///   - artistId: An Artist MBID, e.g. "0bfba3d3-6a04-4779-bb0a-df07df5b0558"
    ///   - inc: Sub-queries to include
    /// - Returns: An `MBArtist` instance representing the artist associated with the provided MBID.
    func lookupArtist(artistId: String, inc: [String] = []) async throws -> MBArtist {
        logger.debug("Fetching Artist")
        let endpoint = "artist/\(artistId)"
        return try await fetch(endpoint: endpoint, inc: inc)
    }
    
    /// Lookup a place for a given MusicBrainz MBID.
    ///
    /// - Parameters:
    ///   - placeId: A Place MBID, e.g. "0bfba3d3-6a04-4779-bb0a-df07df5b0558".
    ///   - inc: Sub-queries to include.
    /// - Returns: An `MBPlace` instance representing the place associated with the provided MBID.
    func lookupPlace(placeId: String, inc: [String] = []) async throws -> MBPlace {
        logger.debug("Fetching Place")
        let endpoint = "place/\(placeId)"
        return try await fetch(endpoint: endpoint, inc: inc)
    }

    
    /// Lookup a collection for a given MusicBrainz MBID.
    ///
    /// - Parameters:
    ///   - collectionId: A Collection MBID.
    ///   - inc: Sub-queries to include.
    /// - Returns: An `MBCollection` instance representing the collection associated with the provided MBID.
    func lookupCollection(collectionId: String, inc: [String] = []) async throws -> MBCollection {
        logger.debug("Fetching Collection")
        let endpoint = "collection/\(collectionId)"
        return try await fetch(endpoint: endpoint, inc: inc)
    }

    
    /// Lookup an instrument for a given MusicBrainz MBID.
    ///
    /// - Parameters:
    ///   - instrumentId: An Instrument MBID.
    ///   - inc: Sub-queries to include.
    /// - Returns: An `MBInstrument` instance representing the instrument associated with the provided MBID.
    func lookupInstrument(instrumentId: String, inc: [String] = []) async throws -> MBInstrument {
        logger.debug("Fetching Instrument")
        let endpoint = "instrument/\(instrumentId)"
        return try await fetch(endpoint: endpoint, inc: inc)
    }

    /// Lookup a label for a given MusicBrainz MBID.
    ///
    /// - Parameters:
    ///   - labelId: A Label MBID.
    ///   - inc: Sub-queries to include.
    /// - Returns: An `MBLabel` instance representing the label associated with the provided MBID.
    func lookupLabel(labelId: String, inc: [String] = []) async throws -> MBLabel {
        logger.debug("Fetching Label")
        let endpoint = "label/\(labelId)"
        return try await fetch(endpoint: endpoint, inc: inc)
    }

    /// Lookup a release for a given MusicBrainz MBID.
    ///
    /// - Parameters:
    ///   - releaseId: A Release MBID.
    ///   - inc: Sub-queries to include.
    /// - Returns: An `MBRelease` instance representing the release associated with the provided MBID.
    func lookupRelease(releaseId: String, inc: [String] = []) async throws -> MBRelease {
        logger.debug("Fetching Release")
        let endpoint = "release/\(releaseId)"
        return try await fetch(endpoint: endpoint, inc: inc)
    }

    
    /// Lookup a release group for a given MusicBrainz MBID.
    ///
    /// - Parameters:
    ///   - releaseGroupId: A Release-group MBID.
    ///   - inc: Sub-queries to include.
    /// - Returns: An `MBReleaseGroup` instance representing the release group associated with the provided MBID.
    func lookupReleaseGroup(releaseGroupId: String, inc: [String] = []) async throws -> MBReleaseGroup {
        logger.debug("Fetching Release Group")
        let endpoint = "release-group/\(releaseGroupId)"
        return try await fetch(endpoint: endpoint, inc: inc)
    }

    
    /// Lookup a recording for a given MusicBrainz MBID.
    ///
    /// - Parameters:
    ///   - recordingId: A Recording MBID.
    ///   - inc: Sub-queries to include.
    /// - Returns: An `MBRecording` instance representing the recording associated with the provided MBID.
    func lookupRecording(recordingId: String, inc: [String] = []) async throws -> MBRecording {
        logger.debug("Fetching Recording")
        let endpoint = "recording/\(recordingId)"
        return try await fetch(endpoint: endpoint, inc: inc)
    }

    
    /// Lookup a work for a given MusicBrainz MBID.
    ///
    /// - Parameters:
    ///   - workId: A Work MBID.
    ///   - inc: Sub-queries to include.
    /// - Returns: An `MBWork` instance representing the work associated with the provided MBID.
    func lookupWork(workId: String, inc: [String] = []) async throws -> MBWork {
        logger.debug("Fetching Work")
        let endpoint = "work/\(workId)"
        return try await fetch(endpoint: endpoint, inc: inc)
    }

    
    /// Lookup a URL for a given MusicBrainz MBID.
    ///
    /// - Parameters:
    ///   - urlId: A URL MBID.
    ///   - inc: Sub-queries to include.
    /// - Returns: An `MBURL` instance representing the URL associated with the provided MBID.
    func lookupURL(urlId: String, inc: [String] = []) async throws -> MBUrl {
        logger.debug("Fetching URL")
        let endpoint = "url/\(urlId)"
        return try await fetch(endpoint: endpoint, inc: inc)
    }


    
}

