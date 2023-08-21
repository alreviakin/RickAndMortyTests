//
//  Episode.swift
//  RickAndMortyTests
//
//  Created by Алексей Ревякин on 21.08.2023.
//

struct Episode: Codable {
    let id: Int?
    let name, airDate, episode: String?
    let characters: [String]?
    let url: String?
    let created: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}
