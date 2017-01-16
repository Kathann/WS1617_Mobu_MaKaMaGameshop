//
//  WarenkorbViewController.swift
//  WS1617_Mobu_MaKaMaGameshop
//
//  Created by Student on 03.01.17.
//  Copyright © 2017 fhkl. All rights reserved.
//

import UIKit


class WarenkorbViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var gesamtPreisLabel: UILabel!
    var warenkorbEintraegeArray = [String]()
    
    
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
    @IBAction func kaufenButton(_ sender: Any) {
        // Fügt die Artikel aus dem Warenkorb in das ProfilArtikel Array herein und füllt es mit den entsprechenden Werten
        
        let i: Int = WarenkorbEintraegeArray.WarenkorbArray.eintraege.count

        for j in (0..<i) {
            
            let Artikel: ProfilArtikel = ProfilArtikel(gameImageName: WarenkorbEintraegeArray.WarenkorbArray.eintraege[j].gameImageName, name: WarenkorbEintraegeArray.WarenkorbArray.eintraege[j].name, datum: "1.1.17")
            
            
            ProfilEintraegeArray.ProfilArray.profilEintraege.append(Artikel)
            
        
            }


        // Löscht Artikel aus dem Warenkorb
        WarenkorbEintraegeArray.WarenkorbArray.eintraege.removeAll()
        // Aktualisiert die Table View
        self.tableView.reloadData()
        // Aktualisiert den Preislabel
        self.gesamtPreisLabel.reloadInputViews()
        gesamtPreisLabel.text = getItemsValue().description
        
        performSegue(withIdentifier: "kaufabschluss", sender: Any?.self)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "kaufabschluss" {
//            let ArticleVC: KaufabschlussViewController? = segue.destination as? KaufabschlussViewController
//            
//            
//            let bnt: UIButton? = sender as? UIButton
//            
//            if bnt != nil && ArticleVC != nil {
//                let i: Int = WarenkorbEintraegeArray.WarenkorbArray.eintraege.count
//                
//                for j in (0..<i) {
//                    
//                    let Artikel: ProfilArtikel = ProfilArtikel(gameImageName: WarenkorbEintraegeArray.WarenkorbArray.eintraege[j].gameImageName, name: WarenkorbEintraegeArray.WarenkorbArray.eintraege[j].name, datum: "1.1.17")
//                    
//                    
//                    ProfilEintraegeArray.ProfilArray.profilEintraege.append(Artikel)
//                    
//                    
//                }
//                
//                
//                // Löscht Artikel aus dem Warenkorb
//                WarenkorbEintraegeArray.WarenkorbArray.eintraege.removeAll()
//                // Aktualisiert die Table View
//                self.tableView.reloadData()
//                // Aktualisiert den Preislabel
//                self.gesamtPreisLabel.reloadInputViews()
//                gesamtPreisLabel.text = getItemsValue().description
//                
//
//        }
//
//        }
//    
//    }

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
