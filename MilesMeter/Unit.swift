//
//  Unit.swift
//  MilesMeter
//
//  Created by Myroslav Kolodii on 03/03/2017.
//  Copyright © 2017 unagit. All rights reserved.
//

import Foundation


class Unit {
    
    let id: Int
    let name: String
    let aliases: [String]
    let shortname: String
    let isBase: Bool
    let ratio: Double
    let convertUnitId: Int?
    let unitType: Int
    let unitSystemId: Int
    
    init(id: Int, name: String, aliases: [String], shortname: String, isBase: Bool, ratio: Double, convertUnitId: Int?, unitType: Int, unitSystemId: Int) {
        
        self.id = id
        self.name = name
        self.aliases = aliases
        self.shortname = shortname
        self.isBase = isBase
        self.ratio = ratio
        self.convertUnitId = convertUnitId
        self.unitType = unitType
        self.unitSystemId = unitSystemId
        
        
    }

    
    static func getUnits() -> [Unit] {
        var allUnits = [Unit]()
        for unit in self.units {
            let newUnit = Unit(
                id: unit["id"] as! Int,
                name: unit["name"] as! String,
                aliases: unit["aliases"] as! [String],
                shortname: unit["shortname"] as! String,
                isBase: unit["isBase"] as! Bool,
                ratio: unit["ratio"] as! Double,
                convertUnitId: unit["convertUnitId"] as? Int,
                unitType: unit["unitType"] as! Int,
                unitSystemId: unit["unitSystemId"] as! Int
            )
            
            allUnits.append(newUnit)
        
        }
        
        return allUnits
    
    }

    private static let unitSystems = [
        [
            "name": "International System",
            "id": 0,

        ],
        
        [
            "name": "Imperial System",
            "id": 1
        ]
    ]
    
    private static let converts = [
        [],
        []
    
    ]
    
    private static let units = [
        [
            "id": 0,
            "name": "metre",
            "aliases": ["meter"],
            "shortname": "m",
            "isBase": true,
            "ratio": 0.3048,
            "convertUnitId": 1,
            "unitType": 0,
            "unitSystemId": 0
        ],
        
        [
            "id": 1,
            "name": "foot",
            "aliases": ["feet"],
            "shortname": "ft",
            "isBase": true,
            "ratio": 3.28084,
            "convertUnitId": 0,
            "unitType": 0,
            "unitSystemId": 1
        ],
        
        [
            "id": 2,
            "name": "inch",
            "aliases": ["inches"],
            "shortname": "in",
            "isBase": false,
            "ratio": 12.0,
            "unitType": 0,
            "unitSystemId": 1
        ],
        
        [
            "id": 3,
            "name": "yard",
            "aliases": ["yardes"],
            "shortname": "yd",
            "isBase": false,
            "ratio": 1.0/3.0,
            "unitType": 0,
            "unitSystemId": 1
        ],
        
        [
            "id": 4,
            "name": "chain",
            "aliases": ["chains"],
            "shortname": "ch",
            "isBase": false,
            "ratio": 1.0/66.0,
            "unitType": 0,
            "unitSystemId": 1
        ],
        
        [
            "id": 5,
            "name": "mile",
            "aliases": ["miles"],
            "shortname": "ml",
            "isBase": false,
            "ratio": 1.0/5280.0,
            "unitType": 0,
            "unitSystemId": 1
        ],
        
        [
            "id": 6,
            "name": "cable",
            "aliases": [],
            "shortname": "",
            "isBase": false,
            "ratio": 1.0/608.0,
            "unitType": 0,
            "unitSystemId": 1
        ],
        
        [
            "id": 7,
            "name": "nautical mile",
            "aliases": [],
            "shortname": "",
            "isBase": false,
            "ratio": 1.0/6080.0,
            "unitType": 0,
            "unitSystemId": 1
        ]

    
    
    ]
    
    // http://www.worldwidemetric.com/measurements.html
    
    private static let unitTypes = [
        
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
    
    
    
}

