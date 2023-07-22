//
//  Extensions.swift
//  NetflixClonePractice
//
//  Created by Agnes Triselia Yudia on 22/07/23.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
