//
//  DetailResultViewController.swift
//  BrainTraining
//
//  Created by Evgeni Glushko on 21.01.24.
//

import UIKit

final class DetailResultViewController: UIViewController {
    
    var result: Result!

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var modeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateLabel.text = result.getDate
        timeLabel.text = result.time
        modeLabel.text = result.mode
    }
}
