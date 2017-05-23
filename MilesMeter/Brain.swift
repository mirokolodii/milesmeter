//
//  Brain.swift
//  MilesMeter
//
//  Created by Myroslav Kolodii on 24/03/2017.
//  Copyright © 2017 unagit. All rights reserved.
//

import Foundation


class Brain {
    
    enum BrainError: Error {
        case noBaseUnit
    }
    
    func getConvertedUnits(_ currentUnit: Unit, value: Double) -> [[String: String]] {
        
        
        let units = Unit.getUnits()
        var calculatedValues = [[String: String]]()
        
        
        do {
            // Get Base unit for current unit type
            let baseUnit = try getBaseUnit(currentUnit, all: units)
            
            // Get other units of the same Unit system as convertBaseUnit
            let unitsWithSameUnitType = units.filter() {$0.unitType == baseUnit.unitType && !$0.isBase }
            
            // Calculate values
            // Base unit goes first
            let baseValue = value * currentUnit.ratio
            
            calculatedValues.append([
                
                "name": baseUnit.name,
                "value": String(baseValue)
                
                ])
            
            // Other units from the same unit type follow next
            for unit in unitsWithSameUnitType {
                
                calculatedValues.append([
                    "name": unit.name,
                    "value": String(baseValue / unit.ratio)
                ])
            }
            
            
        // Errors handling
        } catch BrainError.noBaseUnit {
            print("Can't identify base unit for current unit type. Must be error in database data or in code.")
        
        } catch {
            print("Some other error, which is not thrown in code. Is it possible that it has been catched?")
        }
    
        return calculatedValues
    }
    
    private func getBaseUnit(_ currentUnit: Unit, all units: [Unit]) throws -> Unit {
        if currentUnit.isBase {
            return currentUnit
        
        } else {
            
            let arrayWithBaseUnit = units.filter {
                $0.isBase && ($0.unitType == currentUnit.unitType)
            }
            
            // Should only have one member in this array, otherwise db data is not correct
            if !(arrayWithBaseUnit.isEmpty || arrayWithBaseUnit.count > 1) {
            
                return arrayWithBaseUnit.first!
            
            } else {
                throw BrainError.noBaseUnit
                
            }
        }
    }
    
    
}
