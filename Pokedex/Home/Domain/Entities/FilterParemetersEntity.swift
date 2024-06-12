//
//  FilterParemetersEntity.swift
//  Pokedex
//
//  Created by João Melo on 01/06/24.
//

struct FilterParemetersEntity {
    var selectedTypes: [PokemonType] = []
    var selectedWeaknesses: [PokemonType] = []
    var selectedHeights: [PokemonHeight] = []
    var selectedWeights: [PokemonWeight] = []
    var sliderBounds: ClosedRange<Int> = 0...1
    var sliderCurrentRange: ClosedRange<Int> = 0...1
    
    func copy(
       selectedTypes: [PokemonType]? = nil,
       selectedWeaknesses: [PokemonType]? = nil,
       selectedHeights: [PokemonHeight]? = nil,
       selectedWeights: [PokemonWeight]? = nil,
       sliderBounds: ClosedRange<Int>? = nil,
       sliderCurrentRange: ClosedRange<Int>? = nil
    ) -> FilterParemetersEntity {
        return FilterParemetersEntity(
           selectedTypes: selectedTypes ?? self.selectedTypes,
           selectedWeaknesses: selectedWeaknesses ?? self.selectedWeaknesses,
           selectedHeights: selectedHeights ?? self.selectedHeights,
           selectedWeights: selectedWeights ?? self.selectedWeights,
           sliderBounds: sliderBounds ?? self.sliderBounds,
           sliderCurrentRange: sliderCurrentRange ?? self.sliderCurrentRange
        )
    }
    
    mutating func resetFilters() {
        selectedTypes = []
        selectedWeaknesses = []
        selectedHeights = []
        selectedWeights = []
        sliderCurrentRange = sliderBounds
    }
}
