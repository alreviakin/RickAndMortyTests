//
//  ChatacterCellViewModel.swift
//  RickAndMortyTests
//
//  Created by Алексей Ревякин on 20.08.2023.
//

import Foundation
import UIKit

class CharacterCellViewModel {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
