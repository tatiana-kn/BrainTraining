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
}

// MARK: - UI Setup
private extension TestScreenViewController {
    func updateUI() {
        
        switch selectedMode {
        case .simple:
            simpleStackView.isHidden = false
            classicStackView.isHidden = true
            difficultStackView.isHidden = true
        case .classic:
            simpleStackView.isHidden = true
            classicStackView.isHidden = false
            difficultStackView.isHidden = true
        default:
            simpleStackView.isHidden = true
            classicStackView.isHidden = true
            difficultStackView.isHidden = false
        }
    }
}

//        for stackView in [simpleStackView, classicStackView] {
//            stackView?.isHidden = true
//        }
