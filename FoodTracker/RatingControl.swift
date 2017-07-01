//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Joe Lucero on 6/29/17.
//  Copyright © 2017 Joe Lucero. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
    // MARK: - Properties
    private var ratingButtons: [UIButton] = []
    var rating = 0 {
        didSet {
            updateButtonSelectionState()
        }
    }
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setUpButtons()
        }
    }
    
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setUpButtons()
        }
    }
    
    // MARK: - Initialization Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setUpButtons()
    }
    
    // MARK: - Button Action
    func ratingButtonTapped(button: UIButton) {
        guard let index = ratingButtons.index(of: button) else {
            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
        }
        
        let selectedRating = index + 1
        
        if selectedRating == rating {
            rating = 0
        } else {
            rating = selectedRating
        }
    }
    
    // MARK: - Private Methods
    private func setUpButtons() {
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar",
                                 in: bundle,
                                 compatibleWith: self.traitCollection)
        let highLightedStar = UIImage(named: "highlightedStar",
                                      in: bundle,
                                      compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "emptyStar",
                                in: bundle,
                                compatibleWith: self.traitCollection)
        
        for index in 0 ..< starCount {
            let button = UIButton()
            button.setImage(filledStar, for: .selected)
            button.setImage(highLightedStar, for: .highlighted)
            button.setImage(emptyStar, for: .normal)
            button.setImage(highLightedStar, for: [.selected, .highlighted])
            
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            button.accessibilityLabel = "Set \(index + 1) star rating"
            
            button.addTarget(self,
                             action: #selector(ratingButtonTapped(button:)),
                             for: UIControlEvents.touchUpInside)
            
            addArrangedSubview(button)
            ratingButtons.append(button)
        }
            updateButtonSelectionState()
    }
    
    private func updateButtonSelectionState() {
        for (index, button) in ratingButtons.enumerated() {
            button.isSelected = rating > index
            
            let hintString: String?
            
            if rating == index + 1 {
                hintString = "Tap to reset the rating to zero"
            } else {
                hintString = nil
            }
            
            let valueString: String
            
            switch index {
            case 0:
                valueString = "No rating yet"
            case 1:
                valueString = "1 star set"
            default:
                valueString = "\(index) stars set"
            }
            
            button.accessibilityHint = hintString
            button.accessibilityValue = valueString
        }
    }
    
}
