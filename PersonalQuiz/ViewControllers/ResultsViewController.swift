//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by brubru on 20.12.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    
    @IBOutlet weak var yourNameLabel: UILabel!
    @IBOutlet weak var yourMessageLabel: UILabel!
    
    var answersResult: [Answer]!
    private var animalType: AnimalType!
    
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результат в соответсвии с этим животным
    // 4. Избавится от кнопки возврата назад на экран результатов


    override func viewDidLoad() {
        super.viewDidLoad()
        
        animalType = countAnimals()
        
        yourNameLabel.text = "Вы - \(animalType.rawValue)!"
        yourMessageLabel.text = animalType.definition
        
        navigationItem.setHidesBackButton(true, animated: false)

    }

}

extension ResultsViewController {
    
    private  func countAnimals() -> AnimalType {
        
        var indexOutside = 0
        var indexInside = 0
        var numberOfRepetitions = 1;
        var number = 0;
        var valueAnimal: AnimalType = .cat
        
        while indexOutside < answersResult.count {
            indexInside = indexOutside
            while indexInside < answersResult.count {
                //вот не придумал я способ как избежать квадратных скобок:)
                let firstResult =  answersResult[indexInside]
                let secondResult = answersResult[indexOutside]
                if firstResult.type == secondResult.type{
                    number += 1
                }
                //если будет одинаковое количество животных, то запомнит только первый тип,
                //т.к. сравниваем на <, а не на <=
                if numberOfRepetitions < number {
                    numberOfRepetitions = number
                    
                    valueAnimal = firstResult.type
                }
                indexInside += 1
            }
            number = 0
            indexOutside += 1
        }
        
        return valueAnimal
        
    }
}


        


