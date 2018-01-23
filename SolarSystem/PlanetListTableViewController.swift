//
//  PlanetListTableViewController.swift
//  SolarSystem
//
//  Created by Jacob Metcalf on 1/23/18.
//  Copyright © 2018 DevMountain. All rights reserved.
//

import UIKit

class PlanetListTableViewController: UITableViewController {
    
    @IBOutlet var planetTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Planets"
    }
    
    // MARK: - Table view data source
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        planetTableView.tableHeaderView =
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PlanetController.planets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "planetCell", for: indexPath)
        
        let selectedPlanet = PlanetController.planets[indexPath.row]
        
        // Configure the cell...
        cell.textLabel?.text = selectedPlanet.name
        
        cell.imageView?.image = UIImage(named: selectedPlanet.imageName)
        
        let index = indexPath.row
        cell.detailTextLabel?.text = "\(index)"
        
        return cell
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPlanetDetailVC" {
            guard let indexPath = planetTableView.indexPathForSelectedRow else { return }
            let selectedPlanet = PlanetController.planets[indexPath.row]
        // Get the new view controller using segue.destinationViewController.
            guard let detailVC = segue.destination as? PlanetDetailViewController else { return }
        // Pass the selected object to the new view controller.
            detailVC.planet = selectedPlanet
        }
    }

}
