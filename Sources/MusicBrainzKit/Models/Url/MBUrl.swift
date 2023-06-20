/// The model for a Url object.
public struct MBUrl: Decodable, MBEntity, MBMatch {
    
    public let id: String = ""
    
    /// The resource of the URL.
    public let resource: String
    
    /// The relation type IDs of the URL.
    public let relationTypeIds: [String]?
    
    /// The target type of the URL.
    public let targetType: String?
    
    /// The type of the URL.
    public let type: String
    
    /// The URL itself.
    public let value: String
    
    public let score: Double?
    
    public static let endpoint = "url"

}

extension MBUrl {
    public struct Search: MBSearch {
        
        public struct Results: MBResults {
            public let created: String?
            public let count: Int?
            public let offset: Int?
            public let links: [MBUrl]
            public var results: [MBUrl] { links }
        }
        
        public struct Query: MBQuery {
            public var url: String?
            public var resource: String?
            public typealias Include = RelationsIncludes
        }
        
    }
}
