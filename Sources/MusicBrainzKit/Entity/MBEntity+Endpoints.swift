
/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
Entity Endpoints for the MusicBrainz API.
*/

import Foundation


public extension MusicBrainzClient {
    
    
    /// Fetches an artist for a given Musicbrainz MBID
    ///
    /// - Parameters:
    ///   - artistId: An Artist MBID, e.g. "0bfba3d3-6a04-4779-bb0a-df07df5b0558"
    ///   - inc: Sub-queries to include
    /// - Returns: An `MBArtist` instance representing the artist associated with the provided MBID.
    func lookupEntity<E:MBEntity>(id: String, inc: [String] = []) async throws -> E {
        logger.debug("Fetching Artist")
        let parameters = inc.map { $0 }.joined(separator: "+")
        let type = String(describing: E.self)
        let endpoint: String
        if parameters.isEmpty {
            endpoint = "\(type)/\(id)?inc=\(parameters)"
        } else {
            endpoint = "\(type)/\(id)"
        }
        return try await fetch(endpoint: endpoint)
    }
    
    
}
