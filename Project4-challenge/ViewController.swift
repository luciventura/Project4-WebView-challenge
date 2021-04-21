//
//  ViewController.swift
//  Project4-challenge
//
//  Created by Luciene Ventura on 11/04/21.
//

import UIKit

class ViewController: UITableViewController {
    
    var safeWebsites = ["https://apple.com", "https://hackingwithswift.com", "https://google.com"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        safeWebsites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Pages", for: indexPath)
        
        cell.textLabel?.text = safeWebsites[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Pages") as? DetailViewController {
            vc.websiteSelected = safeWebsites[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }

}

}

