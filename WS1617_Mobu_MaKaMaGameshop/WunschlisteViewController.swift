//
//  WunschlisteViewController.swift
//  WS1617_Mobu_MaKaMaGameshop
//
//  Created by Student on 03.01.17.
//  Copyright © 2017 fhkl. All rights reserved.
//

import UIKit

class WunschlisteViewController: UIViewController {

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
    
    extension WunschlisteViewController: UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return WunschlisteArray.wunschlisteListe.wunschlisteEintraege.count
            
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            var cell: WunschlisteCell? = tableView.dequeueReusableCell(withIdentifier: "wunschlisteCell") as? WunschlisteCell
            
            if cell == nil {
                cell = WunschlisteCell(style: .default, reuseIdentifier: "wunschlisteCell")
            }
            let currentCell: WunschlisteArtikel = WunschlisteArray.wunschlisteListe.wunschlisteEintraege[indexPath.row]

            cell!.gameTitle.text = currentCell.name
            cell!.gameInfo.text = currentCell.info
            cell!.gameImage.image = UIImage(named: currentCell.gameImageName)
            
            
            
            //cell!.accessoryType = .disclosureIndicator
            
            
            return cell!
            
            
        }
}
