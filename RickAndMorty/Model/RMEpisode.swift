//
//  RMEpisodes.swift
//  RickAndMorty
//
//  Created by Jan Appé on 31.01.23.
//

import Foundation

struct RMEpisodes: Codable{
    
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
    
}
