//
//  Events.swift
//  BoutTime
//
//  Created by Chris Argonish on 12/27/16.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit
import GameplayKit

class Event: Equatable {
    let event: String
    let episode: Int
    
    var desctiption: String {
        return "\(episode)"
    }
    
    init(event: String, episode: Int) {
        self.event = event
        self.episode = episode
    }
}

func == (lhs: Event, rhs: Event) -> Bool {
    return lhs.episode == rhs.episode && lhs.event == rhs.event
}

let event1 = Event(event: "", episode: 122)
let event2 = Event(event: "", episode: 122)
let event3 = Event(event: "", episode: 122)
let event4 = Event(event: "", episode: 122)
let event5 = Event(event: "", episode: 122)
let event6 = Event(event: "", episode: 122)
let event7 = Event(event: "", episode: 122)
let event8 = Event(event: "", episode: 122)
let event9 = Event(event: "", episode: 122)
let event10 = Event(event: "", episode: 122)
let event11 = Event(event: "", episode: 122)
let event12 = Event(event: "", episode: 122)
let event13 = Event(event: "", episode: 122)
let event14 = Event(event: "", episode: 122)
let event15 = Event(event: "", episode: 122)
let event16 = Event(event: "", episode: 122)
let event17 = Event(event: "", episode: 122)
let event18 = Event(event: "", episode: 122)
let event19 = Event(event: "", episode: 122)
let event20 = Event(event: "", episode: 122)
let event21 = Event(event: "", episode: 122)
let event22 = Event(event: "", episode: 122)
let event23 = Event(event: "", episode: 122)
let event24 = Event(event: "", episode: 122)
let event25 = Event(event: "", episode: 122)

var eventList = [event1, event2, event3, event4, event5, event6, event7, event8, event9, event10, event11, event12, event13, event14, event15, event16, event17, event18, event19, event20, event21, event22, event23, event24, event25]
