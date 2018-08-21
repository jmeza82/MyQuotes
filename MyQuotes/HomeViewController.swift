//
//  HomeViewController.swift
//  MyQuotes
//
//  Created by Juan Meza on 12/19/17.
//  Copyright © 2017 Tech-IN. All rights reserved.
//

import UIKit

var theme: UIColor = UIColor.black
let defaults = UserDefaults.standard
var imageBorder = false

class HomeViewController: UIViewController {

    @IBOutlet weak var quoteImgView: UIImageView!
    @IBOutlet var homeButtons: [UIButton]!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    
    //Without For Loop
    var quoteArray = ["0", "1","2","3","4","5","6","7","8","9",]
    //var quoteArray = [String]()
    var arrayIndex = 0
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        if arrayIndex == 0 {
            
            backButton.isEnabled = false
            
        }
        
        
        let themeValue = defaults.integer(forKey: "theme")
        if themeValue == 0 {
            view.backgroundColor = UIColor.black
            setButtonBorders(color: .white)
            
        } else{
            view.backgroundColor = UIColor.white
            setButtonBorders(color: .black)
           
        }
        
        if imageBorder {
            
            quoteImgView.layer.borderColor = UIColor.red.cgColor
            quoteImgView.layer.borderWidth = 5.0
            
        } else {
            
            quoteImgView.layer.borderWidth = 0
        }
        quoteImgView.layer.cornerRadius = 5.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //for i in 0..<10{
          //  quoteArray.append(String(i))
        //}
        
    }

    @IBAction func backClicked(_ sender: Any) {
        
        if arrayIndex > 0 {
            arrayIndex -= 1
            nextButton.isEnabled = true
            let index = quoteArray[arrayIndex]
            let image = UIImage(named: index)
            quoteImgView.image = image
        }
        
        if arrayIndex == 0 {
            
            backButton.isEnabled = false
        }
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        
        if arrayIndex < quoteArray.count - 1 {
           
            arrayIndex += 1
            backButton.isEnabled = true
            let index = quoteArray[arrayIndex]
            let quoteImage = UIImage(named: index)
            quoteImgView.image = quoteImage
            
        }
        
        if arrayIndex == 9 {
            
            nextButton.isEnabled = false
        }
        
        
    }
    
    @IBAction func favoriteClicked(_ sender: Any) {
        
        let savingDefaults = UserDefaults.standard
        savingDefaults.set(arrayIndex, forKey: "favorite")
        
        
        
    }
    
    func setButtonBorders(color: UIColor){
        
        for button in homeButtons {
            button.layer.cornerRadius = 25.0
            button.layer.borderWidth = 3.5
            button.layer.borderColor = color.cgColor
        }
    }
    
}
