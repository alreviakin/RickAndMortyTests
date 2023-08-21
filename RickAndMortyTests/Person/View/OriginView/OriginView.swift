//
//  OriginView.swift
//  RickAndMortyTests
//
//  Created by Алексей Ревякин on 20.08.2023.
//

import Foundation
import UIKit

class OroginView: UIView {
    private var backgroundView: BackgroundView = {
       let backgroundView = BackgroundView()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        return backgroundView
    }()
    private var imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "planet")
        return imageView
    }()
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .white
        return label
    }()
    private var typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textColor = UIColor(hexString: "#47C60B")
        return label
    }()
    
    func configure(name: String, type: String) {
        nameLabel.text = name
        typeLabel.text = type
        addSubview(backgroundView)
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(typeLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            imageView.widthAnchor.constraint(equalToConstant: 64),
            
            nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            
            typeLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            typeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8)
        ])
    }
    
    func updateType(type: String) {
        typeLabel.text = type
    }
}
