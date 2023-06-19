/// The model for a Collection object.
public struct MBCollection: MBEntity {
    /// The ID of the collection.
    public let id: String
    
    /// The type of the collection.
    public let type: String
    
    /// The name of the collection.
    public let name: String
    
    /// The type ID of the collection.
    public let typeId: String
    
    /// The recording count in the collection.
    public let recordingCount: Int
    
    /// The editor of the collection.
    public let editor: String
    
    /// The entity type of the collection.
    public let entityType: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case type
        case name
        case typeId = "type-id"
        case recordingCount = "recording-count"
        case editor
        case entityType = "entity-type"
    }
}
