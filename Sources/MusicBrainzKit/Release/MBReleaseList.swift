/// The model for a ReleaseList object.
public struct MBReleaseList: Decodable, MBSearchResult {
    public var created: String
    
    public var count: Int
    
    public var offset: Int
    
    /// The releases in the release list.
    public let releases: [MBReleaseMatch]
}
