//
//  TestScreenViewController.swift
//  BrainTraining
//
//  Created by Tia M on 1/19/24.
//

import UIKit

final class TestScreenViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var simpleStackView: UIStackView!
    @IBOutlet var classicStackView: UIStackView!
    
    @IBOutlet var simpleModeButtons: [UIButton]!
    
    
    // MARK: - Public Properties
    var selectedMode: SelectedMode!
    
    enum SelectedMode {
        case simple
        case classic
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        setValues(for: simpleModeButtons)
    }
}

// MARK: - UI Setup
private extension TestScreenViewController {
    func updateUI() {
        
        switch selectedMode {
        case .simple:
            simpleStackView.isHidden = false
            classicStackView.isHidden = true
        case .classic:
            simpleStackView.isHidden = true
            classicStackView.isHidden = false
        default:
            break
        }
    }
    
    func setValues(for mode: [UIButton]) {
        
        var randomValues = Set<Int>()
        
        while randomValues.count < mode.count {
            let randomNumber = Int.random(in: 1...mode.count)
            randomValues.insert(randomNumber)
        }
        
        for (index, button) in mode.enumerated() {
            if let randomValue = randomValues.randomElement() {
                randomValues.remove(randomValue)
                button.setTitle("\(randomValue)", for: .normal)
            }
        }

    }
}

//        for stackView in [simpleStackView, classicStackView] {
//            stackView?.isHidden = true
//        }
