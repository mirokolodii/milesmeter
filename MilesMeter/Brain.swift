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
        case noCurrentBaseUnit
        case noConvertBaseUnitId
        case noConvertBaseUnit
    }
    
    func getConvertedUnits(unitID: Int, value: Double) -> [[String: String]] {
        
        
        let units = Unit.getUnits()
        let currentUnit = units[unitID]
        var calculatedValuesDics = [[String: String]]()
        
        
        do {
            // Get base unit for current unit
            let currentBaseUnit = try getCurrentBaseUnit(currentUnit, units: units)
            
            // Get convert base unit
            let convertBaseUnit = try getConvertBaseUnit(currentBaseUnit, units: units)
            
            // Get other units of the same Unit system as convertBaseUnit
            let convertUnits = units.filter() {$0.unitSystemId == convertBaseUnit.unitSystemId && !$0.isBase }
            
            // Calculate values
            let baseValue: Double
            if currentUnit.isBase {
                baseValue = value
            } else {
                baseValue = value * currentUnit.ratio
            }
            
            let convertBaseValue = baseValue * currentBaseUnit.ratio
            
            // Prepare dictionary to return back to view controller
            calculatedValuesDics.append([convertBaseUnit.name: String(convertBaseValue)])
            for unit in convertUnits {
                calculatedValuesDics.append([unit.name: String(unit.ratio * convertBaseValue)])
            }
            
            
        // Errors handling
        } catch BrainError.noConvertBaseUnitId {
            print("No convert unit id record in base unit.")
        
        } catch BrainError.noConvertBaseUnit {
            print("Can't identify convert base unit from provided ID.")
        
        } catch BrainError.noCurrentBaseUnit  {
            print("Can't identify base unit for current unit. Error in database data or in code.")
        } catch {
            print("Some other error, which is not thrown in code. Is it possible that it has been catched?")
        }
    
        return calculatedValuesDics
    }
    
    private func getCurrentBaseUnit(_ currentUnit: Unit, units: [Unit]) throws -> Unit {
        if currentUnit.isBase {
            return currentUnit
        } else {
            
            
            let currentBaseUnitsArray = units.filter {
                $0.isBase && ($0.unitSystemId == currentUnit.unitSystemId)
            }
            
            // Should only get one member in this array, otherwise db data is not correct
            if !(currentBaseUnitsArray.isEmpty || currentBaseUnitsArray.count > 1) {
            
                return currentBaseUnitsArray[0]
            
            } else {
                throw BrainError.noCurrentBaseUnit
                
            }
        }
    }
    
    private func getConvertBaseUnit(_ currentBaseUnit: Unit, units: [Unit]) throws -> Unit {
        
        // Get convert base unit ID
        guard let convertUnitId = currentBaseUnit.convertUnitId else {
            throw BrainError.noConvertBaseUnitId
        }
        
        // Get convert base unit from ID
        let convertBaseUnitArray = units.filter() {$0.id == convertUnitId}
        guard convertBaseUnitArray.count == 1 else {
            throw BrainError.noConvertBaseUnit
        }
        return convertBaseUnitArray[0]
        
    }
    
    
    
}
