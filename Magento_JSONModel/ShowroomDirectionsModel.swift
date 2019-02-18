//
//  ShowroomDirectionsModel.swift
//  MagentoAPI
//
//  Created by Work on 2/14/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.

import Foundation

struct ShowroomDirectionsJSONModel: Codable {
    let geocodedWaypoints: [GeocodedWaypoint]?
    let routes: [Route]?
    let status: String?
    
    enum CodingKeys: String, CodingKey {
        case geocodedWaypoints = "geocoded_waypoints"
        case routes, status
    }
}

struct GeocodedWaypoint: Codable {
    let geocoderStatus, placeID: String?
    let types: [String]?
    
    enum CodingKeys: String, CodingKey {
        case geocoderStatus = "geocoder_status"
        case placeID = "place_id"
        case types
    }
}

struct Route: Codable {
    let bounds: Bounds?
    let copyrights: String?
    let legs: [Leg]?
    let overviewPolyline: Polyline?
    let summary: String?
    let warnings, waypointOrder: [JSONAny]?
    
    enum CodingKeys: String, CodingKey {
        case bounds, copyrights, legs
        case overviewPolyline = "overview_polyline"
        case summary, warnings
        case waypointOrder = "waypoint_order"
    }
}

struct Bounds: Codable {
    let northeast, southwest: Northeast?
}

struct Northeast: Codable {
    let lat, lng: Double?
}

struct Leg: Codable {
    let distance, duration: Distance?
    let endAddress: String?
    let endLocation: Northeast?
    let startAddress: String?
    let startLocation: Northeast?
    let steps: [Step]?
    let trafficSpeedEntry, viaWaypoint: [JSONAny]?
    
    enum CodingKeys: String, CodingKey {
        case distance, duration
        case endAddress = "end_address"
        case endLocation = "end_location"
        case startAddress = "start_address"
        case startLocation = "start_location"
        case steps
        case trafficSpeedEntry = "traffic_speed_entry"
        case viaWaypoint = "via_waypoint"
    }
}

struct Distance: Codable {
    let text: String?
    let value: Int?
}

struct Step: Codable {
    let distance, duration: Distance?
    let endLocation: Northeast?
    let htmlInstructions: String?
    let polyline: Polyline?
    let startLocation: Northeast?
    let travelMode: TravelMode?
    let maneuver: String?
    
    enum CodingKeys: String, CodingKey {
        case distance, duration
        case endLocation = "end_location"
        case htmlInstructions = "html_instructions"
        case polyline
        case startLocation = "start_location"
        case travelMode = "travel_mode"
        case maneuver
    }
}

struct Polyline: Codable {
    let points: String?
}

enum TravelMode: String, Codable {
    case driving = "DRIVING"
}

