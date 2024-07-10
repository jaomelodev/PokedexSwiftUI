//
//  GetPercentageLabel.swift
//  Pokedex
//
//  Created by João Melo on 08/07/24.
//

import Foundation

func getPercentageLabel(percentage: Double) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.minimumFractionDigits = 0
    formatter.maximumFractionDigits = 1
    
    let labelString = formatter.string(from: NSNumber(value: percentage)) ?? "\(percentage)"
    
    return labelString
}
