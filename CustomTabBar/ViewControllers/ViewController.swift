//
//  ViewController.swift
//  CustomTabBar
//
//  Created by NeedsMoreCoffeee on 7/28/22.
//

import UIKit

protocol CustomTabViewVC: UIViewController{
    var tabTitle: String? {get set}
}

class ViewController: UIViewController, CustomTabViewVC {
    
    
    var tabTitle: String?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpView()
        
    }

    func setUpView(){
        self.view.backgroundColor = UIColor.black

        
        if tabTitle == nil {
            tabTitle = "Error"
        }
            
        let label = UILabel()
        label.textColor = UIColor(hue: 0, saturation: 0, brightness: 0.85, alpha: 1.0) /* #d9d9d9 */
        label.text = "\(tabTitle!) View Controller"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        self.view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        
    }

}

