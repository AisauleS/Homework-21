//
//  CardsTableView+Delegate.swift
//  Homework 21
//
//  Created by Aisaule Sibatova on 22.05.2023.
//

import UIKit

// MARK: - UITableViewDataSource

extension CardsView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

