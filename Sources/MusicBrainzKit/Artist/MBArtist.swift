/// The model for an Artist object.
public struct MBArtist: Decodable, MBEntity, MBMatch {
    /// The ID of the artist.
    public let id: String
    
    /// The name of the artist.
    public let name: String
//    
    /// The disambiguation information of the artist.
    public let disambiguation: String?
    
    /// The sort name of the artist.
    public let sortName: String?
    
    /// The type ID of the artist.
    public let typeId: String?
    
    /// The gender ID of the artist.
    public let genderId: String?
    
    /// The life span of the artist.
//    public let lifeSpan: MBPeriod?
    
    /// The country of the artist.
    public let country: String?
    
    /// The International Performer Index (IPI) codes associated with the artist. ToDo: Specify the type of 'ipis'.
    public let ipis: [String]? // ToDo
    
    /// The International Standard Name Identifier (ISNI) codes associated with the artist.
    public let isnis: [String]?
    
    /// The aliases of the artist.
//    public let aliases: [MBAlias]?
    
    /// The gender of the artist.
    public let gender: String?
    
    /// The type of the artist.
    public let type: String?
//
//    /// The area of the artist.
//    public let area: MBArea?
//    
////    /// The begin area of the artist.
//    public let beginArea: MBArea?
//    
//    /// The end area of the artist.
//    public let endArea: MBArea?
    
//    /// The relations of the artist.
//    public let relations: [MBRelation]?
//    
//    /// The releases associated with the artist. Only defined if 'releases' are included.
//    public let releases: [MBRelease]?
//    
//    /// The release groups associated with the artist.
//    public let releaseGroups: [MBReleaseGroup]?
    
    public let score: Double?

    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case disambiguation
        case sortName = "sort-name"
        case typeId = "type-id"
        case genderId = "gender-id"
//        case lifeSpan = "life-span"
        case country
        case ipis
        case isnis
//        case aliases
        case gender
        case type
//        case area
//        case beginArea = "begin-area"
//        case endArea = "end-area"
//        case relations
//        case releases
//        case releaseGroups = "release-groups"
        case score
    }
}

#warning("fix properties")
