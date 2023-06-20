/// The model for a ReleaseEvent object.
public struct MBReleaseEvent: Decodable {
    /// The area associated with the release event.
    public let area: MBArea?
    
    /// The date of the release event.
    public let date: String?
}
