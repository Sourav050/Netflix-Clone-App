//
//  Extensions.swift
//  NetflixClone
//
//  Created by Sourav Choubey on 02/02/24.
//

import Foundation


extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
        
    }
}
