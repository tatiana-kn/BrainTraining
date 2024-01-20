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
}

//        for stackView in [simpleStackView, classicStackView] {
//            stackView?.isHidden = true
//        }
