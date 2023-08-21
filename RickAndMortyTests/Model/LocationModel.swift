//
//  Location.swift
//  RickAndMortyTests
//
//  Created by Алексей Ревякин on 21.08.2023.
//
import Foundation

struct LocationModel: Codable {
    let id: Int?
    let name, type, dimension: String?
    let residents: [String]?
    let url: String?
    let created: String?
}
