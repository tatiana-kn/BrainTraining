//
//  MainScreenViewController.swift
//  BrainTraining
//
//  Created by Tia M on 1/19/24.
//

import UIKit

final class MainScreenViewController: UIViewController {

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - Overrides Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "simpleShowSegue" {
                guard let destination = segue.destination as? TestScreenViewController else { return }
                destination.selectedMode = .simple
            } else if segue.identifier == "classicShowSegue" {
                guard let destination = segue.destination as? TestScreenViewController else { return }
                destination.selectedMode = .classic
            } else if segue.identifier == "difficultShowSegue" {
                guard let destination = segue.destination as? TestScreenViewController else { return }
                destination.selectedMode = .difficult
            }
        }
}
