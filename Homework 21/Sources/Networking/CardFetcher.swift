//
//  NetworkDataFetcher.swift
//  Homework 21
//
//  Created by Aisaule Sibatova on 22.05.2023.
//

import Foundation
import Alamofire

protocol CardFetcher {
    func fetchCards(completion: @escaping (CardsData?) -> Void)
}

final class LocalCardFetcher: CardFetcher {
    func fetchCards(completion: @escaping (CardsData?) -> Void) {
        if let url = Bundle.main.url(forResource: "Cards", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(CardsData.self, from: data)
                completion(jsonData)
            } catch {
                print("error:\(error)")
                completion(nil)
            }
        }
    }
}

final class RemoteCardFetcher: CardFetcher {
    func fetchCards(completion: @escaping (CardsData?) -> Void) {
        let request = AF.request("https://api.magicthegathering.io/v1/cards")
        request.responseDecodable(of: CardsData.self) {(result) in
            guard let card = result.value else {return}
            completion(card)
        }
    }
}
