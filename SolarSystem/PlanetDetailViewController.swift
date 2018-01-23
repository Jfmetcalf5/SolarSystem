//
//  PlanetDetailViewController.swift
//  SolarSystem
//
//  Created by Jacob Metcalf on 1/23/18.
//  Copyright © 2018 DevMountain. All rights reserved.
//

import UIKit

class PlanetDetailViewController: UIViewController {

    @IBOutlet weak var planetImageView: UIImageView!
    
    @IBOutlet weak var diameterLabel: UILabel!
    @IBOutlet weak var dayLengthLabel: UILabel!
    @IBOutlet weak var kmsFromSunLabel: UILabel!
    
    var planet: Planet?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = planet?.name
        updateViews()
    }
    
    func updateViews() {
        guard let planet = planet else { return }
        
        planetImageView.image = UIImage(named: planet.imageName)
        
        diameterLabel.text = "\(planet.diameter) diameters long"
        dayLengthLabel.text = "\(planet.dayLength) seconds is one day"
        kmsFromSunLabel.text = "\(planet.millionKMsFromSun) million miles from the Sun"
    }
}
