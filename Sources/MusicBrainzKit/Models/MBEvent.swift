/// The model for an Event object.
public struct MBEvent: MBEntity {
    /// The ID of the event.
    public let id: String
    
    /// Indicates whether the event is cancelled.
    public let cancelled: Bool?
    
    /// The type of the event.
    public let type: String?
    
    /// The life span of the event.
    public let lifeSpan: MBPeriod?
    
    /// The disambiguation information of the event.
    public let disambiguation: String?
    
    /// The type ID of the event.
    public let typeId: String?
    
    /// The time of the event.
    public let time: String?
    
    /// The setlist of the event.
    public let setlist: String?
    
    /// The name of the event.
    public let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case cancelled
        case type
        case lifeSpan = "life-span"
        case disambiguation
        case typeId = "type-id"
        case time
        case setlist
        case name
    }
    
    static public let endpoint = "event"

}

extension MBEvent {
    public struct Search: MBSearch {
        
        public struct Results: MBResults {
            public let created: String?
            public let count: Int?
            public let offset: Int?
            public let events: [MBEvent]
            public var results: [MBEvent] { events }
        }
        
        public struct Query: MBQuery {
            public var artistId: String?
            public var artist: String?
            public typealias Include = RelationsIncludes
        }
        
    }
}
