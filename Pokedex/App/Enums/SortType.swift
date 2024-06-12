//
//  SortType.swift
//  Pokedex
//
//  Created by João Melo on 31/05/24.
//

enum SortType: String, CaseIterable, Identifiable {
    case smallFirst = "Smallest number first"
    case highFirst = "Highest number first"
    case aToZ = "A-Z"
    case zToA = "Z-A"
    
    var id:SortType { self }
}
