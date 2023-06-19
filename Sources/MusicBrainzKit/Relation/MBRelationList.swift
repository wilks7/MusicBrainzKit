/**
 Represents a list of relations.
 */
public struct MBRelationList: Decodable {
    /// The relations in the list.
    public let relations: [MBRelation]
}
