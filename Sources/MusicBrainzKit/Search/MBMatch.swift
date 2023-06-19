/// The model for a Match object.
public protocol MBMatch: Decodable {
    /// The score of the match.
    var score: Double? {get} // ToDo: Provide feedback: should be a Double
}
