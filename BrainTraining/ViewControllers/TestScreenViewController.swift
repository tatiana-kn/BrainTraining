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
    @IBOutlet var difficultStackView: UIStackView!
    
    @IBOutlet var simpleModeButtons: [UIButton]!
    @IBOutlet var classicModeButtons: [UIButton]!
    
    @IBOutlet var playBtn: UIButton!
    
    // MARK: - Public Properties
    var selectedMode: SelectedMode!
    
    enum SelectedMode {
        case simple
        case classic
        case difficult
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        setValues(for: simpleModeButtons)
        setValues(for: classicModeButtons)
    }
    
    @IBAction func playButton() {
        switch selectedMode {
        case .simple:
            simpleStackView.isHidden = false
<<<<<<< HEAD
            classicStackView.isHidden = true
            difficultStackView.isHidden = true
=======
>>>>>>> sstawrNEW
        case .classic:
            classicStackView.isHidden = false
            difficultStackView.isHidden = true
        default:
            simpleStackView.isHidden = true
            classicStackView.isHidden = true
            difficultStackView.isHidden = false
        }
        
        playBtn.setTitle("Restart", for: .normal)
    }
}

// MARK: - UI Setup
private extension TestScreenViewController {
    func updateUI() {
        simpleStackView.isHidden = true
        classicStackView.isHidden = true
    }
    
    func setValues(for mode: [UIButton]) {
        
        var randomValues = Set<Int>()
        
        while randomValues.count < mode.count {
            let randomNumber = Int.random(in: 1...mode.count)
            randomValues.insert(randomNumber)
        }
        
        for (_, button) in mode.enumerated() {
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
