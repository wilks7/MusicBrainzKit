

/// The model for a Area object from the MusicBrainz API
///
public struct MBArea: Decodable, Equatable {
    /// Unique identifier.
    public let id: String
    
    /// The area's name, depending on the language valid values are e.g. "Müchen" or Munich
    public let name: String?
    
    /// The area's name, depending on the language valid values are e.g. "Müchen" or Munich
    public let sortName: String?
    
    public enum CodingKeys: String, CodingKey {
        case id, name
        case sortName = "sort-name"  // map JSON's "sort-name" to "sortName"
    }
}
