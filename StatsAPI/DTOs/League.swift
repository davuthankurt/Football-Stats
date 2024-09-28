//
//  League.swift
//  FootballStatsAPI
//
//  Created by Davuthan Kurt on 6.09.2024.
//


//    response =     (
//                {
//            league =             {
//                country = England;
//                flag = "https://media.api-sports.io/flags/gb.svg";
//                id = 39;
//                logo = "https://media.api-sports.io/football/leagues/39.png";
//                name = "Premier League";
//                season = 2020;
//                standings =                 (
//                                        (
//                                                {
//                            all =                             {
//                                draw = 5;
//                                goals =                                 {
//                                    against = 32;
//                                    for = 83;
//                                };
//                                lose = 6;
//                                played = 38;
//                                win = 27;
//                            };
//                            away =                             {
//                                draw = 3;
//                                goals =                                 {
//                                    against = 15;
//                                    for = 40;
//                                };
//                                lose = 2;
//                                played = 19;
//                                win = 14;
//                            };
//                            description = "Promotion - Champions League (Group Stage)";
//                            form = WLWLW;
//                            goalsDiff = 51;
//                            group = "Premier League";
//                            home =                             {
//                                draw = 2;
//                                goals =                                 {
//                                    against = 17;
//                                    for = 43;
//                                };
//                                lose = 4;
//                                played = 19;
//                                win = 13;
//                            };
//                            points = 86;
//                            rank = 1;
//                            status = same;
//                            team =                             {
//                                id = 50;
//                                logo = "https://media.api-sports.io/football/teams/50.png";
//                                name = "Manchester City";
//                            };
//                            update = "2021-05-23T00:00:00+00:00";
//                        },


import Foundation


public struct League: Codable {
    public let name: String
    public let logo: String
    public let standings: [[Standing]]
}

public struct Standing: Codable {
    
    public enum CodingKeys: String, CodingKey {
        case rank
        case form
        case points
        case team
        case records = "all"
        case goalsDiff
    }
    public let rank: Int
    public let form: String?
    public let points: Int
    public let team: Team
    public let records: Record
    public let goalsDiff: Int
}

public struct Team: Codable {
    public let name: String
}

public struct Record: Codable {
    public let win: Int
    public let draw: Int
    public let lose: Int
}
