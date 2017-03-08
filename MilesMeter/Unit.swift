//
//  Unit.swift
//  MilesMeter
//
//  Created by Myroslav Kolodii on 03/03/2017.
//  Copyright © 2017 unagit. All rights reserved.
//

import Foundation


class Unit {
    
    
    private let unitSystems = [
        [
            "name": "International System",
            "id": 0,

        ],
        
        [
            "name": "Imperial System",
            "id": 1
        ]
    ]
    
    private let units = [
        [
            "id": 0,
            "name": "metre",
            "aliases": ["meter"],
            "shortname": "m",
            "isBase": true,
            "ratio": 1,
            "unitType": 0,
            "unitSystemId": 0
        ],
        
        [
            "id": 1,
            "name": "foot",
            "aliases": ["feet"],
            "shortname": "ft",
            "isBase": true,
            "ratio": 1,
            "unitType": 0,
            "unitSystemId": 1
        ],
        
        [
            "id": 2,
            "name": "inch",
            "aliases": ["inches"],
            "shortname": "in",
            "isBase": false,
            "ratio": 12,
            "unitType": 0,
            "unitSystemId": 1
        ],
        
        [
            "id": 3,
            "name": "yard",
            "aliases": ["yardes"],
            "shortname": "yd",
            "isBase": false,
            "ratio": 1/3,
            "unitType": 0,
            "unitSystemId": 1
        ],
        
        [
            "id": 4,
            "name": "chain",
            "aliases": ["chains"],
            "shortname": "ch",
            "isBase": false,
            "ratio": 1/66,
            "unitType": 0,
            "unitSystemId": 1
        ],
        
        [
            "id": 5,
            "name": "mile",
            "aliases": ["miles"],
            "shortname": "ml",
            "isBase": false,
            "ratio": 1/5280,
            "unitType": 0,
            "unitSystemId": 1
        ],
        
        [
            "id": 6,
            "name": "cable",
            "aliases": [],
            "shortname": "",
            "isBase": false,
            "ratio": 1/608,
            "unitType": 0,
            "unitSystemId": 1
        ],
        
        [
            "id": 7,
            "name": "nautical mile",
            "aliases": [],
            "shortname": "",
            "isBase": false,
            "ratio": 1/6080,
            "unitType": 0,
            "unitSystemId": 1
        ]

    
    
    ]
    
    // http://www.worldwidemetric.com/measurements.html
    
    private let unitTypes = [
        
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
    
    init() {
        
        
        
    }
    
    
}
