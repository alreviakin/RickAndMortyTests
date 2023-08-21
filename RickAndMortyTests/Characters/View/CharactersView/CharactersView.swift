//
//  CharacterView.swift
//  RickAndMortyTests
//
//  Created by Алексей Ревякин on 20.08.2023.
//

import UIKit

class CharactersView: UIView {
    
    weak var delegate: CharactersViewDelegate?
    
    private var charactersLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textColor = .white
        label.text = "Characters"
        return label
    }()
    private lazy var collectionView: UICollectionView = {
        let collecion = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collecion.translatesAutoresizingMaskIntoConstraints = false
        collecion.dataSource = delegate
        collecion.delegate = delegate
        collecion.backgroundColor = .clear
        collecion.register(CharacterCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collecion
    }()

    
    func configure() {
        addSubview(charactersLabel)
        addSubview(collectionView)
    }
    
    override func layoutSubviews() {
        NSLayoutConstraint.activate([
            charactersLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 18),
            charactersLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: charactersLabel.bottomAnchor, constant: 50),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
}
