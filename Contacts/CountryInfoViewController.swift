//
//  TripInfoViewController.swift
//  TripDashboard
//
//  Created by stephanie Chamblee on 7/18/17.
//  Copyright © 2017 Stephanie Chamblee. All rights reserved.
//

import UIKit
class CountryInfoViewController: UIViewController, UIWebViewDelegate, UITabBarControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    var pickerData: [String] = [String]()
    
    var webviewURL: URL = URL(string: "https://wwwnc.cdc.gov/travel/destinations/traveler/none/thailand?s_cid=ncezid-dgmq-travel-single-001")!
    var webviewURL2: URL = URL(string: "https://travel.state.gov/content/passports/en/country/thailand.html")!
    var webviewURL3: URL = URL(string: "https://docs.google.com/document/d/1KClHbUUbQt80VVPUxm1U1tQHaFoU86TsnGZDcTlikZc/edit?usp=sharing")!
    
    @IBOutlet weak var countrySC: UISegmentedControl!
    
    
    @IBAction func indexChange(_ sender: UISegmentedControl) {
        switch countrySC.selectedSegmentIndex {
        case 0:
            let requestObj = URLRequest(url: webviewURL)
            webView.loadRequest(requestObj)
        case 1:
            let requestObj = URLRequest(url: webviewURL2)
            webView.loadRequest(requestObj)
        case 2:
            let requestObj = URLRequest(url: webviewURL3)
            webView.loadRequest(requestObj)
        default:
            break;
        }
        
        
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: "CountryInfoViewController", bundle: nil)
    }
    
    convenience init() {
        self.init(nibName: "CountryInfoViewController", bundle: nil)
        //set the tab bar item's title
        tabBarItem.title = "title"
        
        //put an image on the tab bar item
        tabBarItem.image = UIImage(named: "image")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        
        webView.delegate = self
        self.tabBarController?.delegate = self
        
        pickerData = ["Thailand", "Cambodia", "Malaysia", "India", "Nepal", "Mozambique", "Swaziland", "South Africa"]
        
    }
    
    override func awakeFromNib() {
        self.tabBarItem.title = "Country Info"
        self.tabBarController?.tabBar.items![1].image = UIImage(named: "infoIcon")
        self.tabBarController?.tabBar.items![1].selectedImage = UIImage(named: "infoIcon")

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.tabBarController?.navigationItem.title = "Country Info"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
        
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
        
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
        
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let requestObj = URLRequest(url: webviewURL)
        webView.loadRequest(requestObj)
    }
    
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        activityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        activityIndicator.stopAnimating()
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
