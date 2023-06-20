/// The model for an ArtistCredit object.
public struct MBArtistCredit: Decodable {
    /// The artist associated with the credit.
    public let artist: MBArtist
    
    /// The joinphrase of the credit.
    public let joinphrase: String
    
    /// The name of the credit.
    public let name: String
}
