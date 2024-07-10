//
//  PokemonStatEntity.swift
//  Pokedex
//
//  Created by João Melo on 02/07/24.
//

import Foundation

struct PokemonStatEntity: Identifiable, Hashable {
    let id = UUID()
    let baseStat: Int
    let effortValue: Int
    let statName: String
    
    var formattedStatName: String {
        switch statName {
        case "hp":
            return "HP"
        case "special-attack":
            return "Sp. Atk"
        case "special-defense":
            return "Sp. Def"
            
        default:
            return statName.replacingOccurrences(of: "-", with: " ").capitalized
        }
    }
    
    var minStat: Int {
        if statName == "hp" {
            return calculateHP(baseStat: baseStat, iv: 0, ev: 0, level: 100)
        } else {
            return calculateStat(baseStat: baseStat, iv: 0, ev: 0, level: 100, nature: 0.9)
        }
    }
    
    var maxStat: Int {
        if statName == "hp" {
            return calculateHP(baseStat: baseStat, iv: 31, ev: 252, level: 100)
        } else {
            return calculateStat(baseStat: baseStat, iv: 31, ev: 252, level: 100, nature: 1.1)
        }
    }
    
    private func calculateHP(baseStat: Int, iv: Int, ev: Int, level: Int) -> Int {
        return ((2 * baseStat + iv + (ev / 4)) * level / 100) + level + 10
    }
    
    private func calculateStat(baseStat: Int, iv: Int, ev: Int, level: Int, nature: Double = 1.0) -> Int {
        return Int(Double(((2 * baseStat + iv + (ev / 4)) * level / 100) + 5) * nature)
    }
}
