/// The model for a Relation object.
public struct MBRelation: Decodable {
    /// The attribute IDs of the relation.
    public let attributeIds: [String: String]?
    
    /// The direction of the relation.
    public let direction: RelationDirection
    
    /// The target credit of the relation.
    public let targetCredit: String
    
    /// The end of the relation.
//    public let end: Any?
    
    /// The source credit of the relation.
    public let sourceCredit: String
    
    /// Indicates whether the relation has ended.
    public let ended: Bool
    
//    /// The attribute values of the relation.
//    public let attributeValues: Any?
//    
//    /// The attributes of the relation.
//    public let attributes: [Any]?
    
    /// The type of the relation.
    public let type: String
    
//    /// The begin of the relation.
//    public let begin: Any?
    
    /// The target type of the relation.
    public let targetType: String?
    
    /// The type ID of the relation.
    public let typeId: String
    
    /// The URL associated with the relation.
    public let url: MBUrl?
    
    enum CodingKeys: String, CodingKey {
        case attributeIds = "attribute-ids"
        case direction
        case targetCredit = "target-credit"
//        case end
        case sourceCredit = "source-credit"
        case ended
//        case attributeValues = "attribute-values"
//        case attributes
        case type
//        case begin
        case targetType = "target-type"
        case typeId = "type-id"
        case url
    }
    
    /// The direction of the relation.
    public enum RelationDirection: String, Decodable {
        case forward
        case backward
        case both
    }
}
