//
//  MealTableViewController.swift
//  FoodTracker
//
//  Created by Joe Lucero on 6/30/17.
//  Copyright © 2017 Joe Lucero. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
    
    // MARK: - Properties
    var meals: [Meal] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleMeals()
    }
    
    // MARK: - TableView Methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "MealTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                       for: indexPath) as? MealTableViewCell else {
                                                        fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        let meal = meals[indexPath.row]
        
        cell.nameLabel.text = meal.name
        cell.photoImageView.image = meal.photo
        cell.ratingControl.rating = meal.rating
        
        return cell
    }
    
    // MARK: - Private Methods
    private func loadSampleMeals() {
        guard let firstMeal = Meal(name: "Caprese Salad", rating: 4, photo: #imageLiteral(resourceName: "meal1")),
            let secondMeal = Meal(name: "Chicken & Potatoes", rating: 5, photo: #imageLiteral(resourceName: "meal2")),
            let thirdMeal = Meal(name: "Pasta with Meatballs", rating: 3, photo: #imageLiteral(resourceName: "meal3")) else {
            fatalError("Can't load the 3 sample meals")
        }
        
        meals.append(contentsOf: [firstMeal, secondMeal, thirdMeal])
    }
}
