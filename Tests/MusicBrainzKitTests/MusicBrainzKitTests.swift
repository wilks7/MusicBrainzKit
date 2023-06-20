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
        let param = MBArtist.Search.Query(artist: "Phish")
        let _: [MBArtist.Search.Query.Include] = [.aliases]
            
        do {
            let artists: [MBArtist] = try await client.search(parameters: param)
            // Assert the expected results
            XCTAssert(artists.contains(where: {$0.name == "Phish"}))

            // Additional assertions...
        } catch {
            XCTFail("Search failed with error: \(error)")

        }
    }

    
    func testBrowseEvents() async throws {
        let param = MBArtist.Search.Query()
        let inc: [MBArtist.Search.Query.Include] = []
        
        do {
            let result: MBEvent.Search.Results = try await client.browse(MBArtist.self, id: "e01646f2-2a04-450d-8bf2-0d993082e058")
            
            let events = result.events
            XCTAssert(events.count > 0, "Events list should not be empty")
            
            // Print the event names
            for event in events {
                let date = event.lifeSpan?.begin ?? ""
                print(event.name + " - " + date)
            }
            
        } catch {
            XCTFail("Failed to browse events for artist 'Phish': \(error)")
        }
    }
    
    func testBrowseRecordings() async throws {
        let param = MBArtist.Search.Query()
        let inc: [MBArtist.Search.Query.Include] = []
        
        do {
            let result: MBRecording.Search.Results = try await client.browse(MBArtist.self, id: "e01646f2-2a04-450d-8bf2-0d993082e058")
            
            let recordings = result.recordings
            XCTAssert(recordings.count > 0, "Recordings list should not be empty")
            
            // Print the event names
            for recording in recordings {
//                let date = event.lifeSpan?.begin ?? ""
                print(recording.title)
            }
            
        } catch {
            XCTFail("Failed to browse events for artist 'Phish': \(error)")
        }
    }


}
