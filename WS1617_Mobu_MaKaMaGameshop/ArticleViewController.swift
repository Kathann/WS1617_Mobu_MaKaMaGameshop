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
    
    func createGameDataAction(){
        let game1: Spiel = Spiel(gameImageName: "ark", name: "ARK: Survival Envolved", categorie: "Action", price: 29.99)
        let game2: Spiel = Spiel(gameImageName: "deadbydaylight", name: "Dead by Daylight", categorie: "Action", price: 14.99)
        let game3: Spiel = Spiel(gameImageName: "deusex", name: "Deus Ex: Mankind Divided", categorie: "Action", price: 24.99)
        let game4: Spiel = Spiel(gameImageName: "dishonored2", name: "Dishonored 2", categorie: "Action", price: 24.99)
        let game5: Spiel = Spiel(gameImageName: "gta5", name: "Grand Theft Auto V", categorie: "Action", price: 19.99)
        let game6: Spiel = Spiel(gameImageName: "h1z1", name: "H1Z1: King of the Kill", categorie: "Action", price: 19.99)
        let game7: Spiel = Spiel(gameImageName: "residentevil7", name: "Resident Evil VII", categorie: "Action", price: 34.99)
        let game8: Spiel = Spiel(gameImageName: "thewalkingdead", name: "The Walking Dead: A new frontier", categorie: "Action", price: 19.99)
        let game9: Spiel = Spiel(gameImageName: "thewitcher3", name: "The Witcher 3: Wild Hunt", categorie: "Action", price: 14.99)
                // Section: 0 = Action, 1= P&C, 2 = Rpg, 3 = Simulation, 4 = Sports, 5 = Strategie
        
        games[0].append(game1)
        games[0].append(game2)
        games[0].append(game3)
        games[0].append(game4)
        games[0].append(game5)
        games[0].append(game6)
        games[0].append(game7)
        games[0].append(game8)
        games[0].append(game9)
    }
    
    func createGameDataPointandClick(){//TESTMETHODE
        let game1: Spiel = Spiel(gameImageName: "dayofthetentacle", name: "Day of the Tentacle", categorie: "Point and Click", price: 12.99)
        let game2: Spiel = Spiel(gameImageName: "decay", name: "Decay - The Mare", categorie: "Point and Click", price: 6.99)
        let game3: Spiel = Spiel(gameImageName: "indianajones", name: "Indiana Jones and ...", categorie: "Point and Click", price: 4.99)
        let game4: Spiel = Spiel(gameImageName: "loom", name: "Loom", categorie: "Point and Click", price: 5.99)
        let game5: Spiel = Spiel(gameImageName: "maniacmanson", name: "Maniac Manson", categorie: "Point and Click", price: 999.99)
        let game6: Spiel = Spiel(gameImageName: "randalsmonday", name: "Randals's Monday", categorie: "Point and Click", price: 7.99)
        let game7: Spiel = Spiel(gameImageName: "samandmax", name: "Sam & Max: Hit the Road", categorie: "Point and Click", price: 29.99)
        let game8: Spiel = Spiel(gameImageName: "secretofmonkeyisland", name: "Secret of Monkey Island", categorie: "Point and Click", price: 9.99)
        let game9: Spiel = Spiel(gameImageName: "zakmckracken", name: "Zak McKracken", categorie: "Point and Click", price: 249.99)
        games[1].append(game1)
        games[1].append(game2)
        games[1].append(game3)
        games[1].append(game4)
        games[1].append(game5)
        games[1].append(game6)
        games[1].append(game7)
        games[1].append(game8)
        games[1].append(game9)
    }
    
    func createGameDataRpg(){//TESTMETHODE
        let game1: Spiel = Spiel(gameImageName: "darksouls3", name: "Darksouls 3", categorie: "Rpg", price: 29.99)
        let game2: Spiel = Spiel(gameImageName: "deusex", name: "Deus Ex: Mankind Divided", categorie: "Rpg", price: 24.99)
        let game3: Spiel = Spiel(gameImageName: "dragonage", name: "Dragon Age: Inquisition", categorie: "Rpg", price: 9.99)
        let game4: Spiel = Spiel(gameImageName: "fallout4", name: "Fallout 4", categorie: "Rpg", price: 19.99)
        let game5: Spiel = Spiel(gameImageName: "finalfantasy15", name: "Final Fantasy 15", categorie: "Rpg", price: 19.99)
        let game6: Spiel = Spiel(gameImageName: "skyforge", name: "Skyforge", categorie: "Rpg", price: 9.99)
        let game7: Spiel = Spiel(gameImageName: "skyrim", name: "The Elderscrolls: Skyrim", categorie: "Rpg", price: 9.99)
        let game8: Spiel = Spiel(gameImageName: "thewitcher3", name: "The Witcher 3: Wild Hunt", categorie: "Rpg", price: 14.99)
        let game9: Spiel = Spiel(gameImageName: "worldofwarcraft", name: "World of Warcraft", categorie: "Rpg", price: 9.99)
        games[2].append(game1)
        games[2].append(game2)
        games[2].append(game3)
        games[2].append(game4)
        games[2].append(game5)
        games[2].append(game6)
        games[2].append(game7)
        games[2].append(game8)
        games[2].append(game9)
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
