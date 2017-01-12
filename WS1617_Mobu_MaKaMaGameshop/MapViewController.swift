//
//  MapViewController.swift
//  WS1617_Mobu_MaKaMaGameshop
//
//  Created by Nathalie Kroj on 12.01.17.
//  Copyright © 2017 fhkl. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mapView: MKMapView!
    var centerUserPosition: Bool = true
    var lastUserLocation: MKUserLocation?
    var locations: [MKPointAnnotation] = []
    var isUserInteraction: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self
        self.mapView.showsUserLocation = true
        self.createAnnotation()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self

        // Do any additional setup after loading the view.
    }

    func createAnnotation() {
        let annoation: MKPointAnnotation = MKPointAnnotation()
        annoation.coordinate = CLLocationCoordinate2DMake(37.313728, -122.044973)//ändern!!
        annoation.title = "Location 1"
        self.locations.append(annoation)
        
        let annoation2: MKPointAnnotation = MKPointAnnotation()
        annoation2.coordinate = CLLocationCoordinate2DMake(36.313728, -121.044973)
        annoation2.title = "Location 2"
        self.locations.append(annoation2)
        
        let annoation3: MKPointAnnotation = MKPointAnnotation()
        annoation3.coordinate = CLLocationCoordinate2DMake(38.313728, -123.044973)
        annoation3.title = "Location 3"
        self.locations.append(annoation3)
        
        self.mapView.addAnnotations(self.locations)
    }
    
    
    
    @IBAction func aktuellerStandortBarButtonItem(_ sender: UIBarButtonItem) {
        if self.lastUserLocation != nil {
            let region: MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(lastUserLocation!.coordinate, 5000, 5000)
            self.mapView.setRegion(region, animated: true)
            
            let selectedIndexPath: IndexPath? = self.tableView.indexPathForSelectedRow
            if selectedIndexPath != nil {
                self.tableView.deselectRow(at: selectedIndexPath!, animated: true)
            }
        }
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

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        
        if self.centerUserPosition{
        let region: MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 15000, 15000)
        self.mapView.setRegion(region, animated: true)
        }
        self.lastUserLocation = userLocation
    }
    
        func mapView(_ mapView: MKMapView, didFailToLocateUserWithError error: Error) {
            // Error
        }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        if self.isUserInteraction {
            let selectedIndexPath: IndexPath? = self.tableView.indexPathForSelectedRow
            if selectedIndexPath != nil {
                self.tableView.deselectRow(at: selectedIndexPath!, animated: true)
            }
        }
        else {
            self.isUserInteraction = true
        }
    }


    
}

extension MapViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "defaultCell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "defaultCell")
        }
        
        let annotation: MKPointAnnotation = self.locations[indexPath.row]
        cell!.textLabel?.text = annotation.title
        
        return cell!
    }
}

extension MapViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let annotation: MKPointAnnotation = self.locations[indexPath.row]
        for an in self.mapView.annotations {
            let pointAnnotation: MKPointAnnotation? = an as? MKPointAnnotation
            if pointAnnotation != nil {
                if pointAnnotation == annotation {
                    self.isUserInteraction = false
                    let region: MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(annotation.coordinate, 5000, 5000)
                    self.mapView.setRegion(region, animated: true)
                    
                }
            }
        }
    }
}



