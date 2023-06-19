/// The model for a Url object.
public struct MBUrl: Decodable, MBMatch {
    /// The resource of the URL.
    public let resource: String
    
    /// The relation type IDs of the URL.
    public let relationTypeIds: [String]?
    
    /// The target type of the URL.
    public let targetType: String?
    
    /// The type of the URL.
    public let type: String
    
    /// The URL itself.
    public let value: String
    
    public let score: Double?
}
