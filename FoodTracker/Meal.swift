//
//  Meal.swift
//  FoodTracker
//
//  Created by Joe Lucero on 6/29/17.
//  Copyright © 2017 Joe Lucero. All rights reserved.
//

import UIKit
import os.log

class Meal: NSObject, NSCoding {
    var name: String
    var rating: Int
    var photo: UIImage?
    
    // MARK: - Types
    struct PropertyKey {
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
    }
    
    // MARK: - NSCoding Methods
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(rating, forKey: PropertyKey.rating)
        aCoder.encode(photo, forKey: PropertyKey.photo)
    }
    
    // MARK: - Initializers
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("can not decode name for object",
                   log: OSLog.default,
                   type: .debug)
            return nil
        }
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating)
    
        self.init(name: name, rating: rating, photo: photo)
    }
    
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
    
    // MARK: - Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory,
                                                       in: .userDomainMask).first!
    
    static let ArchiveURL = Meal.DocumentsDirectory.appendingPathComponent("meals")
}
