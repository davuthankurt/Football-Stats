//
//  File.swift
//  StatsAPI
//
//  Created by Davuthan Kurt on 22.10.2024.
//

{
  "get": "players",
  "parameters": {
    "id": "276",
    "season": "2020"
  },
  "errors": [],
  "results": 1,
  "paging": {
    "current": 1,
    "total": 1
  },
  "response": [
    {
      "player": {
        "id": 276,
        "name": "Neymar",
        "firstname": "Neymar",
        "lastname": "da Silva Santos Júnior",
        "age": 29,
        "birth": {
          "date": "1992-02-05",
          "place": "Mogi das Cruzes",
          "country": "Brazil"
        },
        "nationality": "Brazil",
        "height": "175 cm",
        "weight": "68 kg",
        "injured": false,
        "photo": "https://media.api-sports.io/football/players/276.png"
      },
      "statistics": [
        {
          "team": {
            "id": 85,
            "name": "Paris Saint Germain",
            "logo": "https://media.api-sports.io/football/teams/85.png"
          },
          "league": {
            "id": 61,
            "name": "Ligue 1",
            "country": "France",
            "logo": "https://media.api-sports.io/football/leagues/61.png",
            "flag": "https://media.api-sports.io/flags/fr.svg",
            "season": 2020
          },
          "games": {
            "appearences": 13,
            "lineups": 10,
            "minutes": 975,
            "number": null,
            "position": "Attacker",
            "rating": "7.307692",
            "captain": false
          },
          "goals": {
            "total": 6,
            "conceded": 0,
            "assists": 3,
            "saves": null
          },
          "cards": {
            "yellow": 5,
            "yellowred": 1,
            "red": 1
          },
        },
      ]
    }
  ]
}

import Foundation


