//
//  CardsTableView+DataSource.swift
//  Homework 21
//
//  Created by Aisaule Sibatova on 22.05.2023.
//

import  UIKit

// MARK: - UITableViewDataSource

extension CardsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.cards.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = model!.cards[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CardTableViewCell.identifier,
                for: indexPath
            ) as? CardTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}
