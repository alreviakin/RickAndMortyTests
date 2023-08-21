//
//  EpisodeManager.swift
//  RickAndMortyTests
//
//  Created by Алексей Ревякин on 21.08.2023.
//

import Foundation

class EpisodeManager {
    func convertEpisode(from episodeString: String) -> String {
        var convertString = "Episode: "
        var arrayCharacter = Array(episodeString)
        if arrayCharacter[1] != "0" {
            convertString.append(arrayCharacter[1])
        }
        convertString.append(arrayCharacter[2])
        convertString.append(", Season: ")
        if arrayCharacter[4] != "0" {
            convertString.append(arrayCharacter[4])
        }
        convertString.append(arrayCharacter[5])
        return convertString
    }
}
