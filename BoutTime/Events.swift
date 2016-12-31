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
    let date: Int
    
    var desctiption: String {
        return "\(event)"
    }
    
    init(event: String, date: Int) {
        self.event = event
        self.date = date
    }
}

func == (lhs: Event, rhs: Event) -> Bool {
    return lhs.date == rhs.date && lhs.event == rhs.event
}

let event1 = Event(event: "The Yankees purchase the contract of Babe Ruth from the Boston Red Sox for $125,000 and a $350,000 loan against the mortgage on Fenway Park.", date: 1920)
let event2 = Event(event: "The Yankees clinch their first AL pennant.", date: 1921)
let event3 = Event(event: "Babe Ruth breaks his own Major-League record with his 60th home run on the season's final day.", date: 1927)
let event4 = Event(event: "Lou Gehrig becomes the first player to hit four home runs in a single game in the Yankees' 20-13 win at Philadelphia. He remains the only Yankee to hit four home runs in one game.", date: 1932)
let event5 = Event(event: "\"Lou Gehrig Appreciation Day\" is held at Yankee Stadium. His uniform number (4) is the first to be retired in Major League Baseball and Gehrig makes his famous \"Today I consider myself the luckiest man on the face of the earth\" speech.", date: 1939)
let event6 = Event(event: "Mickey Mantle makes his Major-League debut, going 1-for-4 in a 4-0 win vs. Boston at Yankee Stadium.", date: 1951)
let event7 = Event(event: "Roger Maris hits his 61st home run in the season's final game to establish a Major-League record.", date: 1961)
let event8 = Event(event: "Reggie Jackson hits three home runs in Game Six of the World Series vs. the Los Angeles Dodgers at Yankee Stadium.", date: 1977)
let event9 = Event(event: "Don Mattingly hits a grand slam off Boston's Bruce Hurst, setting a Major-League record with six grand slams in a season.", date: 1987)
let event10 = Event(event: "Lou Gehrig's Major League record of 2,130 consecutive games played is broken when Baltimore's Cal Ripken, Jr. plays in his 2,131st.", date: 1995)
let event11 = Event(event: "Dwight Gooden hurls only the eighth regular-season no-hitter in Yankee history, a 2-0 blanking of the Seattle Mariners at Yankee Stadium.", date: 1996)
let event12 = Event(event: "The championship trophy returned to the Bronx after the Yanks defeat Greg Maddux and the Braves in Game 6 of the World Series. It was their 23rd title and the beginning of a dynasty.", date: 1996)
let event13 = Event(event: "David Wells tosses only the 14th regular-season perfect game in baseball history, the first ever by a Yankee.", date: 1998)
let event14 = Event(event: "The Yankees complete an incredible season with a four-game sweep of the San Diego Padres in the World Series to capture the franchise's 24th World Championship.Their 3-0 win gives the club a record of 125-50 (114-48 in the regular season, 11-2 in postseason).", date: 1998)
let event15 = Event(event: "The Yankees play Baseball's last game of the century and complete a four-game sweep of the Atlanta Braves to capture their 25th World Championship. The 4-1 win is also the club's 12th straight in World-Series play, tying the record of the 1927, 1928 and 1932 Yankees.", date: 1999)
let event16 = Event(event: "Yankees win their 26th World Championship in 5 vs. New York Mets. It was the first \"Subway Series\" since 1956.", date: 2000)
let event17 = Event(event: "Roger Clemens became the first pitcher since Nolan Ryan in 1990 to reach the 300 mark. The Rocket also joined another fraternity on that June 13th night at Yankee Stadium, striking out the 4,000th batter of his career. Only Ryan (5,714) and Steve Carlton (4,136) have more strikeouts than Clemens.", date: 2003)
let event18 = Event(event: "Aaron Boone, who didn't start the game, led off the bottom of the 11th inning with a home run to left field off Boston knuckleballer Tim Wakefield, delivering the Yankees' 39th American League pennant in Game 7 of the ALCS, propelling the Yanks to the World Series against the Marlins.", date: 2003)
let event19 = Event(event: "Derek Jeter makes a spectacular catch against the Red Sox, diving into the stands. John Flaherty wins the game with an RBI single in the 13th inning, leading New York to a three-game sweep in one of the more memorable regular-season games in the Bronx in years.", date: 2004)
let event20 = Event(event: "Bernie Williams launches a walk-off home run against the Twins at Yankee Stadium, clinching the Yankees' seventh consecutive American League East crown, as New York advanced to the playoffs for a 10th consecutive season.", date: 2004)
let event21 = Event(event: "Alex Rodriguez bashes two home runs against the Brewers in Milwaukee, becoming the youngest player in Major League history to reach the 400-homer plateau.", date: 2005)
let event22 = Event(event: "A-Rod hits his 40th homer of the season, becoming the first Yankees right-handed hitter since Joe DiMaggio in 1937 to reach that mark. A-Rod went on to hit 48 homers and drive in 130 runs, earning his second career AL MVP award.", date: 2004)
let event23 = Event(event: "In the 161st game of the season, the Yankees defeat the Red Sox at Fenway Park to clinch their eighth consecutive AL East crown.", date: 2005)
let event24 = Event(event: "The Yankees set an all-time Major League mark with 18 consecutive errorless games, safely handling 660 chances over the stretch.", date: 2009)
let event25 = Event(event: "Derek Jeter breaks Lou Gehrig's all-time franchise mark of 2,721 hits with a single off Baltimore's Chris Tillman at Yankee Stadium. Gehrig had held the mark since 9/6/37.", date: 2009)

var eventList = [event1, event2, event3, event4, event5, event6, event7, event8, event9, event10, event11, event12, event13, event14, event15, event16, event17, event18, event19, event20, event21, event22, event23, event24, event25]
