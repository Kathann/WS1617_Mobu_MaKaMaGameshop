//
//  KaufabschlussViewController.swift
//  WS1617_Mobu_MaKaMaGameshop
//
//  Created by Student on 11.01.17.
//  Copyright © 2017 fhkl. All rights reserved.
//

import UIKit

class KaufabschlussViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    @IBAction func weiterleiten(_ sender: UIButton) {
        performSegue(withIdentifier: "zurueckShop", sender: UIButton?.self)
    }
    

}
