//
//  InfoView.swift
//  RickAndMortyTests
//
//  Created by Алексей Ревякин on 20.08.2023.
//

import Foundation
import UIKit

class InfoView: UIView {
    private var backgroundView: BackgroundView = {
       let view = BackgroundView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private var speciesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = UIColor(hexString: "#C4C9CE")
        label.text = "Species:"
        return label
    }()
    private var typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = UIColor(hexString: "#C4C9CE")
        label.text = "Type:"
        return label
    }()
    private var genderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = UIColor(hexString: "#C4C9CE")
        label.text = "Gender:"
        return label
    }()
    private var personSpeciesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .white
        return label
    }()
    private var personTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .white
        return label
    }()
    private var personGenderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .white
        return label
    }()
    private lazy var labels: [[UIView]] = [
        [speciesLabel, personSpeciesLabel],
        [typeLabel, personTypeLabel],
        [genderLabel, personGenderLabel]
    ]
    
    private lazy var verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        return stack
    }()
    private var tableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    func configure(spesies: String, type: String, gender: String) {
        personSpeciesLabel.text = spesies
        personTypeLabel.text = type
        personGenderLabel.text = gender
        var stackArr: [UIStackView] = []
        for labelArray in labels {
            let stack = UIStackView(arrangedSubviews: labelArray)
            stack.axis = .horizontal
            stackArr.append(stack)
            stack.distribution = .equalCentering
        }
        for stak in stackArr {
            verticalStack.addArrangedSubview(stak)
        }
        addSubview(backgroundView)
        backgroundView.addSubview(verticalStack)
    }
    
    override func layoutSubviews() {
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            verticalStack.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 16),
            verticalStack.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -16),
            verticalStack.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 16),
            verticalStack.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -16),
        ])
    }
}
