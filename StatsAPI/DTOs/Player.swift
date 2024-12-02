//
//  File.swift
//  StatsAPI
//
//  Created by Davuthan Kurt on 22.10.2024.
//

//{
//  "get": "players",
//  "parameters": {
//    "id": "276",
//    "season": "2020"
//  },
//  "errors": [],
//  "results": 1,
//  "paging": {
//    "current": 1,
//    "total": 1
//  },
//  "response": [
//    {
//      "player": {
//        "id": 276,
//        "name": "Neymar",
//        "firstname": "Neymar",
//        "lastname": "da Silva Santos Júnior",
//        "age": 29,
//        "nationality": "Brazil",
//        "height": "175 cm",
//        "weight": "68 kg",
//        "photo": "https://media.api-sports.io/football/players/276.png"
//      },
//      "statistics": [
//        {
//          "league": {
//            "id": 61,
//            "name": "Ligue 1",
//            "country": "France",
//            "logo": "https://media.api-sports.io/football/leagues/61.png",
//            "flag": "https://media.api-sports.io/flags/fr.svg",
//            "season": 2020
//          },
//          "games": {
//            "appearences": 13,
//            "lineups": 10
//          },
//          "goals": {
//            "total": 6,
//            "assists": 3
//          },
//          "cards": {
//            "yellow": 5
//            "red": 1
//          },
//        },
//      ]
//    }
//  ]
//}

import Foundation

public struct PlayerInfo: Codable {
    public let player: Player
    public let statistics: [Statistics]
}

public struct Player: Codable {
    public let id: Int
    public let name: String?
    public let firstname: String?
    public let lastname: String?
    public let age: Int?
    public let nationality: String?
    public let height: String?
    public let weight: String?
    public let photo: String?
}

public struct Statistics: Codable {
    public let team: Team
    public let league: League
    public let games: Games
    public let goals: Goals
    public let cards: Cards
    
    public struct League: Codable {
        public let country: String?
        public let flag: String?
        public let id: Int?
        public let logo: String?
        public let name: String?
    }
}

public struct Games: Codable {
    public let appearences: Int?
    public let lineups: Int?
    public let minutes: Int?
    public let rating: String?
}

public struct Goals: Codable {
    public let total: Int?
    public let assists: Int?
}

public struct Cards: Codable {
    public let yellow: Int?
    public let red: Int?
}


