//
//  PokemonEntity.swift
//  Pokedex
//
//  Created by João Melo on 27/05/24.
//

import SwiftUI

class PokemonEntity: Hashable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let height: Int
    let weight: Int
    let catchRate: Int
    let baseHappiness: Int
    let growthRate: String
    let baseExp: Int
    let genderRate: Int
    let eggCycles: Int
    let eggGroups: [String]
    let types: [PokemonType]
    let pokemonEvolutionChain: [PokemonEvolutionEntity]
    let pokemonStats: [PokemonStatEntity]
    let pokemonAbilities: [PokemonAbilityEntity]
    
    lazy var nameCapitalized: String = {
        return name.capitalized
    }()
    
    lazy var heightInMetersLabel: String = {
        return "\(Double(height) / 10.0)m"
    }()
    
    lazy var heightInFeetAndInchesLabel: String = {
        let heightCm = height * 10
        
        let heightIn = Double(heightCm) / 2.54
        
        let feet = Int(heightIn) / 12
        let inches = Int(heightIn) % 12
        
        return "\(feet)'\(String(inches).padStart(toLength: 2, withPad: "0"))\""
    }()
    
    lazy var weightInKilosLabel: String = {
        return "\(Double(weight) / 10.0)kg"
    }()
    
    lazy var weightInLbsLabel: String = {
        let weightInKg = Double(weight) / 10
        
        let weightLbs = weightInKg * 2.20462
        
        return "\(String(format: "%.1f lbs", weightLbs))"
    }()
    
    lazy var pokemonImageUrl: String = {
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png"
    }()
    
    lazy var descriptionSanitazed: String = {
        description.replacingOccurrences(of: String("\n"), with: " ")
        
    }()
    
    lazy var growthRateSanitazed: String = {
        growthRate.replacingOccurrences(of: String("-"), with: " ").capitalized
        
    }()
    
    lazy var eggGroupsLabel: String = {
        var label = ""
        
        for eggGroup in eggGroups {
            label += eggGroup.capitalized
            
            if eggGroup != eggGroups.last {
                label += ", "
            }
        }
        
        return label
    }()
    
    lazy var pokemonDamageRelation: [PokemonType: Double] = {
        getPokemonDamageRelation(defendingTypes: types)
    }()
    
    lazy var pokemonHeightCategory: PokemonHeight = {
        switch height {
        case ..<10:
            return .short
        case 10..<20:
            return .medium
        default:
            return .tall
        }
    }()
    
    lazy var pokemonWeightCategory: PokemonWeight = {
        switch weight {
        case ..<200:
            return .light
        case 200..<1000:
            return .normal
        default:
            return .heavy
        }
    }()
    
    //Não usei o lazy pois eu precisava dele dentro do ForEach
    var pokemonEVStats: [PokemonStatEntity] {
        var statsFiltered = pokemonStats.filter { $0.effortValue > 0 }
        
        statsFiltered.sort { $0.effortValue < $1.effortValue }
        
        return statsFiltered
    }
    
    init(
        id: Int,
        name: String,
        description: String,
        height: Int,
        weight: Int,
        catchRate: Int,
        baseHappiness: Int,
        growthRate: String,
        baseExp: Int,
        genderRate: Int,
        eggCycles: Int,
        eggGroups: [String],
        types: [PokemonType],
        evolutionChain: [PokemonEvolutionEntity],
        pokemonStats: [PokemonStatEntity],
        pokemonAbilities: [PokemonAbilityEntity]
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.height = height
        self.weight = weight
        self.catchRate = catchRate
        self.baseHappiness = baseHappiness
        self.growthRate = growthRate
        self.baseExp = baseExp
        self.genderRate = genderRate
        self.eggCycles = eggCycles
        self.eggGroups = eggGroups
        self.types = types
        self.pokemonEvolutionChain = evolutionChain
        self.pokemonStats = pokemonStats
        self.pokemonAbilities = pokemonAbilities
    }
    
    static func == (lhs: PokemonEntity, rhs: PokemonEntity) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
