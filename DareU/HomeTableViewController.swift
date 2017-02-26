//
//  HomeTableViewController.swift
//  DareU
//
//  Created by Julio Hernandez-Duran on 2/25/17.
//  Copyright © 2017 DareDevs. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

    let dares = ["Go skinny dipping in your neighbor's pool.", "Lick a tree.", "Clean a white board with your tongue."]
    let daresPercentage = ["90%", "50%", "20%"]
    
    let cellIdentifier = "HomeCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dares.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! HomeTableViewCell
        cell.percentageLabel.text = daresPercentage[indexPath.row]
        cell.descriptionLabel.text = dares[indexPath.row]
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        guard let selectedRow = tableView.indexPathForSelectedRow?.row else {
            return
        }
        
        let destinationVC = segue.destination as! DareDetailViewController
        destinationVC.dare = dares[selectedRow]
        destinationVC.percent = daresPercentage[selectedRow]
    }

}
