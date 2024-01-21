//
//  ResultsTableViewController.swift
//  BrainTraining
//
//  Created by Tia M on 1/19/24.
//

import UIKit

final class ResultsTableViewController: UITableViewController {
    
    // MARK: - Private Properties
    private let results = Result.getResults()

    //MARK: - Overrides Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(results)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        results.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let result = results[indexPath.row]
    
        content.text = "Date: \(result.getDate)"
        cell.contentConfiguration = content
        
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            guard let detailVC = segue.destination as? DetailResultViewController else { return }
            detailVC.result = results[indexPath.row]
        }
    }
}
