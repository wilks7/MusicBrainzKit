/// The model for an Event object from the MusicBrainz API
public struct MBEvent: Decodable {
    /// Unique identifier.
    public let id: String
    
    /// The event's type.
    public let type: String?
    
    /// The event's name.
    public let name: String?
    
    /// The event's score.
    public let score: Int?
//
    /// The event's life span (begin and end dates).
    public let lifeSpan: MBEventLifeSpan?
//    
    /// The event's time.
    public let time: String?
//    
    /// The relations associated with the event (e.g., artist, place).
    public var relations: [MBEventRelation]?
//
    public enum CodingKeys: String, CodingKey {
        case id, type, name
        case score
        case lifeSpan = "life-span"
        case time
        case relations
    }
}

/// The life span of an event (begin and end dates).
public struct MBEventLifeSpan: Decodable {
    /// The event's begin date.
    public let begin: String?
    
    /// The event's end date.
    public let end: String?
}

/// The relation associated with an event (e.g., artist, place).
public struct MBEventRelation: Decodable {
    /// The type of relation.
    public let type: String?
    
    /// The direction of the relation.
    public let direction: String?
    
    /// The artist associated with the event.
    public let artist: MBArtist?
    
    /// The place associated with the event.
    public let place: MBArea?
    
    public enum CodingKeys: String, CodingKey {
        case type, direction
        case artist
        case place
    }
}
