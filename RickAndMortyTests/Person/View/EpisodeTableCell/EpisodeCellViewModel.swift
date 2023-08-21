//
//  EpisodeCellViewModel.swift
//  RickAndMortyTests
//
//  Created by Алексей Ревякин on 20.08.2023.
//

import Foundation

class EpisodeCellViewModel {
    var name: String
    var date: String
    var episode: String = ""
    
    init(episode: Episode) {
        name = episode.name ?? ""
        date = episode.airDate ?? ""
        if let episodeString = episode.episode {
            self.episode = EpisodeManager().convertEpisode(from: episodeString)
        }
    }
}
