


public struct MBArtist: Decodable {
    public let id, name: String
    public let sortName, typeID: String?
    public let type, disambiguation: String?
    public let gender, genderID: String?
    public let country: String?
    public let area, beginArea, endArea: MBArea?
//    public let lifeSpan: MBLifeSpan?
    public let isnis: [String]?
    public let aliases: [MBAlias]?

    enum CodingKeys: String, CodingKey {
        case id, name
        case sortName = "sort-name"
        case typeID = "type-id"
        case type, disambiguation, gender
        case genderID = "gender-id"
        case country, area
        case beginArea = "begin-area"
        case endArea = "end-area"
//        case lifeSpan = "life-span"
        case isnis, aliases
    }
}

// MARK: - Alias
public struct MBAlias: Decodable {
    let name: String
    let sortName: String
    let typeID, locale, type: String?

    enum CodingKeys: String, CodingKey {
        case name
        case sortName = "sort-name"
        case typeID = "type-id"
        case locale, type
    }
}
