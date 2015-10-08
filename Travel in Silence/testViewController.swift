//
//  testViewController.swift
//  Travel in Silence
//
//  Created by Steve Clement on 12/04/15.
//  Copyright (c) 2015 Steve Clement. All rights reserved.
//

// This is a testViewController to get to know the CoreLocation framework, SwifteriOS and playing around with the allmighty pLists

import UIKit
import MapKit
import CoreLocation
import Accounts
import Social
import SwifteriOS
//import SafariServices

class testViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var theLabel: UILabel!
    @IBOutlet weak var theMap: MKMapView!
    
    // CoreLocation variables
    var manager:CLLocationManager!
    var myLocations: [CLLocation] = []
    // main Station dictionary
    var stationsDict: NSDictionary?
    // Swifter variables
    var swifter: Swifter
    let useACAccount = true
    let useTwitter = false
    
    var iDev = DeviceMonitor()
    
    // Static test co-ordinates
    
    // Lux, gare8200100, 6.134206, 49.600070
    //let gareLuxembourg = ["Luxembourg", CLLocation(latitude: 49.600070, longitude: 6.134206)]
    let gareLuxembourg: [CLLocation] = [CLLocation(latitude: 49.600070, longitude: 6.134206)]
    // Mersch, gare8200110, 6.110320, 49.752019
    let gareMersch = ["Mersch", CLLocation(latitude: 49.752019, longitude: 6.110320)]
    // Bettembourg, gare8200603, 6.101424, 49.516457
    let gareBettembourg = ["Bettembourg", CLLocation(latitude: 49.516457, longitude: 6.101424)]

    required init?(coder aDecoder: NSCoder) {
        self.swifter = Swifter(consumerKey: "RErEmzj7ijDkJr60ayE2gjSHT", consumerSecret: "SbS0CHk11oJdALARa7NDik0nty4pXvAxdt7aj0R5y1gNzWaNEx")
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Setup our Location Manager
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
       
        // path of our stations property list
        if let pathStationsPlist = NSBundle.mainBundle().pathForResource("stations", ofType: "plist") {
            // dictionary with plist contents
            stationsDict = NSDictionary(contentsOfFile: pathStationsPlist)
        }
        
        if debug {
            NSLog("Running v.\(shortVersionString)")
            print("Current battery level: \(iDev.batteryLevel()*100)%")
            // plist debug
            printStations(stationsDict)
        }
        
        //Setup our Map View
        theMap.delegate = self
        //theMap.mapType = MKMapType.Satellite
        theMap.showsUserLocation = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func locationManager(manager:CLLocationManager, didUpdateLocations locations:[CLLocation]) {
        theLabel.text = "\(locations[0]) v\(shortVersionString)"
        myLocations.append(locations[0] )
        
        print("Valu gareLux: \(gareLuxembourg[0])")
        let distance = locations[0].distanceFromLocation(gareLuxembourg[0])
        print("Location from GdL: \(distance) meter")

        // This determines the map zoom factor
        let spanX = 0.077
        let spanY = 0.077
        let newRegion = MKCoordinateRegion(center: theMap.userLocation.coordinate, span: MKCoordinateSpanMake(spanX, spanY))
        theMap.setRegion(newRegion, animated: true)
        let failureHandler: ((NSError) -> Void) = {
            error in
            
            self.alertWithTitle("Error", message: error.localizedDescription)
        }

        if debug {
            NSLog("myLocations before if: \(myLocations.count)")
        }
  
        if useTwitter {
          if useACAccount {
            let accountStore = ACAccountStore()
            let accountType = accountStore.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierTwitter)
            
            // Prompt the user for permission to their twitter account stored in the phone's settings
            accountStore.requestAccessToAccountsWithType(accountType, options: nil) {
              granted, error in
              
              if granted {
                let twitterAccounts = accountStore.accountsWithAccountType(accountType)
                
                if twitterAccounts?.count == 0
                {
                  self.alertWithTitle("Error", message: "There are no Twitter accounts configured. You can add or create a Twitter account in Settings.")
                }
                else {
                  let twitterAccount = twitterAccounts[0] as! ACAccount
                  self.swifter = Swifter(account: twitterAccount)
                  //self.fetchTwitterHomeStream()
                }
              }
              else {
                self.alertWithTitle("Error", message: error.localizedDescription)
              }
            }
          }
          else {
            let url = NSURL(string: "swifter://success")!
            swifter.authorizeWithCallbackURL(url, success: { (accessToken, response) -> Void in
              //self.fetchTwitterHomeStream()
              }, failure: { (error) -> Void in
                //failureHandler
              }, openQueryURL: { (url) -> Void in
                //if #available(iOS 9.0, *) {
                //  let webView = SFSafariViewController(URL: url)
                //  webView.delegate = self
                //  self.presentViewController(webView, animated: true, completion: nil)
                //} else {
                  // Fallback on earlier versions
                //  UIApplication.sharedApplication().openURL(url)
                //}
              }, closeQueryURL: { () -> Void in
                self.presentedViewController?.dismissViewControllerAnimated(true, completion: nil)
            })
          }
      }

      
        if (myLocations.count > 1){
            let sourceIndex = myLocations.count - 1
            let destinationIndex = myLocations.count - 2
            
            let c1 = myLocations[sourceIndex].coordinate
            let c2 = myLocations[destinationIndex].coordinate
            
            var a = [c1, c2]
            let polyline = MKPolyline(coordinates: &a, count: a.count)
            if debug {
                NSLog("UserLocation: \(theMap.userLocation.coordinate)")
                NSLog("polyline point count: \(polyline.pointCount)")
            }
            theMap.addOverlay(polyline)
            
            //MKCircle
        }
        
    }
    
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        
        if overlay is MKPolyline {
            let polylineRenderer = MKPolylineRenderer(overlay: overlay)
            polylineRenderer.strokeColor = UIColor.blueColor()
            polylineRenderer.lineWidth = 4
            return polylineRenderer
        }
        return MKOverlayRenderer()
    }

    func printStations(dict: NSDictionary?) {
        // Put all stations from the dictionary into a
        let stations = dict?.allKeys as! [String]
        print("No. Stations: \(dict!.count)")
        print("All Stations: \(dict!.allKeys)")
        if let stationDict = dict {
            for station in stations {
                let stationName: AnyObject? = stationDict.valueForKey(station)?.valueForKey("Name")
                let stationPosition = stationsDict![station]!.valueForKey("Position") as! NSArray
                print("\(station) aka. \(stationName!) can be found on lat: \(stationPosition[1]) lon: \(stationPosition[0])")
            }
        }
       
    }

    func alertWithTitle(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
    alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
