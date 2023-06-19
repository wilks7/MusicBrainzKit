//
//  File.swift
//  
//
//  Created by Michael on 6/19/23.
//

import Foundation


public protocol Includes {
    static var options: [String] {get}
}
public extension Includes where Self: CaseIterable, Self:RawRepresentable, Self.RawValue == String {
    static var options: [String] {
        Self.allCases.map{$0.rawValue}
    }
}


public enum RelationsIncludes: String, CaseIterable, Includes {
    case areaRels = "area-rels"
    case artistRels = "artist-rels"
    case eventRels = "event-rels"
    case instrumentRels = "instrument-rels"
    case labelRels = "label-rels"
    case placeRels = "place-rels"
    case recordingRels = "recording-rels"
    case releaseRels = "release-rels"
    case releaseGroupRels = "release-group-rels"
    case seriesRels = "series-rels"
    case urlRels = "url-rels"
    case workRels = "work-rels"
}



public enum SubQueryIncludes: String, CaseIterable, Includes {
    case discids
    case media
    case isrcs
    case artistCredits = "artist-credits"
    case variousArtists = "various-artists"
}


public enum MiscIncludes: String, CaseIterable, Includes {
    case aliases
    case annotation
    case tags
    case genres
    case ratings
    case media
}

public protocol RelationshipMiscIncludes: RawRepresentable, Includes {
    
}
extension RelationshipMiscIncludes {
    public static var options: [String] {
        RelationsIncludes.options + MiscIncludes.options

    }
}

public protocol RelationshipMiscSubQueryIncludes: RawRepresentable, Encodable, Includes {
    
}
extension RelationshipMiscSubQueryIncludes {
    public static var options: [String] {
        RelationsIncludes.options + MiscIncludes.options + SubQueryIncludes.options

    }
}


public typealias AreaIncludes = RelationshipMiscIncludes
public typealias ArtistIncludes = RelationshipMiscIncludes
public typealias CollectionIncludes = RelationshipMiscIncludes
public typealias EventIncludes = RelationshipMiscIncludes
public typealias GenreIncludes = MiscIncludes
public typealias InstrumentIncludes = RelationshipMiscIncludes
public typealias LabelIncludes = RelationshipMiscIncludes
public typealias PlaceIncludes = RelationshipMiscIncludes
public typealias RecordingIncludes = RelationshipMiscSubQueryIncludes
public typealias ReleaseIncludes = RelationshipMiscSubQueryIncludes
public typealias ReleaseGroupIncludes = RelationshipMiscSubQueryIncludes
public typealias SeriesIncludes = RelationshipMiscIncludes
public typealias WorkIncludes = RelationshipMiscIncludes
public typealias UrlIncludes = RelationsIncludes

public extension RelationsIncludes {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}

public extension SubQueryIncludes {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}

public extension MiscIncludes {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}




