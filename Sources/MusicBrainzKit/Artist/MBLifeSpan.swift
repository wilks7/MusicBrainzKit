
import Foundation
import DrillURL

/// The life span of an event (begin and end dates).
public struct MBLifeSpan: Decodable {
        /// The event's begin date.
    public let begin: Date?
    
    /// The event's end date.
    public let end: Date?
}

/// The life span of an event (begin and end dates).
public struct MBEventLifeSpan: DecodableDate {
    
    static public let dateFormat = "yyyy-mm-dd"
    
        /// The event's begin date.
    public let begin: Date?
    
    /// The event's end date.
    public let end: Date?
}
