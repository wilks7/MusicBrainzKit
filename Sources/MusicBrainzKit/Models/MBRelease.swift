/// The model for a Release object.
public struct MBRelease: Decodable, MBEntity, MBMatch {
    /// The ID of the release.
    public let id: String
    
    /// The title of the release.
    public let title: String
    
    /// The text representation of the release.
    public let textRepresentation: MBTextRepresentation
    
    /// The disambiguation information of the release.
    public let disambiguation: String
    
    /// The Amazon Standard Identification Number (ASIN) of the release.
    public let asin: String
    
    /// The status ID of the release.
    public let statusId: String
    
    /// The packaging of the release.
    public let packaging: String?
    
    /// The status of the release.
    public let status: String
    
    /// The packaging ID of the release.
    public let packagingId: String?
    
    /// The release events of the release.
    public let releaseEvents: [MBReleaseEvent]?
    
    /// The date of the release.
    public let date: String
    
    /// The media associated with the release.
    public let media: [MBMedium]
    
    /// The cover art archive of the release.
    public let coverArtArchive: MBCoverArtArchive
    
    /// The country of the release.
    public let country: String
    
    /// The quality of the release.
    public let quality: String // type ReleaseQuality doesn't work here
    
    /// The barcode of the release.
    public let barcode: String
    
    /// The relations of the release.
    public let relations: [MBRelation]?
    
    /// The artist credits of the release. Include 'artist-credits'.
    public let artistCredits: [MBArtistCredit]?
    
    /// The release group of the release. Include 'release-groups'.
    public let releaseGroup: MBReleaseGroup?
    
    public let score: Double?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case textRepresentation = "text-representation"
        case disambiguation
        case asin
        case statusId = "status-id"
        case packaging
        case status
        case packagingId = "packaging-id"
        case releaseEvents = "release-events"
        case date
        case media
        case coverArtArchive = "cover-art-archive"
        case country
        case quality
        case barcode
        case relations
        case artistCredits = "artist-credit"
        case releaseGroup = "release-group"
        case score
    }
    
    public static let endpoint = "release"

}

extension MBRelease {
    public struct Search: MBSearch {
        
        public struct Results: MBResults {
            public let created: String?
            public let count: Int?
            public let offset: Int?
            public let releases: [MBRelease]
            public var results: [MBRelease] { releases }
        }
        
        public struct Query: MBQuery {
            public var name: String?
            public typealias Include = RelationsIncludes
        }
        
    }
}
