//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by Jan Appé on 01.02.23.
//

import Foundation

enum RMCharacterStatus: String, Codable{
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"
}
