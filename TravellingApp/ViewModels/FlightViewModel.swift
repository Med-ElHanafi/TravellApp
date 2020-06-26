//
//  FlightViewModel.swift
//  TravellingApp
//
//  Created by Mohamed El Hanafi on 6/25/20.
//  Copyright © 2020 Mohamed El Hanafi. All rights reserved.
//

import UIKit

struct FlightViewModel {
    
    let price: String
    let state: String
    let statusColor: UIColor
    
    let departureDate: String
    let departureCountry: String
    let departureTime: String
    
    let arrivalDate: String
    let arrivalCountry: String
    let arrivalTime: String
    
    let hasStops: Bool
    let flightDuration: String
    
    init(flight: Flight) {
        let airport = flight.departure.airport.isEmpty ? "" : "(\(String(flight.departure.airport.prefix(3))))"
        let arrivalAirport = flight.arrival.airport.isEmpty ? "" : "(\(String(flight.arrival.airport.prefix(3))))"
        
        price = "$"+String(flight.price)
        state = flight.state.value
        statusColor = flight.state.color
        
        departureDate = flight.departure.time.dateString
        departureCountry = flight.departure.location.prefix(3) + airport
        departureTime = flight.departure.time.timeString
        
        arrivalDate = flight.arrival.time.dateString
        arrivalCountry = flight.arrival.location.prefix(3) + arrivalAirport
        arrivalTime = flight.arrival.time.timeString
        
        hasStops = flight.hasStops
        flightDuration = flight.arrival.time.timeIntervalSince(flight.departure.time).durationString
        
    }
}
