
import Foundation

public extension MusicBrainzClient {

    func browse<B: MBEntity, R:MBResults>(_ type: B.Type, id: String, parameters: B.Search.Query? = nil, includes: [B.Search.Query.Include] = []) async throws -> R where R.Result:MBEntity {
        var endpoint: String = "\(R.Result.endpoint)?\(B.endpoint)=\(id)"
        
        if let parameters {
            let encoder = JSONEncoder()
            let data = try encoder.encode(parameters)
            let encodedQuery = String(data: data, encoding: .utf8)?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            endpoint += "&query=\(encodedQuery)"
            
        }
        
        if !includes.isEmpty {
            let incQuery = includes.map{$0.rawValue}.joined(separator: "+")
            endpoint += "&inc=\(incQuery)"
        }
        return try await fetch(endpoint: endpoint)
        
        
    }
}

public extension MusicBrainzClient {
    
    /// Browse events in the MusicBrainz database matching the specified browse parameters.
    /// - Parameters:
    ///   - parameters: The browse parameters to use in the search.
    ///   - includes: An array of include parameters to include with the search.
    /// - Returns: The browse results as a `MBEvent.Search.Results` object.
    func browseEvent(id: String, parameters: MBEvent.Search.Query, includes: [MBEvent.Search.Query.Include]) async throws -> MBEvent.Search.Results {
        return try await browse(MBEvent.self, id: id, parameters: parameters, includes: includes)
    }
}
