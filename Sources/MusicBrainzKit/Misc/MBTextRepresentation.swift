/// The model for a TextRepresentation object.
public struct MBTextRepresentation: Decodable {
    /// The language of the text representation.
    public let language: String
    
    /// The script of the text representation.
    public let script: String
}
