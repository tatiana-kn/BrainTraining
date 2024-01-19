//
//  TestScreenViewController.swift
//  BrainTraining
//
//  Created by Tia M on 1/19/24.
//

import UIKit

final class TestScreenViewController: UIViewController {
    
    @IBOutlet var simpleStackView: UIStackView!
    @IBOutlet var classicStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }


}

private extension TestScreenViewController {
    func updateUI() {
        for stackView in [simpleStackView, classicStackView] {
            stackView?.isHidden = true
        }
    }
}
