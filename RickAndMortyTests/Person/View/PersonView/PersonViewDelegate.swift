//
//  PersonViewDelegate.swift
//  RickAndMortyTests
//
//  Created by Алексей Ревякин on 20.08.2023.
//

import Foundation
import UIKit

protocol PersonViewDelegate: AnyObject, UITableViewDataSource, UITableViewDelegate {
    func getHeightTable() -> CGFloat
    func back()
}
