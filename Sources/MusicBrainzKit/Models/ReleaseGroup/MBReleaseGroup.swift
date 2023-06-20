/// The model for a ReleaseGroup object.
public struct MBReleaseGroup: Decodable, MBEntity, MBMatch {
    /// The ID of the release group.
    public let id: String
    
    /// The count of the release group.
    public let count: Int
    
    /// The disambiguation information of the release group.
    public let disambiguation: String?
    
    /// The title of the release group.
    public let title: String
    
    /// The secondary types of the release group.
    public let secondaryTypes: [String]
    
    /// The first release date of the release group.
    public let firstReleaseDate: String
    
    /// The primary type of the release group.
    public let primaryType: String
    
    /// The primary type ID of the release group.
    public let primaryTypeId: String?
    
    /// The secondary type IDs of the release group.
    public let secondaryTypeIds: [String]?
    
    /// The sort name of the release group.
    public let sortName: String
    
    /// The artist credits of the release group.
    public let artistCredits: [MBArtistCredit]
    
    /// The releases of the release group. Include 'releases'.
    public let releases: [MBRelease]?
    
    public let score: Double?
    
    enum CodingKeys: String, CodingKey {
        case id
        case count
        case disambiguation
        case title
        case secondaryTypes = "secondary-types"
        case firstReleaseDate = "first-release-date"
        case primaryType = "primary-type"
        case primaryTypeId = "primary-type-id"
        case secondaryTypeIds = "secondary-type-ids"
        case sortName = "sort-name"
        case artistCredits = "artist-credit"
        case releases
        case score
    }
    
    public static let endpoint = "release-group"

}

extension MBReleaseGroup {
    public struct Search: MBSearch {
        
        public struct Results: MBResults {
            public let created: String?
            public let count: Int?
            public let offset: Int?
            public let releaseGroups: [MBReleaseGroup]
            public var results: [MBReleaseGroup] { releaseGroups }
            
            public enum CodingKeys: String, CodingKey {
                case created, count, offset
                case releaseGroups = "release-group"
            }
        }
        
        public struct Query: MBQuery {
            public var release: String?
            public var artist: String?
            public var type: String?
            public typealias Include = RelationsIncludes
        }
        
    }
}
