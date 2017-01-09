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
    var eintraege: [Spiel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension WarenkorbViewController: UITableViewDataSource {
    //Zeile 0 wird mit RPG befüllt, Zeile 1 mit Sport...Eventuell bessere Alternative ein neues Swift File mit Struct Kategorie anzulegen.
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return category.count
        return eintraege.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: WarenkorbCell? = tableView.dequeueReusableCell(withIdentifier: "warenKorbCell") as? WarenkorbCell
        
        if cell == nil {
            cell = WarenkorbCell(style: .default, reuseIdentifier: "warenkorbCell")
        }
        
        let currentSpiel: Spiel = eintraege[indexPath.row]
        //cell!.gameImage = (UIImageView);currentSpiel.teaserImageName
       cell!.gameTitle.text = currentSpiel.name
        //cell!.gamePreis.text = (String);currentSpiel.price
        
       // cell!.accessoryType = .disclosureIndicator
        
        
        return cell!
        
    }
}
