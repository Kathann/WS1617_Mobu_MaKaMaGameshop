//
//  WarenkorbViewController.swift
//  WS1617_Mobu_MaKaMaGameshop
//  Test Commit
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
    
    @IBOutlet weak var gesamtPreisLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //createArtikelData()
        self.tableView.dataSource = self
        gesamtPreisLabel.text = getItemsValue().description
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    self.gesamtPreisLabel.reloadInputViews()
    gesamtPreisLabel.text = getItemsValue().description
    }
    
    func getItemsValue() -> Float{
        // Funktion gibt dem Gesamtpreis-Label im Warenkorb den addierten Wert der Artikel aus dem Array eintraege
        var gesamt: Float = 0
        let i: Int = WarenkorbEintraegeArray.WarenkorbArray.eintraege.count
        
        if i > 0 {
            for objects in WarenkorbEintraegeArray.WarenkorbArray.eintraege {
                gesamt += (objects.price as NSString).floatValue
            }
        }
        return gesamt
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}

extension WarenkorbViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return WarenkorbEintraegeArray.WarenkorbArray.eintraege.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: WarenkorbCell? = tableView.dequeueReusableCell(withIdentifier: "warenkorbCell") as? WarenkorbCell
        
        if cell == nil {
            cell = WarenkorbCell(style: .default, reuseIdentifier: "warenkorbCell")
        }
        
        let currentCell: Artikel = WarenkorbEintraegeArray.WarenkorbArray.eintraege[indexPath.row]
        cell!.gameTitle.text = currentCell.name
        cell!.gameEdition.text = currentCell.edition
        cell!.gameVersion.text = currentCell.version
        cell!.gamePreis.text = currentCell.price
        cell!.gameImage.image = UIImage(named: currentCell.gameImageName)
        cell!.deleteIcon.image = UIImage(named: currentCell.deleteIcon)
        
        
        //cell!.accessoryType = .disclosureIndicator
        
        
        return cell!

        
    }
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            //numbers.removeAtIndex(IndexPath.row)
            //objects.remove(at: indexPath.row)
            WarenkorbEintraegeArray.WarenkorbArray.eintraege.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            print("Artikel wurde gelöscht")
            gesamtPreisLabel.text = getItemsValue().description
            
        }
    }
}
