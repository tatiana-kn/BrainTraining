//
//  ViewController.swift
//  BrainTraining
//
//  Created by Tia M on 12/30/23.
//

import UIKit

final class AboutViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var appInfoLabel: UILabel!
    @IBOutlet var creatorsLabel: UILabel!
    
    // MARK: - Private Properties
    private let appInfo = AppInfo.getAppInfo()

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appInfoLabel.text = appInfo.description
        creatorsLabel.text = appInfo.creators
    }
}

