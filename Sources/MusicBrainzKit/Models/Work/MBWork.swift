/**
 Represents a work entity.
 */
public struct MBWork: MBEntity {
    /// The unique identifier of the work.
    public let id: String
    
    /// The title of the work.
    public let title: String
    
    public static let endpoint = "work"

}

extension MBWork {
    public struct Search: MBSearch {
        
        public struct Results: MBResults {
            public let created: String?
            public let count: Int?
            public let offset: Int?
            public let works: [MBWork]
            public var results: [MBWork] { works }
        }
        
        public struct Query: MBQuery {
            public var area: String?
            public var country: String?
            public var type: String?
            public typealias Include = RelationsIncludes
        }
        
    }
}
