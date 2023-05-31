//
//  CardsView.swift
//  Homework 21
//
//  Created by Aisaule Sibatova on 22.05.2023.
//

import UIKit
import SnapKit

final class CardsView: UIView {
    
    // MARK: - Propersties
    
    var model: CardsData?
    
    // MARK: - Configuration
    
    func configureView(with model: CardsData) {
        self.model = model
    }
    
    // MARK: - Views
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CardTableViewCell.self, forCellReuseIdentifier: CardTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    // MARK: - Initial
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .red
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Settings
    
    private func setupHierarchy() {
        addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.snp.makeConstraints {make in
            make.edges.equalTo(self)
        }
    }
}
