public extension MusicBrainzClient {
    /// Searches for events using the MusicBrainz API.
    ///
    /// - Parameters:
    ///   - alias: (Part of) any alias attached to the event.
    ///   - aid: The MBID of an area related to the event.
    ///   - area: (Part of) the name of an area related to the event.
    ///   - arid: The MBID of an artist related to the event.
    ///   - artist: (Part of) the name of an artist related to the event.
    ///   - begin: The event's begin date (e.g., "1980-01-22").
    ///   - comment: (Part of) the event's disambiguation comment.
    ///   - end: The event's end date (e.g., "1980-01-22").
    ///   - ended: A boolean flag (true/false) indicating whether or not the event has an end date set.
    ///   - eid: The MBID of the event.
    ///   - event: (Part of) the event's name.
    ///   - eventaccent: (Part of) the event's name (with the specified diacritics).
    ///   - pid: The MBID of a place related to the event.
    ///   - place: (Part of) the name of a place related to the event.
    ///   - tag: (Part of) a tag attached to the event.
    ///   - type: The event's type.
    ///
    /// - Throws: An error if the network request fails.
    /// - Returns: An array of `MBEvent` objects that match the search query.
    func searchEvent(
        alias: String? = nil,
        aid: String? = nil,
        area: String? = nil,
        arid: String? = nil,
        artist: String? = nil,
        begin: String? = nil,
        comment: String? = nil,
        end: String? = nil,
        ended: Bool? = nil,
        eid: String? = nil,
        event: String? = nil,
        eventaccent: String? = nil,
        pid: String? = nil,
        place: String? = nil,
        tag: String? = nil,
        type: String? = nil
    ) async throws -> [MBEvent] {
        logger.debug("Searching Events")
        var parameters: [String: String] = [:]
        if let alias = alias { parameters["alias"] = alias }
        if let aid = aid { parameters["aid"] = aid }
        if let area = area { parameters["area"] = area }
        if let arid = arid { parameters["arid"] = arid }
        if let artist = artist { parameters["artist"] = artist }
        if let begin = begin { parameters["begin"] = begin }
        if let comment = comment { parameters["comment"] = comment }
        if let end = end { parameters["end"] = end }
        if let ended = ended { parameters["ended"] = String(ended) }
        if let eid = eid { parameters["eid"] = eid }
        if let event = event { parameters["event"] = event }
        if let eventaccent = eventaccent { parameters["eventaccent"] = eventaccent }
        if let pid = pid { parameters["pid"] = pid }
        if let place = place { parameters["place"] = place }
        if let tag = tag { parameters["tag"] = tag }
        if let type = type { parameters["type"] = type }

        let queryString = parameters.map { "\($0.key)=\($0.value)" }.joined(separator: "&")
        let endpoint = "event/?query=\(queryString)"
        let result: MBEventResults = try await fetch(endpoint: endpoint)
        return result.events
    }

}

import DrillURL

/// The model for the results of an event search from the MusicBrainz API
public struct MBEventResults: DecodableDate {
    
    static public var dateFormat: String { MBEventLifeSpan.dateFormat }
    
    /// The count of events in the result set.
    public let count: Int
    
    /// The offset of the events in the result set.
    public let offset: Int
    
    /// The array of events.
    public let events: [MBEvent]
    
    public enum CodingKeys: String, CodingKey {
        case count, offset, events
    }
}
