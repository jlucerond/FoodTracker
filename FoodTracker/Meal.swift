//
//  Meal.swift
//  FoodTracker
//
//  Created by Joe Lucero on 6/29/17.
//  Copyright © 2017 Joe Lucero. All rights reserved.
//

import UIKit

class Meal {
    var name: String
    var rating: Int
    var photo: UIImage?
    
    init?(name: String, rating: Int, photo: UIImage?) {
        guard !name.isEmpty else {
            return nil
        }
        
        guard rating >= 0 && rating <= 5 else {
            return nil
        }
            
        self.name = name
        self.rating = rating
        self.photo = photo
    }
}
