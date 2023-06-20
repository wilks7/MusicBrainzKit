/// The model for a CoverArtArchive object.
public struct MBCoverArtArchive: Decodable {
    /// The count of the cover art archive.
    public let count: Int
    
    /// Indicates whether the front cover art exists.
    public let front: Bool
    
    /// Indicates whether the cover art is darkened.
    public let darkened: Bool
    
    /// Indicates whether the artwork is available.
    public let artwork: Bool
    
    /// Indicates whether the back cover art exists.
    public let back: Bool
}
