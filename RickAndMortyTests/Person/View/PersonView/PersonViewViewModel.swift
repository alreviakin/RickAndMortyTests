//
//  PersonViewViewModel.swift
//  RickAndMortyTests
//
//  Created by Алексей Ревякин on 21.08.2023.
//

import Foundation

class PersonViewViewModel {
    func getTypeOrigin(from stringURL: String, completion: @escaping (String)->()) {
        NetworkManager.shared.getLocations(stringURL: stringURL) { location in
            guard let location else {
                completion("")
                return
            }
            completion(location.type ?? "")
        }
    }
}
