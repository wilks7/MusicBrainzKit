/// The model for a Medium object.
public struct MBMedium: Decodable {
    /// The title of the medium.
    public let title: String
    
    /// The format of the medium.
    public let format: String?
    
    /// The format ID of the medium.
    public let formatId: String
    
    /// The tracks of the medium.
    public let tracks: [MBTrack]
    
    /// The track count of the medium.
    public let trackCount: Int
    
    /// The track offset of the medium.
    public let trackOffset: Int
    
    /// The position of the medium.
    public let position: Int
}
