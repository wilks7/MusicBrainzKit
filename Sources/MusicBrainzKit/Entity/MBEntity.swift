/// Protocol representing an entity with an ID.
public protocol MBEntity: Decodable {
    /// The ID of the entity.
    var id: String { get }
}
