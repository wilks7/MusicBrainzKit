/// The model for a Period object.
public struct MBPeriod: Decodable {
    /// The beginning date of the period.
    public let begin: String
    
    /// Indicates whether the period has ended.
    public let ended: Bool?
    
    /// The ending date of the period.
    public let end: String?
}
