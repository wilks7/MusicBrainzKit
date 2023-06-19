/**
 Represents a track entity.
 */
//public struct MBTrack: Decodable {
//    /// The unique identifier of the track.
//    public let id: String
//    
//    /// The position of the track.
//    public let position: Int
//    
//    /// The recording associated with the track.
//    public let recording: MBRecording
//    
//    /// The track number.
//    public let number: String
//    
//    /// The length of the track.
//    public let length: Int
//    
//    /// The title of the track.
//    public let title: String
//    
//    /// The artist credits associated with the track.
//    public let artistCredits: [MBArtistCredit]?
//}

/// The model for a Track object.
public struct MBTrack: Decodable {
    /// The ID of the track.
    public let id: String
    
    /// The title of the track.
    public let title: String
    
    /// The length of the track.
    public let length: Int
    
    /// The recording of the track.
    public let recording: MBRecording
}
