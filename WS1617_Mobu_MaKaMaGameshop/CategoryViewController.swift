//
//  CategoryViewController.swift
//  WS1617_Mobu_MaKaMaGameshop
//
//  Created by Student on 03.01.17.
//  Copyright © 2017 fhkl. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var category: [Kategorie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createCategoryData()
        self.tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    func createCategoryData(){
        let category1: Kategorie = Kategorie(name: "Action")
        let category2: Kategorie = Kategorie(name: "Point and Click")
        let category3: Kategorie = Kategorie(name: "Rpg")
        let category4: Kategorie = Kategorie(name: "Simulation")
        let category5: Kategorie = Kategorie(name: "Sports")
        let category6: Kategorie = Kategorie(name: "Strategie")
        
        category.append(category1)
        category.append(category2)
        category.append(category3)
        category.append(category4)
        category.append(category5)
        category.append(category6)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toArticleView" {
            let ArticleVC: ArticleViewController? = segue.destination as? ArticleViewController
            
            
            let cell: CategoryCell? = sender as? CategoryCell
            
            if cell != nil && ArticleVC != nil { // Wenn text im Zelle = RPG rufe methode gamedata2 auf.
                if cell!.nameLabel.text == "Action"{
                    ArticleVC?.createGameDataAction()
                }
                    
                if cell!.nameLabel.text == "Point and Click"{
                    ArticleVC?.createGameDataPointandClick()
                }
                    
                if cell!.nameLabel.text == "Rpg"{
                    ArticleVC?.createGameDataRpg()
                }
                else{
                    //ArticleVC?.createGameDataAction()
                }// NOCH ANPASSEN
            }
        }
    }
    
}

extension CategoryViewController: UITableViewDataSource {
    //Zeile 0 wird mit RPG befüllt, Zeile 1 mit Sport...Eventuell bessere Alternative ein neues Swift File mit Struct Kategorie anzulegen.
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: CategoryCell? = tableView.dequeueReusableCell(withIdentifier: "categoryCell") as? CategoryCell
        
        if cell == nil {
            cell = CategoryCell(style: .default, reuseIdentifier: "categoryCell")
        }
        
        let currentCategory: Kategorie = category[indexPath.row]
        cell!.nameLabel.text = currentCategory.name
        cell!.accessoryType = .disclosureIndicator
        
        
        return cell!
        
    }
}

//TODO-----
//Neues Swift File anlegen mit Kategorien. Danach wie im View Controller die Kategorien in die TableView laden und anschließend über prepare for segue die entsprechende Kategorie ausgeben lassen.



