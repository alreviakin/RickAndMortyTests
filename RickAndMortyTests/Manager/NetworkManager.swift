//
//  NetworkManager.swift
//  RickAndMortyTests
//
//  Created by Алексей Ревякин on 21.08.2023.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private let baseStringURL = "https://rickandmortyapi.com/api"
    
    func getLinks(completion: @escaping (Links)->()) {
        guard let url = URL(string: baseStringURL) else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data, let links = try? JSONDecoder().decode(Links.self, from: data) else {
                return
            }
            completion(links)
        }.resume()
    }
    
    func getCharacters(stringURL: String, completion: @escaping ([Result]?)->()) {
        guard let url = URL(string: stringURL) else {
            completion(nil)
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data, let characters = try? JSONDecoder().decode(Characters.self, from: data).results else {
                completion(nil)
                return
            }
        completion(characters)
        }.resume()
    }
    
    func getEpisode(stringURL: String, completion: @escaping (Episode?)->()) {
        guard let url = URL(string: stringURL) else {
            completion(nil)
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data, let episode = try? JSONDecoder().decode(Episode.self, from: data) else {
                completion(nil)
                return
            }
            completion(episode)
        }.resume()
    }
    
    func getLocations(stringURL: String, completion: @escaping (LocationModel?)->()) {
        guard let url = URL(string: stringURL) else {
            completion(nil)
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let data, let location = try? JSONDecoder().decode(LocationModel.self, from: data) else {
                completion(nil)
                return
            }
            completion(location)
        }.resume()
    }
}
