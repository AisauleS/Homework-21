//
//  ViewController.swift
//  Homework 21
//
//  Created by Aisaule Sibatova on 17.05.2023.
//

import UIKit

final class CardsController: UIViewController {
    
    // MARK: - Properties
    private lazy var cardsView = self.view as? CardsView
    private let cardFetcher: LocalCardFetcher

    // MARK: - Lifecycle
    
    init(cardFetcher: LocalCardFetcher) {
        self.cardFetcher = cardFetcher
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = CardsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchCards()
    }

    // MARK: - Configuration
    
    private func setupView() {
        title = "Cards"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func fetchCards() {
        self.cardFetcher.fetchCards { card in
            guard let card = card else { return }
            self.cardsView?.configureView(with: card)
        }
    }
}
