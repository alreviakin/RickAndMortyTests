//
//  CharacterViewModel.swift
//  RickAndMortyTests
//
//  Created by Алексей Ревякин on 21.08.2023.
//

import Foundation

class CharactersViewModel {
    weak var delegate: CharactersViewControllerDelegate?
    var networkManager = NetworkManager.shared
    
    var characters: [Result] = [] {
        didSet {
            guard let delegate else { return }
            delegate.reloadeDate()
        }
    }
    var links: Links?
    
    init() {
        getLinks()
    }
    
    private func getLinks() {
        networkManager.getLinks {[weak self] links in
            guard let self else {
                return
            }
            self.links = links
            getCharacter()
        }
    }
    
    private func getCharacter() {
        guard let stringURL = links?.characters else {
            return }
        networkManager.getCharacters(stringURL: stringURL) { [weak self] characters in
            guard let self, let characters else {
                return }
            self.characters = characters
        }
    }
    
    func numberOfRows() -> Int {
        return characters.count
    }
    
    func getCharacterCell(for indexPath: IndexPath) -> CharacterCellViewModel {
        let character = characters[indexPath.row]
        return CharacterCellViewModel(name: character.name ?? "", image: character.image ?? "")
    }
    
    func getPersonViewModel(for indexPath: IndexPath) -> PersonViewModel {
        return PersonViewModel(character: characters[indexPath.row])
    }
}
