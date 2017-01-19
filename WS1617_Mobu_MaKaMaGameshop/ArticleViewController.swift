//
//  ArticleViewController.swift
//  WS1617_Mobu_MaKaMaGameshop
//
//  Created by Student on 03.01.17.
//  Copyright © 2017 fhkl. All rights reserved.
//

import UIKit
import CoreData

class ArticleViewController: UIViewController {
    
    var categoryText: String?
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var games: [Spiel] = []// Für jede Section eine Klammer, sonst out of index...
    var appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.navigationItem.title = categoryText!
        
        
        // Do any additional setup after loading the view.
    }
    
    func createGameDataAction(){
        let game1: Spiel = Spiel(gameImageName: "ark", name: "ARK: Survival Envolved", categorie: "Action", price: 29.99, teaserImageName: "ark_banner", detailImageName: "ark_detail")
        let game2: Spiel = Spiel(gameImageName: "deadbydaylight", name: "Dead by Daylight", categorie: "Action", price: 14.99, teaserImageName: "deadbydaylight_banner", detailImageName: "deadbydaylight_detail")
        let game3: Spiel = Spiel(gameImageName: "deusex", name: "Deus Ex: Mankind Divided", categorie: "Action", price: 24.99, teaserImageName: "deusex_banner", detailImageName: "deusex_detail")
        let game4: Spiel = Spiel(gameImageName: "dishonored2", name: "Dishonored 2", categorie: "Action", price: 24.99, teaserImageName: "dishonored2_banner", detailImageName: "dishonored_detail")
        let game5: Spiel = Spiel(gameImageName: "gta5", name: "Grand Theft Auto V", categorie: "Action", price: 19.99, teaserImageName: "gta5_banner", detailImageName: "gta5_detail")
        let game6: Spiel = Spiel(gameImageName: "h1z1", name: "H1Z1: King of the Kill", categorie: "Action", price: 19.99, teaserImageName: "h1z1_banner", detailImageName: "h1z1_detail")
        let game7: Spiel = Spiel(gameImageName: "residentevil7", name: "Resident Evil VII", categorie: "Action", price: 34.99, teaserImageName: "residentevil_banner", detailImageName: "residentevil_detail")
        let game8: Spiel = Spiel(gameImageName: "thewalkingdead", name: "The Walking Dead: A new frontier", categorie: "Action", price: 19.99, teaserImageName: "thewalkingdead_banner", detailImageName: "thewalkingdead_detail")
        let game9: Spiel = Spiel(gameImageName: "thewitcher3", name: "The Witcher 3: Wild Hunt", categorie: "Action", price: 14.99, teaserImageName: "thewitcher_banner", detailImageName: "thewitcher_detail")
                // Section: 0 = Action, 1= P&C, 2 = Rpg, 3 = Simulation, 4 = Sports, 5 = Strategie
        
        games.append(game1)
        games.append(game2)
        games.append(game3)
        games.append(game4)
        games.append(game5)
        games.append(game6)
        games.append(game7)
        games.append(game8)
        games.append(game9)
    }
    
    /*func createGameDataAction(){//mit coreData
        //Hier haben wollten wir versuchen die Kategorienmethoden persistent mit CoreData zu machen.
        //Testweise erst mal mit einem Spiel. Allerdings funktioniert das nicht. Somit müssen wir auf CoreData verzichten.
        
        let articleEntity: NSEntityDescription? = NSEntityDescription.entity(forEntityName:"ArticleEntity", in: self.appDelegate.coreDataStack.managedObjectContext)
        
        if articleEntity != nil {
            let article1 = NSManagedObject(entity: articleEntity!, insertInto: self.appDelegate.coreDataStack.managedObjectContext)
            article1.setValue("ARK: Survival Envolved", forKey: "name")
            article1.setValue("ark", forKey: "gameImageName")
            article1.setValue(29.99, forKey: "price")
            article1.setValue("Action", forKey: "category")
            article1.setValue("ark_banner", forKey: "teaserImageName")
            article1.setValue("ark_detail", forKey: "detailImageName")
            self.appDelegate.coreDataStack.saveContext()
        }
    }
    //----------CORE DATA----------//
    func fetchGameDataAction(){
        let fetchRequest: NSFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ArticleEntity")
        do {
            if let results = try self.appDelegate.coreDataStack.managedObjectContext.fetch(fetchRequest) as? [NSManagedObject] {
                for article in results {
                    let gameImageName: String? = article.value(forKey: "gameImageName") as? String
                    let name: String? = article.value(forKey: "name") as? String
                    let categorie: String? = article.value(forKey: "category") as? String
                    let price: Float? = article.value(forKey: "price") as? Float
                    let detailImageName: String? = article.value(forKey: "detailImageName") as? String
                    let teaserImageName: String? = article.value(forKey: "teaserImageName") as? String
                    
                    if gameImageName != nil && name != nil && price != nil && categorie != nil && detailImageName != nil && teaserImageName != nil{
                        let newGame: Spiel = Spiel(gameImageName: gameImageName!, name: name!, categorie: categorie!, price: price!, teaserImageName: teaserImageName!, detailImageName: detailImageName!)
                        self.games.append(newGame)
                    }
                }
            }
        }
        catch {
            fatalError("There was an error fetching the items")
        }
    }
    
    
    
    
    
    */
    
    func createGameDataPointandClick(){
        let game1: Spiel = Spiel(gameImageName: "dayofthetentacle", name: "Day of the Tentacle", categorie: "Point and Click", price: 12.99, teaserImageName: "bannertentacle", detailImageName: "dayofthetentacle_detail")
        let game2: Spiel = Spiel(gameImageName: "decay", name: "Decay - The Mare", categorie: "Point and Click", price: 6.99, teaserImageName: "decay_banner", detailImageName: "decay_detail")
        let game3: Spiel = Spiel(gameImageName: "indianajones", name: "Indiana Jones and the fate of atlantis", categorie: "Point and Click", price: 4.99, teaserImageName: "indianajones_banner", detailImageName: "indianajones_detail")
        let game4: Spiel = Spiel(gameImageName: "loom", name: "Loom", categorie: "Point and Click", price: 5.99, teaserImageName: "loom_banner", detailImageName: "loom_detail")
        let game5: Spiel = Spiel(gameImageName: "maniacmanson", name: "Maniac Mansion", categorie: "Point and Click", price: 9.99, teaserImageName: "maniacmanson_banner", detailImageName: "maniacmansion_detail")
        let game6: Spiel = Spiel(gameImageName: "randalsmonday", name: "Randals's Monday", categorie: "Point and Click", price: 7.99, teaserImageName: "randalsmonday_banner", detailImageName: "randalsmonday_detail")
        let game7: Spiel = Spiel(gameImageName: "samandmax", name: "Sam & Max: Hit the Road", categorie: "Point and Click", price: 29.99, teaserImageName: "samandmax_banner", detailImageName: "samandmax_detail")
        let game8: Spiel = Spiel(gameImageName: "secretofmonkeyisland", name: "Secret of Monkey Island", categorie: "Point and Click", price: 9.99, teaserImageName: "monkeyisland_banner", detailImageName: "monkeyisland_detail")
        let game9: Spiel = Spiel(gameImageName: "zakmckracken", name: "Zak McKracken", categorie: "Point and Click", price: 24.99, teaserImageName: "zmc_banner", detailImageName: "zmc_detail")
        games.append(game1)
        games.append(game2)
        games.append(game3)
        games.append(game4)
        games.append(game5)
        games.append(game6)
        games.append(game7)
        games.append(game8)
        games.append(game9)
    }
    
    func createGameDataRpg(){
        let game1: Spiel = Spiel(gameImageName: "darksouls3", name: "Darksouls 3", categorie: "Rpg", price: 29.99, teaserImageName: "darksouls3_banner", detailImageName: "darksouls_detail")
        let game2: Spiel = Spiel(gameImageName: "deusex", name: "Deus Ex: Mankind Divided", categorie: "Rpg", price: 24.99, teaserImageName: "deusex_banner", detailImageName: "deusex_detail")
        let game3: Spiel = Spiel(gameImageName: "dragonage", name: "Dragon Age: Inquisition", categorie: "Rpg", price: 9.99, teaserImageName: "dragonage_banner", detailImageName: "dragonage_detail")
        let game4: Spiel = Spiel(gameImageName: "fallout4", name: "Fallout 4", categorie: "Rpg", price: 19.99, teaserImageName: "fallout4_banner", detailImageName: "fallout_detail")
        let game5: Spiel = Spiel(gameImageName: "finalfantasy15", name: "Final Fantasy 15", categorie: "Rpg", price: 19.99, teaserImageName: "finalfantasy_banner", detailImageName: "finalfantasy_detail")
        let game6: Spiel = Spiel(gameImageName: "skyforge", name: "Skyforge", categorie: "Rpg", price: 9.99, teaserImageName: "skyforge_banner", detailImageName: "skyforge_detail")
        let game7: Spiel = Spiel(gameImageName: "skyrim", name: "The Elderscrolls: Skyrim", categorie: "Rpg", price: 9.99, teaserImageName: "skyrim_banner", detailImageName: "skyrim_detail")
        let game8: Spiel = Spiel(gameImageName: "thewitcher3", name: "The Witcher 3: Wild Hunt", categorie: "Rpg", price: 14.99, teaserImageName: "thewitcher_banner", detailImageName: "thewitcher_detail")
        let game9: Spiel = Spiel(gameImageName: "worldofwarcraft", name: "World of Warcraft", categorie: "Rpg", price: 9.99, teaserImageName: "worldofwarcraft_banner", detailImageName: "worldofwarcraft_detail")
        games.append(game1)
        games.append(game2)
        games.append(game3)
        games.append(game4)
        games.append(game5)
        games.append(game6)
        games.append(game7)
        games.append(game8)
        games.append(game9)
    }
    
    func createGameDataSports(){
        let game1: Spiel = Spiel(gameImageName: "bloodbowl2", name: "Blood Bowl 2", categorie: "Sports", price: 11.99, teaserImageName: "bloodbowl2_banner", detailImageName: "bloodbowl_detail")
        let game2: Spiel = Spiel(gameImageName: "fifa17", name: "Fifa 2017", categorie: "Sports", price: 29.99, teaserImageName: "fifa17_banner", detailImageName: "fifa17_detail")
        let game3: Spiel = Spiel(gameImageName: "maddennfl", name: "Madden NFL", categorie: "Sports", price: 34.99, teaserImageName: "madden17_banner", detailImageName: "madden_detail")
        let game4: Spiel = Spiel(gameImageName: "nba2k17", name: "NBA 2k17", categorie: "Sports", price: 29.99, teaserImageName: "nba2k17_banner", detailImageName: "nba2k17_detail")
        let game5: Spiel = Spiel(gameImageName: "nhl17", name: "NHL 2017", categorie: "Sports", price: 34.99, teaserImageName: "nhl17_banner", detailImageName: "nhl2k17_detail")
        let game6: Spiel = Spiel(gameImageName: "pes17", name: "Pro Evolution Soccer 2017", categorie: "Sports", price: 29.99, teaserImageName: "pes17_banner", detailImageName: "pes17_detail")
        let game7: Spiel = Spiel(gameImageName: "pga", name: "Rory McIlroy PGA Tour", categorie: "Sports", price: 34.99, teaserImageName: "pga_banner", detailImageName: "pga_detail")
        let game8: Spiel = Spiel(gameImageName: "steep", name: "Steep", categorie: "Sports", price: 29.99, teaserImageName: "steep_banner", detailImageName: "steep_detail")
        let game9: Spiel = Spiel(gameImageName: "wwe2k17", name: "WWE 2k17", categorie: "Sports", price: 29.99, teaserImageName: "wwe2k17_banner", detailImageName: "wwe2k17_detail")
        
        games.append(game1)
        games.append(game2)
        games.append(game3)
        games.append(game4)
        games.append(game5)
        games.append(game6)
        games.append(game7)
        games.append(game8)
        games.append(game9)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailView" {
            let detailVC: DetailViewController? = segue.destination as? DetailViewController
            let cell: GameCell? = sender as? GameCell
            
            if cell != nil && detailVC != nil {
                let indexPath: IndexPath? = self.tableView.indexPath(for: cell!)
                if indexPath != nil {
                let spiel: Spiel = games[indexPath!.row]
                    detailVC!.headline = cell!.nameLabel!.text
                    detailVC!.priceText = cell!.priceLabel.text
                    detailVC!.contentImage = spiel.detailImageName
                    detailVC!.teaserImage = spiel.teaserImageName
                    detailVC?.contentGame = cell!.nameLabel!.text
                }
            }
        }
    }
}


    



extension ArticleViewController: UITableViewDataSource {
    
    /*func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
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
    }*/
    
    /*func numberOfSections(in tableView: UITableView) -> Int{
        return self.games.count
    }*/
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: GameCell? = tableView.dequeueReusableCell(withIdentifier: "gameCell") as? GameCell
        
        if cell == nil {
            cell = GameCell(style: .default, reuseIdentifier: "gameCell")
        }
        
        let currentGame: Spiel = games[indexPath.row] //games[indexPath.section][indexPath.row]
        cell!.gameImageView.image = UIImage(named: currentGame.gameImageName)
        cell!.nameLabel.text = currentGame.name
        cell!.categoryLabel.text = currentGame.categorie
        cell!.priceLabel.text =  "\(currentGame.price)"     //Float in String
        cell!.accessoryType = .disclosureIndicator
        
        
        return cell!
    }
}
