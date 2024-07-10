//
//  PokemonEvolution.swift
//  Pokedex
//
//  Created by João Melo on 01/07/24.
//

import Foundation

class PokemonEvolutionEntity: Hashable, Identifiable {
    let id: Int
    let name: String
    let minLevel: Int
    let evolvesFromSpeciesId: Int
    let evolvesFromSpeciesName: String
    
    init(id: Int, name: String, minLevel: Int, evolvesFromSpeciesId: Int, evolvesFromSpeciesName: String) {
        self.id = id
        self.name = name
        self.minLevel = minLevel
        self.evolvesFromSpeciesId = evolvesFromSpeciesId
        self.evolvesFromSpeciesName = evolvesFromSpeciesName
    }
    
    lazy var nameCapitalized: String = {
        return name.capitalized
    }()
    
    lazy var evolvesFromSpeciesNameCapitalized: String = {
        return evolvesFromSpeciesName.capitalized
    }()
    
    lazy var pokemonImageUrl: String = {
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png"
    }()
    
    lazy var pokemonEvolvesFromSpeciesImageUrl: String = {
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(evolvesFromSpeciesId).png"
    }()
    
    static func == (lhs: PokemonEvolutionEntity, rhs: PokemonEvolutionEntity) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
