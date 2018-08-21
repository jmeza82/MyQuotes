//
//  FavoriteViewController.swift
//  MyQuotes
//
//  Created by Juan Meza on 12/19/17.
//  Copyright © 2017 Tech-IN. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {
    
    @IBOutlet weak var favoriteImgView: UIImageView!
    @IBOutlet weak var favoriteLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        view.backgroundColor = theme
        
        let themeValue = defaults.integer(forKey: "theme")
        if themeValue == 0 {
            view.backgroundColor = UIColor.black
            favoriteLabel.textColor = UIColor.white
        } else{
            view.backgroundColor = UIColor.white
            favoriteLabel.textColor = UIColor.black
        }
        
        let savingDefaults = UserDefaults.standard
        let indexSaved = savingDefaults.integer(forKey: "favorite")
        
        let imageName = "\(indexSaved)"
        
        let image = UIImage(named: imageName)
        
        favoriteImgView.image = image
        
        if imageBorder {
            
            favoriteImgView.layer.borderColor = UIColor.red.cgColor
            favoriteImgView.layer.borderWidth = 5.0
        } else {
            
            favoriteImgView.layer.borderWidth = 0
        }
        
        favoriteImgView.layer.cornerRadius = 5.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }



}
