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

class TripMapViewController: UIViewController {
    
    
    override func loadView() {
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
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()


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
}

