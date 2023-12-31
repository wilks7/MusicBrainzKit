
fileprivate let endpoint = "area"

/// The model for an Area object.
public struct MBArea: MBEntity, MBMatch {
    /// The ID of the area.
    public let id: String
    
    /// The ISO 3166-1 codes associated with the area.
    public let iso31661Codes: [String]
    
    /// The name of the area.
    public let name: String
    
    /// The sort name of the area.
    public let sortName: String
    
    /// The disambiguation information of the area.
    public let disambiguation: String
    
    public let score: Double?
    
    enum CodingKeys: String, CodingKey {
        case id
        case iso31661Codes = "iso-3166-1-codes"
        case name
        case sortName = "sort-name"
        case disambiguation
        case score
    }
    
    static public var endpoint = "area"
    
    public typealias Search = MBAreaSearch
}

public struct MBAreaSearch: MBSearch {
        
    public struct Results: MBResults {
        public let created: String?
        public let count: Int?
        public let offset: Int?
        public let areas: [MBArea]
        public var results: [MBArea] { areas }
    }
    
    public struct Query: MBQuery {
        public var area: String?
        public var country: String?
        public var type: String?
        
        public typealias Include = RelationsIncludes

    }
}
