/// The model for a SearchResult object.
public protocol MBSearchResult: Decodable {
    /// The creation date of the search result.
    var created: String {get}// ToDo: Specify the correct type for date
    
    /// The count of the search result.
    var count: Int {get}
    
    /// The offset of the search result.
    var offset: Int {get}
}

public struct MBBrowseAreasResult: Decodable {
    public let area: MBArea
    public let areaCount: Int
    public let areaOffset: Int
    
    enum CodingKeys: String, CodingKey {
        case area
        case areaCount = "area-count"
        case areaOffset = "area-offset"
    }
}

public struct MBBrowseArtistsResult: Decodable {
    public let artists: [MBArtist]
    public let artistCount: Int
    public let artistOffset: Int
    
    enum CodingKeys: String, CodingKey {
        case artists
        case artistCount = "artist-count"
        case artistOffset = "artist-offset"
    }
}

public struct MBBrowseCollectionsResult: Decodable {
    public let collections: [MBCollection]
    public let collectionCount: Int
    public let collectionOffset: Int
    
    enum CodingKeys: String, CodingKey {
        case collections
        case collectionCount = "collection-count"
        case collectionOffset = "collection-offset"
    }
}

public struct MBBrowseEventsResult: MBSearchResult {
    public var created: String
    
    public var count: Int
    
    public var offset: Int
    
    public let events: [MBEvent]

}

public struct MBBrowseInstrumentsResult: Decodable {
    public let instruments: [MBInstrument]
    public let instrumentCount: Int
    public let instrumentOffset: Int
    
    enum CodingKeys: String, CodingKey {
        case instruments
        case instrumentCount = "instrument-count"
        case instrumentOffset = "instrument-offset"
    }
}

public struct MBBrowseLabelsResult: Decodable {
    public let label: [MBLabel]
    public let labelCount: Int
    public let labelOffset: Int
    
    enum CodingKeys: String, CodingKey {
        case label
        case labelCount = "label-count"
        case labelOffset = "label-offset"
    }
}

public struct MBBrowsePlacesResult: Decodable {
    public let place: [MBPlace]
    public let placeCount: Int
    public let placeOffset: Int
    
    enum CodingKeys: String, CodingKey {
        case place
        case placeCount = "place-count"
        case placeOffset = "place-offset"
    }
}

public struct MBBrowseRecordingsResult: Decodable {
    public let recording: [MBRecording]
    public let recordingCount: Int
    public let recordingOffset: Int
    
    enum CodingKeys: String, CodingKey {
        case recording
        case recordingCount = "recording-count"
        case recordingOffset = "recording-offset"
    }
}

public struct MBBrowseReleasesResult: Decodable {
    public let releases: [MBRelease]
    public let releaseCount: Int
    public let releaseOffset: Int
    
    enum CodingKeys: String, CodingKey {
        case releases
        case releaseCount = "release-count"
        case releaseOffset = "release-offset"
    }
}

public struct MBBrowseReleaseGroupsResult: Decodable {
    public let releaseGroups: [MBReleaseGroup]
    public let releaseGroupCount: Int
    public let releaseGroupOffset: Int
    
    enum CodingKeys: String, CodingKey {
        case releaseGroups = "release-groups"
        case releaseGroupCount = "release-group-count"
        case releaseGroupOffset = "release-group-offset"
    }
}


public struct MBBrowseWorksResult: Decodable {
    public let works: [MBWork]
    public let workCount: Int
    public let workOffset: Int
    
    enum CodingKeys: String, CodingKey {
        case works
        case workCount = "work-count"
        case workOffset = "work-offset"
    }
}
