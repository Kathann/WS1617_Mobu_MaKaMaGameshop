//
//  ArticleViewController.swift
//  WS1617_Mobu_MaKaMaGameshop
//
//  Created by Student on 03.01.17.
//  Copyright © 2017 fhkl. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {
    

    @IBOutlet weak var tableView: UITableView!
    var games: [[Spiel]] = [[], [], []]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    func createGameData(){
        let game1: Spiel = Spiel(gameImageName: "1", name: "Final Fantasy VII", categorie: "RPG", price: 19.99)
        let game2: Spiel = Spiel(gameImageName: "4", name: "Counter Strike GO", categorie: "SHOOTER", price: 9.99)
        let game3: Spiel = Spiel(gameImageName: "fifa17", name: "Fifa 17", categorie: "SPORT", price: 29.99)
        // Section: 0 = Action, 1= P&C, 2 = Rpg, 3 = Simulation, 4 = Sports, 5 = Strategie
        
        games[0].append(game1)
        games[1].append(game2)
        games[2].append(game3)
    }
    
    func createGameData2(){//TESTMETHODE
        let game1: Spiel = Spiel(gameImageName: "1", name: "Test", categorie: "RPG", price: 19.99)
        let game2: Spiel = Spiel(gameImageName: "4", name: "Test", categorie: "SHOOTER", price: 9.99)
        let game3: Spiel = Spiel(gameImageName: "fifa17", name: "Test", categorie: "SPORT", price: 29.99)
        games[0].append(game1)
        games[1].append(game2)
        games[2].append(game3)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailView" {
            let detailVC: DetailViewController? = segue.destination as? DetailViewController
            let cell: GameCell? = sender as? GameCell
            
            if cell != nil && detailVC != nil {
                detailVC!.headline = cell!.nameLabel!.text
                detailVC!.contentText = cell!.priceLabel.text
            }
        }
    }
}



extension ArticleViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        if section == 0 {
            return "Action"
        }
        else if section == 1{
            return "Point and Click"
        }
        else if section == 2{
            return "Rpg"
        }
        else if section == 3{
            return "Simulation"
        }
        else if section == 4{
            return "Sports"
        }
        else if section == 5{
            return "Strategie"
        }
        else {
            return "404 Page not found :)"                  // Sollte NIE eintreffen
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return self.games.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games[section].count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: GameCell? = tableView.dequeueReusableCell(withIdentifier: "gameCell") as? GameCell
        
        if cell == nil {
            cell = GameCell(style: .default, reuseIdentifier: "gameCell")
        }
        
        let currentGame: Spiel = games[indexPath.section][indexPath.row]
        cell!.gameImageView.image = UIImage(named: currentGame.gameImageName)
        cell!.nameLabel.text = currentGame.name
        cell!.categoryLabel.text = currentGame.categorie
        cell!.priceLabel.text =  "\(currentGame.price)"     //Float in String
        cell!.accessoryType = .disclosureIndicator
        
        
        return cell!
    }
}
