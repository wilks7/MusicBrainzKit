/// The model for an AreaList object.
public struct MBAreaList: MBSearchResult {
    public var created: String
    
    public var count: Int
    
    public var offset: Int
    
    /// The areas in the area list.
    public let areas: [MBAreaMatch]
}
