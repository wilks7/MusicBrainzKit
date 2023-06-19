/// The model for an ArtistList object.
public struct MBArtistList: MBSearchResult {
    public var created: String
    
    public var count: Int
    
    public var offset: Int
    
    /// The artists in the artist list.
    public let artists: [MBArtistMatch]
}
