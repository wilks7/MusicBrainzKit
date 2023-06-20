
import Foundation

public protocol MBResults: Decodable {
    associatedtype Result:Decodable
    var results: [Result] {get}
}

public protocol MBSearch {
    associatedtype Results: MBResults
    associatedtype Query: MBQuery
}



/// The model for a Match object.
public protocol MBMatch: Decodable {
    /// The score of the match.
    var score: Double? {get} // ToDo: Provide feedback: should be a Double
}

