/// The model for a ReleaseGroupList object.
public struct MBReleaseGroupList: Decodable, MBSearchResult {
    public var created: String
    
    public var count: Int
    
    public var offset: Int
    
    /// The release groups in the release group list.
    public let releaseGroups: [MBReleaseGroupMatch]
}
