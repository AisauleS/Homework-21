//
//  CardCell.swift
//  Homework 21
//
//  Created by Aisaule Sibatova on 22.05.2023.
//

import UIKit
import SnapKit
import Alamofire

class CardTableViewCell: UITableViewCell {
    
    // MARK: - Propersties
    
    static let identifier = "CardTableViewCell"

    private var imageDownloadTask: URLSessionDataTask?

    // MARK: - Configuration
    
    func configure(with model: Card) {
        label.text = model.name
        guard let imageURL = model.imageUrl else {
            return
        }
        imageDownloadTask = URLSession.shared.dataTask(with: URLRequest(url: URL(string: imageURL)!), completionHandler: { [weak self] (data, response, error) in
            guard let data = data else {
                return
            }
            DispatchQueue.main.async {
                self?.iconImageView.image = UIImage(data: data)
            }
        })
        imageDownloadTask?.resume()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageDownloadTask?.cancel()
    }
    
    // MARK: - Views
    
    private let iconContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 6
        view.backgroundColor = .white
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    // MARK: - Initial
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Settings
    
    private func setupHierarchy() {
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        contentView.addSubview(label)
        contentView.clipsToBounds = true
    }
    
    private func setupLayout() {
        iconContainer.snp.makeConstraints {make in
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(79)
            make.width.equalTo(79)
            make.centerY.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints {make in
            make.top.equalToSuperview().offset(3)
            make.bottom.equalToSuperview().offset(-3)
            make.leading.equalToSuperview().offset(3)
            make.trailing.equalToSuperview().offset(-3)
        }
        
        label.snp.makeConstraints {make in
            make.leading.equalTo(iconContainer.snp.leading).offset(82)
            make.centerY.equalToSuperview()
            
        }
    }
}
