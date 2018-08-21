//
//  SettingsViewController.swift
//  MyQuotes
//
//  Created by Juan Meza on 12/19/17.
//  Copyright © 2017 Tech-IN. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet var settingsLabels: [UILabel]!
    @IBOutlet weak var segmentedTheme: UISegmentedControl!
    
    @IBOutlet weak var switchBorder: UISwitch!
    @IBOutlet weak var stepperFavorite: UIStepper!
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        view.backgroundColor = theme
        
        let themeValue = defaults.integer(forKey: "theme")
        if themeValue == 0 {
            view.backgroundColor = UIColor.black
            changeTheme(color: UIColor.white)
            segmentedTheme.selectedSegmentIndex = 0
           
        } else{
            view.backgroundColor = UIColor.white
            changeTheme(color: UIColor.black)
            segmentedTheme.selectedSegmentIndex = 1
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func segmentedChanged(_ sender: Any) {
        
        let index = segmentedTheme.selectedSegmentIndex
        
        defaults.set(index, forKey: "theme")
        
        if index == 0 {
            
            theme = UIColor.black
            changeTheme(color: UIColor.white)
        
        } else {
            
            theme = UIColor.white
            changeTheme(color: UIColor.black)
        }
        
        view.backgroundColor = theme
    }
    

    @IBAction func switchChanged(_ sender: Any) {
        
        if switchBorder.isOn {
            
            imageBorder = true
        
        } else {
        
            imageBorder = false
        
        }
        
    }
    
    func changeTheme(color: UIColor){
        
        for label in settingsLabels {
            label.textColor = color
        }
        segmentedTheme.tintColor = color
        switchBorder.onTintColor = color
        stepperFavorite.tintColor = color
    }
    

}
