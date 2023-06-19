/// The model for a UrlList object.
public struct MBUrlList: Decodable, MBSearchResult {
    public var created: String
    
    public var count: Int
    
    public var offset: Int
    
    /// The URLs in the URL list.
    public let urls: [MBUrlMatch]
}

public typealias MBUrlMatch = MBUrl
