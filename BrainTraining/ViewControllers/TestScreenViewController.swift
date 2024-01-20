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
    @IBOutlet var difficultModeButtons: [UIButton]!
    
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
    }
    
    @IBAction func playButton() {
        
        if(playBtn.titleLabel?.text == "Play") {
            switch selectedMode {
            case .simple:
                setValues(for: simpleModeButtons)
            case .classic:
                setValues(for: classicModeButtons)
            default:
                setPadding(for: difficultModeButtons)
                setValues(for: difficultModeButtons)
            }
            
            playBtn.setTitle("Restart", for: .normal)
        } else {
            setEmptyValues(for: simpleModeButtons)
            setEmptyValues(for: classicModeButtons)
            setEmptyValues(for: difficultModeButtons)
            playBtn.setTitle("Play", for: .normal)
        }
        
    }
    
    
    @IBAction func numberButton(_ sender: UIButton) {
        if let buttonTitle = sender.title(for: .normal) {
          print(buttonTitle)
        }
    }
    
}

// MARK: - UI Setup
private extension TestScreenViewController {
    func updateUI() {
        simpleStackView.isHidden = true
        classicStackView.isHidden = true
        difficultStackView.isHidden = true
                
        switch selectedMode {
        case .simple:
            simpleStackView.isHidden = false
            setEmptyValues(for: simpleModeButtons)
        case .classic:
            classicStackView.isHidden = false
            setEmptyValues(for: classicModeButtons)
        default:
            difficultStackView.isHidden = false
            setEmptyValues(for: difficultModeButtons)
        }
    }
    
    func setEmptyValues(for mode: [UIButton]) {
        for button in mode {
            button.setTitle("", for: .normal)
        }
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
    
    func setPadding(for mode: [UIButton]) {
        for button in mode {
            //button.titleLabel?.font = button.titleLabel?.font.withSize(12)
            
            //var configuration = UIButton.Configuration.plain()
            //configuration.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
            button.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
            
        }
    }
}

//        for stackView in [simpleStackView, classicStackView] {
//            stackView?.isHidden = true
//        }
