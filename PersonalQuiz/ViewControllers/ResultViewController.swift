//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by abd ul’Karim 📚 on 14.04.2024.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculateResult()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func calculateResult() {
        var quantityOfAnimals: [Animal: Int] = [:]
        let animals = answers.map { $0.animal }
        
        for animal in animals {
            if let animalTypeCount = quantityOfAnimals[animal] {
                quantityOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                quantityOfAnimals[animal] = 1
            }
        }
        
        let sortedQuantityOfAnimals = quantityOfAnimals.sorted { $0.value > $1.value }
        guard let moreQuantityOfAnimals = sortedQuantityOfAnimals.first?.key else {return}
        
        updateUI(with: moreQuantityOfAnimals)
    }
    
    private func updateUI(with animal: Animal) {
        animalLabel.text = "Вы - \(animal.rawValue)!"
        descriptionLabel.text = animal.definition
    }
    
}
