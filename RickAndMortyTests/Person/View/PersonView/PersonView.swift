//
//  PersonView.swift
//  RickAndMortyTests
//
//  Created by Алексей Ревякин on 20.08.2023.
//

import UIKit

class PersonView: UIView {
    weak var delegate: PersonViewDelegate?
    
    private var scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.bounces = false
        return scrollView
    }()
    private var contentView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    private lazy var backButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(back), for: .touchUpInside)
        return button
    }()
    private var personImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "Rick")
        return imageView
    }()
    private var personNameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .white
        label.text = "Rick Sanchez"
        label.textAlignment = .center
        return label
    }()
    private var personStatusLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = UIColor(hexString: "#47C60B")
        label.text = "Alive"
        label.textAlignment = .center
        return label
    }()
    private var infoLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .white
        label.text = "Info"
        return label
    }()
    private var originLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .white
        label.text = "Origin"
        return label
    }()
    private var episodeLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .white
        label.text = "Episodes"
        return label
    }()
    private var infoView: InfoView = {
       let infoView = InfoView()
        infoView.translatesAutoresizingMaskIntoConstraints = false
        return infoView
    }()
    private var originView: OroginView = {
        let originView = OroginView()
        originView.translatesAutoresizingMaskIntoConstraints = false
        return originView
    }()
    private lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isScrollEnabled = false
        tableView.delegate = delegate
        tableView.dataSource = delegate
        tableView.backgroundColor = .clear
        tableView.allowsSelection = false
        tableView.register(EpoisodeTableViewCell.self, forCellReuseIdentifier: "tableCell")
        return tableView
    }()
    
    func configure() {
        backgroundColor = UIColor(hexString: "#040C1E")
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(backButton)
        contentView.addSubview(personImageView)
        contentView.addSubview(personNameLabel)
        contentView.addSubview(personStatusLabel)
        contentView.addSubview(infoLabel)
        contentView.addSubview(infoView)
        contentView.addSubview(originLabel)
        contentView.addSubview(originView)
        contentView.addSubview(episodeLabel)
        contentView.addSubview(tableView)
    }
    
    override func layoutSubviews() {
        let scrollContentLayout = scrollView.contentLayoutGuide
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollContentLayout.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollContentLayout.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollContentLayout.bottomAnchor),
            contentView.topAnchor.constraint(equalTo: scrollContentLayout.topAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            backButton.bottomAnchor.constraint(equalTo: personImageView.topAnchor, constant: -24),
            backButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            backButton.widthAnchor.constraint(equalToConstant: 24),
            backButton.heightAnchor.constraint(equalToConstant: 24),
            
            personImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            personImageView.widthAnchor.constraint(equalToConstant: 148),
            personImageView.heightAnchor.constraint(equalToConstant: 148),
            
            personNameLabel.topAnchor.constraint(equalTo: personImageView.bottomAnchor, constant: 24),
            personNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            personNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            personNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            personStatusLabel.topAnchor.constraint(equalTo: personNameLabel.bottomAnchor, constant: 8),
            personStatusLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            personStatusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            personStatusLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            infoLabel.topAnchor.constraint(equalTo: personStatusLabel.bottomAnchor, constant: 24),
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            
            infoView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 16),
            infoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            infoView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            infoView.heightAnchor.constraint(equalToConstant: 124),
            
            originLabel.topAnchor.constraint(equalTo: infoView.bottomAnchor, constant: 24),
            originLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            
            originView.topAnchor.constraint(equalTo: originLabel.bottomAnchor, constant: 16),
            originView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            originView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            originView.heightAnchor.constraint(equalToConstant: 80),
            
            episodeLabel.topAnchor.constraint(equalTo: originView.bottomAnchor, constant: 24),
            episodeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            
            tableView.topAnchor.constraint(equalTo: episodeLabel.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    func update(character: Result) {
        personNameLabel.text = character.name ?? ""
        personStatusLabel.text = character.status?.rawValue ?? ""
        personImageView.load(stringUrl: character.image ?? "")
        let type = character.type ?? ""
        infoView.configure(
            spesies: character.species?.rawValue ?? "",
            type: type.isEmpty ? "None" : type,
            gender: character.gender?.rawValue ?? "")
        originView.configure(
            name: character.origin?.name ?? "",
            type: "")
        guard let stringURL = character.origin?.url else { return }
        PersonViewViewModel().getTypeOrigin(from: stringURL) { [weak self] originType in
            guard let self else { return }
            DispatchQueue.main.async {
                self.originView.updateType(type: originType)
            }
        }
    }
    
    func reloadData() {
        tableView.reloadData()
        guard let delegate = delegate else { return }
        NSLayoutConstraint.activate([
            tableView.heightAnchor.constraint(equalToConstant: delegate.getHeightTable()),
            personImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: delegate.getHeightTable() > 102 ? 60 : 108),
        ])
    }
    
    @objc func back() {
        delegate?.back()
    }
}
