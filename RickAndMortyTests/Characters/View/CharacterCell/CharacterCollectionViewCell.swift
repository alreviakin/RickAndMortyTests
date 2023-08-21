//
//  CharacterCollectionViewCell.swift
//  RickAndMortyTests
//
//  Created by Алексей Ревякин on 20.08.2023.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    var viewModel: CharacterCellViewModel? {
        didSet {
            guard let viewModel else { return }
            characterImageView.load(stringUrl: viewModel.image)
            nameLabel.text = viewModel.name
        }
    }
    
    private var characterImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    private var nameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    private var characterBacgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hexString: "#262A38")
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        contentView.addSubview(characterBacgroundView)
        contentView.addSubview(characterImageView)
        contentView.addSubview(nameLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            characterBacgroundView.topAnchor.constraint(equalTo: contentView.topAnchor),
            characterBacgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            characterBacgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            characterBacgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            characterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            characterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            characterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            characterImageView.heightAnchor.constraint(equalToConstant: 140),
            
            nameLabel.leadingAnchor.constraint(equalTo: characterImageView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: characterImageView.trailingAnchor),
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 16)
        ])
    }
    
    
}
