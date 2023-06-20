/**
 Represents a place entity.
 */
public struct MBPlace: MBEntity {
    /// The unique identifier of the place.
    public let id: String
    
    /// The name of the place.
    public let name: String
    
    public static let endpoint = "place"

}
extension MBPlace {
    public struct Search: MBSearch {
        
        public struct Results: MBResults {
            public let created: String?
            public let count: Int?
            public let offset: Int?
            public let places: [MBPlace]
            public var results: [MBPlace] { places }
        }
        
        public struct Query: MBQuery {
            public var name: String?
            public var area: String?
            public var country: String?
            public var type: String?
            public typealias Include = RelationsIncludes
        }
        
    }
}
