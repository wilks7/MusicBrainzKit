/// The model for an Alias object.
public struct MBAlias: Decodable {
    /// The ID of the alias.
    public let id: String?
    
    /// The name of the alias.
    public let name: String?
    
    /// The sort name of the alias.
    public let sortName: String?
    
    /// Indicates whether the alias has ended.
    public let ended: Bool?
    
    /// The type ID of the alias.
    public let typeId: String?
    
    /// The type of the alias.
    public let type: String?
    
    /// The locale of the alias.
    public let locale: String?
    
    /// Indicates whether the alias is the primary alias.
    public let primary: String?
    
    /// The beginning date of the alias.
    public let begin: String?
    
    /// The ending date of the alias.
    public let end: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case sortName = "sort-name"
        case ended
        case typeId = "type-id"
        case type
        case locale
        case primary
        case begin
        case end
    }
}
