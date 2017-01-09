//
//  DetailViewController.swift
//  WS1617_Mobu_MaKaMaGameshop
//
//  Created by Student on 03.01.17.
//  Copyright © 2017 fhkl. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    var priceText: String?
    var premiumText: String?
    var deluxeText: String?
    var headline: String?
    var teaserImage: String?
    var contentImage: String?
    var contentGame: String?
    
 
    
    
    @IBOutlet weak var contentGameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var teaserImageView: UIImageView!
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var editionPickerView: UIPickerView!
    @IBOutlet weak var editionLabel: UILabel!
    
    
    var edition = ["Standard", "Premium", "Deluxe"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if priceText != nil {
            self.priceLabel.text = priceText!
        }
        
        if headline != nil {
            self.title = headline!
        }

        if self.contentImage != nil {
            self.contentImageView.image = UIImage(named: contentImage!)
        }
        
        if teaserImage != nil{
            self.teaserImageView.image = UIImage(named: teaserImage!)
        }
        
        if contentGame != nil {
            self.contentGameLabel.text = contentGame!
        }
        
        editionPickerView.delegate = self
        editionPickerView.dataSource = self
        
        premiumText = priceText
        deluxeText = priceText
        
        
        
        
    }
    
   /* (x: String) -> String{
        var toFloat = (x as NSString).floatValue + 10.0
        self.premiumText = "\(toFloat)"
        
        return x
        
    }*/
    
    
    func priceLabelToFloatPremium(){// Originalpreis nehmen und 10 Euro Zuschlag für Premiumversion
        let premiumFloat = Float(priceText!)  //price Text von String in Float
        let sum = premiumFloat! + 10.0  // addieren
        self.premiumText = "\(sum)"     // zurück in String und in premiumText schreiben
    }
    
    func priceLabelToFloatDeluxe(){// Originalpreis nehmen und 20 Euro Zuschlag für Deluxeversion
        let deluxeFloat = Float(priceText!)
        let sum = deluxeFloat! + 20.0
        self.deluxeText = "\(sum)"
    }
    
    
    //--------------PICKERVIEW------------------
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return edition.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return edition[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.editionLabel.text = edition[row]
        
        if edition[row] == "Standard"{
            self.priceLabel.text = priceText!
        }
        if edition[row] == "Premium"{
            priceLabelToFloatPremium()
            self.priceLabel.text = premiumText!
        }
        if edition[row] == "Deluxe"{
            priceLabelToFloatDeluxe()
            self.priceLabel.text = deluxeText!
        }
    }
    
   /* func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.editionTextField{
            self.editionPickerView.isHidden = false
        }
    }*/
    
    //---------------PICKERVIEW ENDE-----------------
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*func setTeaserImage(){
        switch headline! {
        case "Loom":
            self.teaserImageView.image = #imageLiteral(resourceName: "minecraftheader")
        default:
            self.teaserImageView.image = #imageLiteral(resourceName: "minecraftheader")
        }
    }*/
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}




