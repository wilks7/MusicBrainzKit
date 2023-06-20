/// The model for an Instrument object.
public struct MBInstrument: MBEntity {
    /// The ID of the instrument.
    public let id: String
    
    /// The disambiguation information of the instrument.
    public let disambiguation: String
    
    /// The name of the instrument.
    public let name: String
    
    /// The type ID of the instrument.
    public let typeId: String
    
    /// The type of the instrument.
    public let type: String
    
    /// The description of the instrument.
    public let description: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case disambiguation
        case name
        case typeId = "type-id"
        case type
        case description
    }
    
    static public let endpoint = "instrument"

}

extension MBInstrument {
    public struct Search: MBSearch {
        
        public struct Results: MBResults {
            public let created: String?
            public let count: Int?
            public let offset: Int?
            public let instruments: [MBInstrument]
            public var results: [MBInstrument] { instruments }
        }
        
        public struct Query: MBQuery {
            public var name: String?
            public var artist: String?
            public typealias Include = RelationsIncludes
        }
        
    }
}
