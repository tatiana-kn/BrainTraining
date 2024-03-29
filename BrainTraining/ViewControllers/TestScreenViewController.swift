//
//  TestScreenViewController.swift
//  BrainTraining
//
//  Created by Tia M on 1/19/24.
//

import UIKit

final class TestScreenViewController: UIViewController {
    
    enum SelectedMode {
        case simple
        case classic
        case difficult
    }
    
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
    
    // MARK: - Private Properties
    private var currentNum = 0
    private var timer: Timer?
    private var seconds: Int = 0
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    // MARK: - IBActions
    @IBAction func playButton() {
        
        if(playBtn.titleLabel?.text == "Play") {
            
            currentNum = 1
            
            switch selectedMode {
            case .simple:
                setValues(for: simpleModeButtons)
                setDefaultState(for: simpleModeButtons)
            case .classic:
                setValues(for: classicModeButtons)
                setDefaultState(for: classicModeButtons)
            default:
                setPadding(for: difficultModeButtons)
                setValues(for: difficultModeButtons)
                setDefaultState(for: difficultModeButtons)
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
        let buttonTitle = sender.title(for: .normal) ?? ""
        
        let maxNum: Int
        let mode: String
        
        switch selectedMode {
        case .simple:
            maxNum = simpleModeButtons.count + 1
            mode = "Simple"
        case .classic:
            maxNum = classicModeButtons.count + 1
            mode = "Classic"
        default:
            maxNum = difficultModeButtons.count + 1
            mode = "Difficult"
        }
        
        if currentNum == Int(buttonTitle) {
            sender.setTitleColor(.systemGray3, for: .normal)
            currentNum += 1
        }
        
        if currentNum == maxNum {
            let time = timerLabel.text ?? ""
            showAlert(withTitle: "Success", andMessage: "Result: \(timerLabel.text ?? "")")
            timer?.invalidate()
                        
            let currentDate = Date()
            
            Result.addResult(date: currentDate, time: time, mode: mode)
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
            title = "Simple Mode"
        case .classic:
            classicStackView.isHidden = false
            setEmptyValues(for: classicModeButtons)
            title = "Classic Mode"
        default:
            difficultStackView.isHidden = false
            setEmptyValues(for: difficultModeButtons)
            title = "Difficult Mode"
        }
    }
    
    func setPadding(for mode: [UIButton]) {
        for button in mode {
            button.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        }
    }
}

// MARK: - Private Methods
private extension TestScreenViewController {
        
    func setEmptyValues(for mode: [UIButton]) {
        for button in mode {
            button.setTitle("", for: .normal)
        }
    }
    
    func setValues(for mode: [UIButton]) {
        
        var randomValues: Set<Int> = []
        
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
    
    func setDefaultState(for mode: [UIButton]) {
        for button in mode {
            button.setTitleColor(.none, for: .normal)
        }
    }
    
    func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { [self] _ in
            setEmptyValues(for: simpleModeButtons)
            setEmptyValues(for: classicModeButtons)
            setEmptyValues(for: difficultModeButtons)
            
            resetTimer()
            
            playBtn.setTitle("Play", for: .normal)
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Timer setup
private extension TestScreenViewController {
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
    
    func stopTimer() {
       timer?.invalidate()
       timer = nil
    }
}

