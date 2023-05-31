//
//  Card.swift
//  Homework 21
//
//  Created by Aisaule Sibatova on 22.05.2023.
//

import Foundation

// MARK: - Card

struct CardsData: Decodable {
    var cards: [Card]
}

struct Card: Decodable {
    let name: String?
    let manaCost: String?
    let cmc: Int?
    let type: String?
    let rarity: String?
    let setName: String?
    let number: String?
    let multiverseid: String?
    let imageUrl: String?
    let printings: [String]?
}
