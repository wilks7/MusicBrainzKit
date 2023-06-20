/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A client to handle network communications with the MusicBrainz API.
*/

import Foundation
import OSLog
import DrillURL

/// This class prepares and sends requests to the MusicBrainz API, and handles responses.
public class MusicBrainzClient: DrillClient {

    /// The base URL for the MusicBrainz API.
    public let baseURL: String = "https://musicbrainz.org/ws/2/"
    
    /// The shared URL session object.
    public let session = URLSession.shared
    
    /// The application name to be used in requests' User-Agent header.
    public let appName: String
    
    /// The application version to be used in requests' User-Agent header.
    public let version: String
    
    /// The contact information to be used in requests' User-Agent header.
    public let contact: String
    
    /// The Logger used by Client protocol to log networking.
    public let networkLogger: Logger
    
    /// The logger used by MusicBrainz to log results.
    public let logger: Logger

    /// Creates a new `MusicBrainzClient`.
    ///
    /// - Parameters:
    ///   - appName: The application name to be used in requests' User-Agent header.
    ///   - version: The application version to be used in requests' User-Agent header.
    ///   - contact: The contact information to be used in requests' User-Agent header.
    public init(appName: String, version: String, contact: String) {
        self.appName = appName
        self.version = version
        self.contact = contact
        self.networkLogger = Logger(subsystem: "app.\(appName)", category: "Networking")
        self.logger = Logger(subsystem: "app.\(appName)", category: "MusicBrainz")

    }
    
    /// Creates a new `MusicBrainzClient`.
    ///
    /// - Parameters:
    ///   - appName: The application name to be used in requests' User-Agent header.
    ///   - version: The application version to be used in requests' User-Agent header.
    ///   - orginization: The orginization identifier to be used in creating contact info and logger.
    public init(appName: String, version: String, orginization: String) {
        self.appName = appName
        self.version = version
        self.contact = "dev@\(orginization).app"
        self.networkLogger = Logger(subsystem: "app.\(orginization).\(appName)", category: "Networking")
        self.logger = Logger(subsystem: "app.\(orginization).\(appName)", category: "MusicBrainz")


    }

    /// Prepares a new `URLRequest` for a given URL.
    ///
    /// This function prepares the HTTP method, headers, and body for the request.
    ///
    /// - Parameter url: The `URL` to prepare a request for.
    /// - Returns: A `URLRequest` prepared for the given `URL`.
    public func makeRequest(for url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("\(appName)/\(version) ( \(contact) )", forHTTPHeaderField: "User-Agent")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        return request
    }
    
    
    /// Prepares a new `URL` for a given endpoint and parameters.
    ///
    /// This function encodes the parameters and the includes tags for the object response
    ///
    /// - Parameter url: The `URL` to prepare a request for.
    /// - Returns: A `URLRequest` prepared for the given `URL`.
    public func makeEndpoint<P:Encodable, I:Includes>(for endpoint: String, parameters: P?, includes: [I] = []) throws -> URL {
        var _endpoint = endpoint
        if let parameters {
            let encoder = JSONEncoder()
            let data = try encoder.encode(parameters)
            let encodedQuery = String(data: data, encoding: .utf8)?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            _endpoint += "?query=\(encodedQuery)"
        }
        
        if !includes.isEmpty {
            let incQuery = includes.map{$0.rawValue}.joined(separator: "+")
            _endpoint += "&inc=\(incQuery)"
        }
        return try self.createURL(with: _endpoint)
    }
}


public enum APIError: Swift.Error {
    case decode, message(String)
}
