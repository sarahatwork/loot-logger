//
//  Item.swift
//  LootLogger
//
//  Created by Sarah Mogin on 2/14/23.
//

import UIKit

class Item: Equatable {
    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    var dateCreated: Date
    
    init(name: String, serialNumber: String?, valueInDollars: Int) {
        self.name = name
        self.serialNumber = serialNumber
        self.valueInDollars = valueInDollars
        self.dateCreated = Date()
    }
    
    convenience init() {
        let adjectives = ["Fluffy", "Shiny", "Red"]
        let nouns = ["Apple", "Knife", "Chihuahua"]
        let randomName = "\(adjectives.randomElement()!) \(nouns.randomElement()!)"
        let randomValue = Int.random(in: 0..<100)
        let randomSerialNumber = UUID().uuidString.components(separatedBy: "-").first!
        self.init(name: randomName, serialNumber: randomSerialNumber, valueInDollars: randomValue)
    }
    
    static func ==(lhs: Item, rhs: Item) -> Bool {
        return lhs.name == rhs.name
            && lhs.serialNumber == rhs.serialNumber
            && lhs.valueInDollars == rhs.valueInDollars
            && lhs.dateCreated == rhs.dateCreated
    }
}
