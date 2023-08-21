//
//  PersonTableViewCell.swift
//  RickAndMortyTests
//
//  Created by Алексей Ревякин on 20.08.2023.
//

import UIKit

class EpoisodeTableViewCell: UITableViewCell {
    var viewModel: EpisodeCellViewModel? {
        didSet {
            guard let viewModel else { return }
            nameEpisodeLabel.text = viewModel.name
            episodeLabel.text = viewModel.episode
            dataEpisodeLabel.text = viewModel.date
        }
    }
    
    private var background: BackgroundView = {
        let view = BackgroundView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private var nameEpisodeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .white
        label.text = "Pilot"
        return label
    }()
    private var episodeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textColor = UIColor(hexString: "#47C60B")
        label.text = "Episode: 1, Season: 1"
        return label
    }()
    private var dataEpisodeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = UIColor(hexString: "#93989C")
        label.text = "December 2, 2013"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        contentView.addSubview(background)
        contentView.addSubview(nameEpisodeLabel)
        contentView.addSubview(episodeLabel)
        contentView.addSubview(dataEpisodeLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            background.leadingAnchor.constraint(equalTo: leadingAnchor),
            background.trailingAnchor.constraint(equalTo: trailingAnchor),
            background.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            background.topAnchor.constraint(equalTo: topAnchor),
            
            nameEpisodeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameEpisodeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            
            episodeLabel.leadingAnchor.constraint(equalTo: nameEpisodeLabel.leadingAnchor),
            episodeLabel.topAnchor.constraint(equalTo: nameEpisodeLabel.bottomAnchor, constant: 16),
            
            dataEpisodeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            dataEpisodeLabel.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -16)
        ])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        
    }
}
