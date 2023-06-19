import XCTest
@testable import MusicBrainzKit

final class MusicBrainzKitTests: XCTestCase {

    // Insert your actual MusicBrainz API key here
    var client: MusicBrainzClient!
    struct Artist {
        let name: String
        let id: String
    }
    let beatles = Artist(name: "The Beatles", id: "b10bbbfc-cf9e-42e0-be17-e2c3e1d2600d")
    let phish = Artist(name: "Phish", id: "e01646f2-2a04-450d-8bf2-0d993082e058")

    override func setUp() {
        super.setUp()
        let appName = "YourAppName"
        client = MusicBrainzClient(appName: appName, version: "1.0", contact: "dev@\(appName).app")
    }

    override func tearDown() {
        client = nil
        super.tearDown()
    }

    func testArtist() async throws {
        let id = phish.id
        do {
            let artist = try await client.lookupArtist(artistId: id)
            XCTAssertEqual(artist.id, id)
        } catch {
            XCTFail("Failed to fetch artist: \(error)")
        }
    }
    
    func testSearchArtist() async throws {
        // Mock search query
        struct MockSearchQuery: MBSearchQuery {
            let query: [String: String]?
            let inc: [String]?
        }
        
        // Mock search query parameters
        let query: [String: String] = [
            "artist": "Phish",
            "country": "US"
        ]
        let inc: [String] = ["aliases", "tags"]
        
        let searchQuery = MockSearchQuery(query: query, inc: inc)
        
        // Perform the search
        do {
            let artistList = try await client.searchArtist(query: searchQuery)
            // Assert the expected results
            print(artistList.artists.map{$0.name})
            XCTAssert(artistList.artists.contains(where: {$0.name == "Phish"}))
            // Additional assertions...
        } catch {
            XCTFail("Search failed with error: \(error)")

        }
    }
    
    func testSearchEvents() async throws {
        // Mock search query
        struct MockSearchQuery: MBSearchQuery {
            let query: [String: String]?
            let inc: [String]?
        }
        
        // Mock search query parameters
        let query: [String: String] = [
            "artist": "Phish",
            "country": "US"
        ]
        let inc: [String] = ["aliases", "tags"]
        
        let searchQuery = MockSearchQuery(query: query, inc: inc)
        
        // Perform the search
        do {
            let artistList = try await client.searchArtist(query: searchQuery)
            // Assert the expected results
            print(artistList.artists.map{$0.name})
            XCTAssert(artistList.artists.contains(where: {$0.name == "Phish"}))
            // Additional assertions...
        } catch {
            XCTFail("Search failed with error: \(error)")

        }
    }
    
    func testBrowseEventsForArtistPhish() async throws {
        
        struct MockSearchQuery: MBSearchQuery {
            let query: [String: String]?
            let inc: [String]?
        }
        
        // Create the search query
        let query: [String: String] = [
            "artist": "Phish"
        ]
        
        let inc: [String] = []
        
        let searchQuery = MockSearchQuery(query: query, inc: inc)
        
        do {
            let result = try await client.browseEvents(query: searchQuery)
            
            let events = result.events
            XCTAssert(events.count > 0, "Events list should not be empty")
            
            // Print the event names
            for event in events {
                print(event.name)
            }
            
        } catch {
            XCTFail("Failed to browse events for artist 'Phish': \(error)")
        }
    }


}
