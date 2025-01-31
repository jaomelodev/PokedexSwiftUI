//
//  CapitalizeFirstLetter.swift
//  Pokedex
//
//  Created by João Melo on 28/05/24.
//

extension String {
    func padStart(toLength length: Int, withPad pad: String = " ") -> String {
        let padCount = length - self.count
        guard padCount > 0 else { return self }
        
        let padding = String(repeating: pad, count: (padCount + pad.count - 1) / pad.count).prefix(padCount)
        return padding + self
    }
}
