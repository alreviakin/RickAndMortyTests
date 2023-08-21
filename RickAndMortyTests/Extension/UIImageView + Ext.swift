//
//  UIImage + Ext.swift
//  RickAndMortyTests
//
//  Created by Алексей Ревякин on 21.08.2023.
//

import Foundation
import UIKit

extension UIImageView {
    func load(stringUrl: String) {
        guard let url = URL(string: stringUrl) else {
            self.image = nil
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
