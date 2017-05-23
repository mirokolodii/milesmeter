class Unit {
	let name: String
	let aliases: [String]?
	let unitSystem: UnitSystem
	let isBase: Bool
	let ratio: Double
	let unitType: UnitType
    
    init(name: String, aliases: [String]?, unitSystem: UnitSystem, isBase: Bool, ratio: Double, unitType: UnitType) {
        
        self.name = name
        self.aliases = aliases
        self.unitSystem = unitSystem
        self.isBase = isBase
        self.ratio = ratio
        self.unitType = unitType
        
    }
    


    static func getUnits() -> [Unit] {
        
        var allUnits = [Unit]()
        
        for unit in self.units {
            
            let newUnit = Unit(
    
                name: unit[Constants.name] as! String,
                aliases: unit[Constants.aliases] as? [String],
                unitSystem: unit[Constants.unitSystem] as! UnitSystem,
                isBase: unit[Constants.isBase] as! Bool,
                ratio: unit[Constants.ratio] as! Double,
                unitType: unit[Constants.unitType] as! UnitType
                
                
            )
            
            allUnits.append(newUnit)
            
        }
        
        return allUnits
        
    }
}

private typealias ConstantsForUnitParameterNames = Unit

extension ConstantsForUnitParameterNames {
    
	enum Constants: String {
		case name = "name"
		case aliases = "aliases"
		case unitSystem = "unitSystem"
		case isBase = "isBase"
		case ratio = "ratio"
		case unitType = "unitType"
	}
}

enum UnitType {
	case length, area, volume, mass, time, temperature, frequency, light
}

enum UnitSystem {
	case international, imperial, US, nonSI
}

extension Unit {

}

// MARK: Define Length Units
typealias LengthUnits = Unit

extension LengthUnits {
	fileprivate static let units: [[Constants: Any]] = [
		// Length
		[
			.name: "metre",
			.aliases: ["meter"],
			.unitSystem: UnitSystem.international,
			.isBase: true,
			.ratio: 1.0,
			.unitType: UnitType.length
		],
		
		[
			.name: "centimetre",
			.aliases: ["centimeter", "cm"],
			.unitSystem: UnitSystem.international,
			.isBase: false,
			.ratio: 1.0e-2,
			.unitType: UnitType.length
		],
		
		[
			.name: "millimetre",
			.aliases: ["millimeter", "mm"],
			.unitSystem: UnitSystem.international,
			.isBase: false,
			.ratio: 1.0e-3,
			.unitType: UnitType.length
		],
		
		[
			.name: "micrometre",
			.aliases: ["micrometer"],
			.unitSystem: UnitSystem.international,
			.isBase: false,
			.ratio: 1.0e-6,
			.unitType: UnitType.length
		],
		
		[
			.name: "decimetre",
			.aliases: ["decimeter", "dm"],
			.unitSystem: UnitSystem.international,
			.isBase: false,
			.ratio: 1.0e-1,
			.unitType: UnitType.length
		],
		
		[
			.name: "kilometre",
			.aliases: ["kilometer", "km"],
			.unitSystem: UnitSystem.international,
			.isBase: false,
			.ratio: 1.0e3,
			.unitType: UnitType.length
		],
		
		[
			.name: "decametre",
			.aliases: ["decameter"],
			.unitSystem: UnitSystem.international,
			.isBase: false,
			.ratio: 1.0e1,
			.unitType: UnitType.length
		],
		
		[
			.name: "hectometre",
			.aliases: ["hectometer"],
			.unitSystem: UnitSystem.international,
			.isBase: false,
			.ratio: 1.0e2,
			.unitType: UnitType.length
		],
		
		[
			.name: "mil",
			.aliases: ["thou"],
			.unitSystem: UnitSystem.imperial,
			.isBase: false,
			.ratio: 2.54e-5,
			.unitType: UnitType.length
		],
		
		[
			.name: "line",
			.aliases: [],
			.unitSystem: UnitSystem.imperial,
			.isBase: false,
			.ratio: 0.0021,
			.unitType: UnitType.length
		],
		
		[
			.name: "inch",
			.aliases: [],
			.unitSystem: UnitSystem.imperial,
			.isBase: false,
			.ratio: 0.0254,
			.unitType: UnitType.length
		],
		
		[
			.name: "foot",
			.aliases: [],
			.unitSystem: UnitSystem.imperial,
			.isBase: false,
			.ratio: 0.3048,
			.unitType: UnitType.length
		],
		
		[
			.name: "yard",
			.aliases: [],
			.unitSystem: UnitSystem.imperial,
			.isBase: false,
			.ratio: 0.9144,
			.unitType: UnitType.length
		],
		
		[
			.name: "mile",
			.aliases: [],
			.unitSystem: UnitSystem.imperial,
			.isBase: false,
			.ratio: 1609.344,
			.unitType: UnitType.length
		],
		
		[
			.name: "nautical mile",
			.aliases: [],
			.unitSystem: UnitSystem.imperial,
			.isBase: false,
			.ratio: 1852.0,
			.unitType: UnitType.length
		],
		
		[
			.name: "nautical league",
			.aliases: [],
			.unitSystem: UnitSystem.imperial,
			.isBase: false,
			.ratio: 5556.0,
			.unitType: UnitType.length
		],
		
		[
			.name: "fermi",
			.aliases: [],
			.unitSystem: UnitSystem.nonSI,
			.isBase: false,
			.ratio: 1.0e-15,
			.unitType: UnitType.length
		],
		
		[
			.name: "micron",
			.aliases: [],
			.unitSystem: UnitSystem.nonSI,
			.isBase: false,
			.ratio: 1.0e-6,
			.unitType: UnitType.length
		]
	]
	
	

}
