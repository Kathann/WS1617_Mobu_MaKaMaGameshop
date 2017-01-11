//
//  ProfilViewController.swift
//  WS1617_Mobu_MaKaMaGameshop
//
//  Created by Student on 03.01.17.
//  Copyright © 2017 fhkl. All rights reserved.
// Test Commit

import UIKit

class ProfilViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    

}

extension ProfilViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ProfilEintraegeArray.ProfilArray.profilEintraege.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: ProfilArtikelCell? = tableView.dequeueReusableCell(withIdentifier: "profilArtikelCell") as? ProfilArtikelCell
        
        if cell == nil {
            cell = ProfilArtikelCell(style: .default, reuseIdentifier: "profilArtikelCell")
        }
        
        let currentCell: ProfilArtikel = ProfilEintraegeArray.ProfilArray.profilEintraege[indexPath.row]
        cell!.gameTitel.text = currentCell.name
        cell!.gameKaufdatum.text = currentCell.datum
        cell!.gameImage.image = UIImage(named: currentCell.gameImageName)
        
        
        //cell!.accessoryType = .disclosureIndicator
        
        
        return cell!
        
        
}
}
