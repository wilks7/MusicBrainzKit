

/// The model for a Recording object.
public struct MBRecording: MBEntity {
    /// The ID of the recording.
    public let id: String
    
    /// The title of the recording.
    public let title: String
    
    /// The disambiguation information of the recording.
    public let disambiguation: String?
    
    /// The length of the recording.
    public let length: Int
    
    /// The video of the recording.
    public let video: Bool
    
    /// The artist credits of the recording.
    public let artistCredits: [MBArtistCredit]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case disambiguation
        case length
        case video
        case artistCredits = "artist-credit"
    }
}
