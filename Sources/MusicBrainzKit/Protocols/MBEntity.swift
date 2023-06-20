/// Protocol representing an entity with an ID.
public protocol MBEntity: Decodable {
        
    associatedtype Search: MBSearch where Search.Results.Result == Self
    
    /// The ID of the entity.
    var id: String { get }
    
    /// The API endpoint for the entity
    static var endpoint: String { get }
}

extension MBEntity {
    static var title: String {
        let typeName = String(describing: Self.self)
        
//        return typeName.hasPrefix("MB") ? String(typeName.dropFirst(2)) : typeName
        
        return typeName.replacingOccurrences(of: "MB", with: "")
    }

    static public var endpoint: String { title.lowercased() }

}
