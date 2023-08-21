//
//  PersonViewModel.swift
//  RickAndMortyTests
//
//  Created by Алексей Ревякин on 21.08.2023.
//

import Foundation

class PersonViewModel {
    weak var delegate: PersonViewControllerDelegate?
    
    private var character: Result
    private var episodes: [Episode] = [] {
        didSet {
            delegate?.relodeData()
        }
    }
    
    init(character: Result) {
        self.character = character
        guard let episodes = character.episode else { return }
        let group = DispatchGroup()
        var episodesArr: [Episode] = []
        for episodeStringURL in episodes {
            group.enter()
            NetworkManager.shared.getEpisode(stringURL: episodeStringURL) { episode in
                guard let episode else { return }
                episodesArr.append(episode)
                group.leave()
            }
        }
        group.notify(queue: .main) { [weak self] in
            guard let self else { return }
            self.episodes = episodesArr
        }
    }
    
    func getCharacter() -> Result {
        return character
    }
    
    func getEpisodeCellViewModel(for indexPath: IndexPath) -> EpisodeCellViewModel {
        return EpisodeCellViewModel(episode: episodes[indexPath.row])
    }
    
    func numberOfRows() -> Int {
        return episodes.count
    }
}
