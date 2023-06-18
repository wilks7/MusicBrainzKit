
import Foundation

public struct MBLifespan: Decodable {
    public let ended: Bool?
    public var begin: Date?
    public var end: Date?
    
    enum CodingKeys: CodingKey {
        case ended
        case begin
        case end
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.ended = try container.decodeIfPresent(Bool.self, forKey: .ended)
        
        if let beginString = try? container.decode(String?.self, forKey: .begin),
            let date = decode(beginString) {
            self.begin = date
        } else {
            self.begin = nil
        }
        
        if let endString = try? container.decode(String?.self, forKey: .end),
            let date = decode(endString) {
            self.end = date
        } else {
            self.end = nil
        }

    }
    
    private func decode(_ string: String) -> Date? {
        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy"
//        return formatter.date(from: string)
        for style in DateFormats.allCases {
            formatter.dateFormat = style.rawValue
            if let date = formatter.date(from: string) {
                return date
            }
        }
        return nil
    }
    enum DateFormats: String, CaseIterable, Identifiable {
        var id: String {self.rawValue}
        case day = "yyyy-MM-dd"
        case month = "yyyy-MM"
        case year = "yyyy"
    }
    




}
//
//public struct MBArtistDateStrategy: DateValueStrategy {
//    public static var formatter: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM"
//        return formatter
//    }()
//    
//    public static var dayFormatter: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd"
//        return formatter
//    }()
//    
//    public static var yearFormatter: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy"
//        return formatter
//    }()
//    
//    public static func decode(_ value: String?) throws -> Date? {
//        guard let value else {return nil}
//        if let date = dayFormatter.date(from: value) {
//            return date
//        } else if let date = formatter.date(from: value) {
//            return date
//        } else if let date = yearFormatter.date(from: value) {
//            return date
//        }
//        else {
//            return nil
//        }
//    }
//    
//    public static func encode(_ date: Date?) -> String? {
//        guard let date else {return nil}
//        return formatter.string(from: date)
//    }
//}
