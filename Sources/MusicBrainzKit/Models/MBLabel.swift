/**
 Represents a label entity.
 */
public struct MBLabel: Decodable, MBEntity {
    /// The unique identifier of the label.
    public let id: String
    
    /// The name of the label.
    public let name: String
    
    public static let endpoint = "label"
}

extension MBLabel {
    public struct Search: MBSearch {
        
        public struct Results: MBResults {
            public let created: String?
            public let count: Int?
            public let offset: Int?
            public let labels: [MBLabel]
            public var results: [MBLabel] { labels }
        }
        
        public struct Query: MBQuery {
            public var name: String?
            public typealias Include = RelationsIncludes
        }
        
    }
}
