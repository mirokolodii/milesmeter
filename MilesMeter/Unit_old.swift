//
//  Unit.swift
//  MilesMeter
//
//  Created by Myroslav Kolodii on 03/03/2017.
//  Copyright © 2017 unagit. All rights reserved.
//

import Foundation


class Unit_old {
    
    let id: Int
    let name: String
    let aliases: [String]
    let shortname: String
    let isBase: Bool
    let ratio: Double
    let convertUnitId: Int?
    let unitType: UnitType
    let unitSystem: UnitSystem
    
    init(id: Int, name: String, aliases: [String], shortname: String, isBase: Bool, ratio: Double, convertUnitId: Int?, unitType: UnitType, unitSystem: UnitSystem) {
        
        self.id: id
        self.name: name
        self.aliases: aliases
        self.shortname: shortname
        self.isBase: isBase
        self.ratio: ratio
        self.convertUnitId: convertUnitId
        self.unitType: unitType
        self.unitSystem: unitSystem
        
        
    }

    
    static func getUnits() -> [Unit] {
        var allUnits: [Unit]()
        for unit in self.units {
            let newUnit: Unit(
                id: unit["id"] as! Int,
                name: unit["name"] as! String,
                aliases: unit["aliases"] as! [String],
                shortname: unit["shortname"] as! String,
                isBase: unit["isBase"] as! Bool,
                ratio: unit["ratio"] as! Double,
                convertUnitId: unit["convertUnitId"] as? Int,
                unitType: unit["unitType"] as! UnitType,
                unitSystem: unit["unitSystem"] as! UnitSystem
            )
            
            allUnits.append(newUnit)
        
        }
        
        return allUnits
    
    }

    
    
    private static let converts: [
        [],
        []
    
    ]
    
    private static let units: [
        
        // Lenght 
        
        [
            "id": 0,
            "name": "metre",
            "aliases": ["meter"],
            "shortname": "m",
            "isBase": true,
            "ratio": 0.3048,
            "convertUnitId": 1,
            "unitType": UnitType.length,
            "unitSystem": UnitSystem.international
        ],
        
        [
            "id": 1,
            "name": "foot",
            "aliases": ["feet"],
            "shortname": "ft",
            "isBase": true,
            "ratio": 3.28084,
            "convertUnitId": 0,
            "unitType": UnitType.length,
            "unitSystem": UnitSystem.imperial
        ],
        
        [
            "id": 2,
            "name": "inch",
            "aliases": ["inches"],
            "shortname": "in",
            "isBase": false,
            "ratio": 12.0,
            "unitType": UnitType.length,
            "unitSystem": UnitSystem.imperial
        ],
        
        [
            "id": 3,
            "name": "yard",
            "aliases": ["yardes"],
            "shortname": "yd",
            "isBase": false,
            "ratio": 1.0/3.0,
            "unitType": UnitType.length,
            "unitSystem": UnitSystem.imperial
        ],
        
        [
            "id": 4,
            "name": "chain",
            "aliases": ["chains"],
            "shortname": "ch",
            "isBase": false,
            "ratio": 1.0/66.0,
            "unitType": UnitType.length,
            "unitSystem": UnitSystem.imperial
        ],
        
        [
            "id": 5,
            "name": "mile",
            "aliases": ["miles"],
            "shortname": "ml",
            "isBase": false,
            "ratio": 1.0/5280.0,
            "unitType": UnitType.length,
            "unitSystem": UnitSystem.imperial
        ],
        
        [
            "id": 6,
            "name": "cable",
            "aliases": [],
            "shortname": "",
            "isBase": false,
            "ratio": 1.0/608.0,
            "unitType": UnitType.length,
            "unitSystem": UnitSystem.imperial
        ],
        
        [
            "id": 7,
            "name": "nautical mile",
            "aliases": [],
            "shortname": "",
            "isBase": false,
            "ratio": 1.0/6080.0,
            "unitType": UnitType.length,
            "unitSystem": UnitSystem.imperial
        ],
        
        
        // Area
        [
            "id": 8,
            "name": "are",
            "aliases": [],
            "shortname": "are",
            "isBase": true,
            "ratio": 1.0/100.0,
            "unitType": UnitType.area,
            "unitSystem": UnitSystem.are
        ],
        
        [
            "id": 9,
            "name": "hectare",
            "aliases": [],
            "shortname": "",
            "isBase": false,
            "ratio": 1.0/100.0,
            "unitType": UnitType.area,
            "unitSystem": UnitSystem.are
        ]

    
    
    ]
    
    // http://www.worldwidemetric.com/measurements.html
    
    enum UnitType {
        case length
        case area
        case volume
        case temperature
        case pressure
        case weight
        case density
        case time
    }
    
    enum UnitSystem {
        case international
        case imperial
        case are
    }
    
    /*
     
     private static let unitSystems: [
     [
     "name": "International System",
     "id": 0,
     
     ],
     
     [
     "name": "Imperial System",
     "id": 1
     ]
     ]
     
     
    private static let unitTypes: [
        
        [
            "id": 0,
            "name": "length"
        ],
        
        [
            "id": 1,
            "name": "area"
        ],
        
        [
            "id": 2,
            "name": "volume"
        ],
        
        [
            "id": 3,
            "name": "temperature"
        ],
        
        [
            "id": 4,
            "name": "pressure"
        ],
        
        [
            "id": 5,
            "name": "weight"
        ]
        
    ]
    
 */
    
}
 

