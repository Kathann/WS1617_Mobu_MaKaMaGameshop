//
//  WarenkorbViewController.swift
//  WS1617_Mobu_MaKaMaGameshop
//
//  Created by Student on 03.01.17.
//  Copyright © 2017 fhkl. All rights reserved.
//

import UIKit

//protocol WarenkorbViewControllerDelegate {
//    getAnzahlVonArtikel() ->Int
//    getSpielForRowAtIndexPath(indexPath: IndexPath) -> Spiel
//    entferneSpielVonWarenkorb(indexPath: IndexPath)
//}
class WarenkorbViewController: UIViewController {
    
    //var delegate: WarenkorbViewControllerDelegate?
    @IBOutlet weak var tableView: UITableView!
    var eintraege: [Artikel] = []
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        createArtikelData()
        self.tableView.dataSource = self
    }
    
    
func createArtikelData(){
       let artikel1: Artikel = Artikel(gameImageName: "ark",name: "Test", edition: "Standard", version: "PC", price: "12,00", deleteIcon: "ark")
    
        eintraege.append(artikel1)
    
  }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension WarenkorbViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return eintraege.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: WarenkorbCell? = tableView.dequeueReusableCell(withIdentifier: "warenkorbCell") as? WarenkorbCell
        
        if cell == nil {
            cell = WarenkorbCell(style: .default, reuseIdentifier: "warenkorbCell")
        }
        
        let currentCell: Artikel = eintraege[indexPath.row]
        cell!.gameTitle.text = currentCell.name
        cell!.gameEdition.text = currentCell.edition
        cell!.gameVersion.text = currentCell.version
        cell!.gamePreis.text = currentCell.price
        cell!.gameImage.image = UIImage(named: currentCell.gameImageName)
        cell!.deleteIcon.image = UIImage(named: currentCell.deleteIcon)
        
        
        //cell!.accessoryType = .disclosureIndicator
        
        
        return cell!

        
    }
}
