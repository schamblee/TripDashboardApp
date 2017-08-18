//
//  TripMapViewController.swift
//  TripDashboard
//
//  Created by stephanie Chamblee on 7/18/17.
//  Copyright © 2017 Stephanie Chamblee. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import SwiftyJSON
import Alamofire

class TripMapViewController: UIViewController, UITabBarControllerDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: GMSMapView!
    

    
    
    
    
    var resultsViewController: GMSAutocompleteResultsViewController?
    var searchController: UISearchController?
    var resultView: UITextView?
    var locationManager = CLLocationManager()
    
    override func loadView() {
        
        let url = "https://www.adventures.org/Valkyrie/FRM/reports/ajax/planning_events.asp?usagetype=ministry&showall=yes&tripcode=17W0803"
        
        Alamofire.request(url, method: .get).responseJSON { response in
            switch response.result {
            case .success(let value):
                print("response: \(value)")
                let json = JSON(value)
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
            print("Request: \(response.request)")
            print("Response: \(response.response)")
            print("Error: \(response)")
        }
        
        
        let camera = GMSCameraPosition.camera(withLatitude: 18.8038360000, longitude: 98.9720810000, zoom: 12.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        // show details on map
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 18.8038360000, longitude: 98.9720810000)
        marker.title = "Team 1"
        marker.snippet = "The Haven Project"
        marker.map = mapView
        
        let marker2 = GMSMarker()
        marker2.position = CLLocationCoordinate2D(latitude: 18.7311880000, longitude: 98.9339640000)
        marker2.title = "Team 2"
        marker2.snippet = "YWAM - Chang Mai"
        marker2.map = mapView
        
        let marker3 = GMSMarker()
        marker3.position = CLLocationCoordinate2D(latitude: 18.8673030000, longitude: 99.0222460000)
        marker3.title = "Team 3"
        marker3.snippet = "Nikki's Place Agape Home"
        marker3.map = mapView
        
        let marker4 = GMSMarker()
        marker4.position = CLLocationCoordinate2D(latitude: 18.8868550000, longitude: 99.0099670000)
        marker4.title = "Team 4"
        marker4.snippet = "Abba House Foundation"
        marker4.map = mapView
        
        let marker5 = GMSMarker()
        marker5.position = CLLocationCoordinate2D(latitude: 18.8705466, longitude: 99.1362407)
        marker5.title = "Team 5"
        marker5.snippet = "Remember Nhu"
        marker5.map = mapView
        
        mapView.isMyLocationEnabled = true
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.delegate = self
        initializeTheLocationManager()

    }
    
    override func viewDidAppear(_ animated: Bool) {

        }
    

    override func awakeFromNib() {
        self.tabBarItem.title = "Trip Map"
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName : UIColor(hue: 0.5583, saturation: 1, brightness: 0.65, alpha: 1.0)], for: .normal)
        self.tabBarController?.tabBar.items![0].image = UIImage(named: "mapIcon")
        self.tabBarController?.tabBar.items![0].selectedImage = UIImage(named: "mapIcon")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.tabBarController?.navigationItem.title = "X Squad Thailand"
        let nav = self.navigationController?.navigationBar
        nav?.tintColor = UIColor(hue: 0.5583, saturation: 1, brightness: 0.65, alpha: 1.0)
        
    
        
    }
    
    func initializeTheLocationManager()
    {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    
    func locationManager(_ manager: CLLocationManager,      didUpdateLocations locations: [CLLocation]) {
        
        let location = locationManager.location?.coordinate
        
        cameraMoveToLocation(toLocation: location)
        
        
    }
    

    
    func cameraMoveToLocation(toLocation: CLLocationCoordinate2D?) {
        if toLocation != nil {
            mapView.camera = GMSCameraPosition.camera(withTarget: toLocation!, zoom: 15)
            
            
        }
    }

    
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        let tabBarIndex = tabBarController.selectedIndex
        if tabBarIndex == 3 {
            let alert = UIAlertController(title: "Logout", message: "Are you sure you want to logout?", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in
                
                self.performSegue(withIdentifier: "cancelLogout", sender: self)
            })
            alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
                print("OK")
            })
            
            self.present(alert, animated: true)
            }
        }
    }





