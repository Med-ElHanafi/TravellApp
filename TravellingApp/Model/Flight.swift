//
//  Flight.swift
//  TravellingApp
//
//  Created by Mohamed El Hanafi on 6/25/20.
//  Copyright © 2020 Mohamed El Hanafi. All rights reserved.
//

import UIKit

struct Flight {
    var departure: FlightDetails
    var arrival: FlightDetails
    var price: Int
    var state: State
    
    var hasStops: Bool
    
    struct FlightDetails {
        var time: Date
        var location: String
        var airport: String
    }
    
    enum State {
        case low, med, top
        
        var value: String {
            switch self {
            case .top:
                return "Top"
            case .low:
                return "Low"
            case .med:
                return "Med"
            }
        }
        
        var color: UIColor {
            switch self {
            case .top:
                return .accentColor
            case .low:
                return .lightGray
            case .med:
                return .primaryColorLight
            }
        }
    }
}
