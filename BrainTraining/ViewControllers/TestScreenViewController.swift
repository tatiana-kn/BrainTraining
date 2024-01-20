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
    
    @IBOutlet var timerLabel: UILabel!
    
    // MARK: - Public Properties
    var selectedMode: SelectedMode!
    
    enum SelectedMode {
        case simple
        case classic
        case difficult
    }
    
    // MARK: - Private Properties
      private var timer: Timer?
      private var seconds: Int = 0

    
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
            startTimer()

        } else {
            setEmptyValues(for: simpleModeButtons)
            setEmptyValues(for: classicModeButtons)
            setEmptyValues(for: difficultModeButtons)
            playBtn.setTitle("Play", for: .normal)
            resetTimer()

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
    
    func startTimer() {
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [weak self] _ in
                self?.updateTimerLabel()
            })
            RunLoop.current.add(timer!, forMode: .common)
        }
        
     func resetTimer() {
            timer?.invalidate()
            timer = nil
            seconds = 0
            updateTimerLabel()
        }
        
      func updateTimerLabel() {
            let minutes = seconds / 60
            let seconds = seconds % 60
            timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
            self.seconds += 1
        }

}

//        for stackView in [simpleStackView, classicStackView] {
//            stackView?.isHidden = true
//        }
