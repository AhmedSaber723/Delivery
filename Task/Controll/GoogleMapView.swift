

import UIKit
import GoogleMaps
import GooglePlaces
import SwiftyJSON
import Alamofire
@available(iOS 13.0, *)
class GoogleMapView: UIViewController,CLLocationManagerDelegate , GMSMapViewDelegate {
    
    var MapView : GMSMapView!
    var LocationManager = CLLocationManager()
    var mark = GMSMarker()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MapView = GMSMapView()
        MapView.translatesAutoresizingMaskIntoConstraints = false
        MapView.delegate = self
        MapView.isMyLocationEnabled = true
        LocationManager.delegate = self
        LocationManager.requestWhenInUseAuthorization()
        LocationManager.startMonitoringSignificantLocationChanges()
        
        SetView()
       
        Getlocation(lat: LLat! , long: LLong! )
    }
    
    func Getlocation(lat: String , long: String) {
        
        let lat = CLLocationDegrees(lat)
        let long = CLLocationDegrees(long)
        mark.position = CLLocationCoordinate2D(latitude: lat!, longitude: long!)
      //  mark.title = plase.name
        mark.map = MapView
        let camera = GMSCameraPosition(latitude: lat!, longitude: long!, zoom: 18)
        MapView.camera = camera
    }

    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    let BuBack : UIButton = {
        let bu = UIButton()
        bu.setImage(#imageLiteral(resourceName: "arrow-left"), for: .normal)
        bu.tintColor = .black
        bu.imageView?.tintColor = .gray
        bu.addTarget(self, action: #selector(BuBackHome), for: .touchUpInside)
        bu.translatesAutoresizingMaskIntoConstraints = false
        bu.clipsToBounds = true
        return bu
        
    }()
    
    @objc func BuBackHome() {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "NavHome")
        vc?.modalPresentationStyle = .fullScreen
        present(vc!,animated: true ,completion: nil)
        
        
    }
    let BuGetDirecation : UIButton = {
        let bu = UIButton()
        bu.setImage(#imageLiteral(resourceName: "Getdirection"), for: .normal)
        bu.backgroundColor = .white
        bu.cornerRadius = 25
        bu.tintColor = .gray
        bu.imageView?.tintColor = .gray
        bu.addTarget(self, action: #selector(BuDirrication), for: .touchUpInside)
        bu.translatesAutoresizingMaskIntoConstraints = false
        bu.clipsToBounds = true
        return bu
        
    }()
    
    @objc func BuDirrication() {
        
        getDirection(latt: LLat!, longg: LLong! )
        
        
    }
  
    
    let BuMyLocation : UIButton = {
        let bu = UIButton()
        bu.setImage(#imageLiteral(resourceName: "my_location"), for: .normal)
        bu.backgroundColor = .white
        bu.cornerRadius = 25
        bu.tintColor = .gray
        bu.imageView?.tintColor = .gray
        bu.addTarget(self, action: #selector(BuSetLocation), for: .touchUpInside)
        bu.translatesAutoresizingMaskIntoConstraints = false
        bu.clipsToBounds = true
        return bu
        
    }()
    @objc func BuSetLocation() {
        
        let location : CLLocation? = MapView.myLocation
        if location != nil {
       
            CATransaction.begin()
            CATransaction.setValue(1, forKey: kCATransactionAnimationDuration)
            MapView.animate(to: GMSCameraPosition.camera(withTarget: (location?.coordinate)!, zoom: 17))
            CATransaction.commit()
            LocationManager.startMonitoringSignificantLocationChanges()
        }
         
       
    }
    
  @objc  func getDirection (latt:String , longg:String) {
           
          let location: CLLocation? = MapView.myLocation
        let UserLat = (location?.coordinate.latitude)!
        let UserLong = (location?.coordinate.longitude)!
           // 30.60711  32.277685
               let CustomLat = CLLocationDegrees(latt)
               let CustomLong = CLLocationDegrees(longg)
             
              
//           let marker1 = GMSMarker()
//                     marker1.icon = UIImage(named: "map_Pin")
//                     marker1.position = CLLocationCoordinate2D(latitude: CustomLat!, longitude: CustomLong!)
//                     marker1.map = self.MapView
//
              
                let origin = "\(UserLat),\(UserLong)"
                  print(origin)
        let destination = "\(String(describing: CustomLat!)),\(String(describing: CustomLong!))"
                 let url = "https://maps.googleapis.com/maps/api/directions/json?origin=\(origin)&destination=\(destination)&mode=driving&key=AIzaSyAiSGBDlpRLfGwcghxDz3fpb2yx3oFm9Qs"
              
              print(url)
              
              
                 AF.request(url).responseJSON { (response) in
                  guard let data = response.data else {return}
                  do {
                   
                  
                     let json = try JSON(data: data)
                     let routes = json["routes"].arrayValue
                  print(json)
                  
                     for route in routes
                     {
                         let routeOverviewPolyline = route["overview_polyline"].dictionary
                         let points = routeOverviewPolyline?["points"]?.string
                         let path = GMSPath.init(fromEncodedPath: points ?? "")
                         let polyline = GMSPolyline(path: path)
                         polyline.strokeColor = .systemGreen
                         polyline.strokeWidth = 10
                      polyline.map = self.MapView
                       
                      

                     }
                  }
                  catch let error {
                      print(error.localizedDescription)
                  }
                 }

       }
    
    
    func SetView() {
        
        view.addSubview(MapView)
        MapView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        MapView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        MapView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        MapView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        view.addSubview(BuMyLocation)
        BuMyLocation.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
        BuMyLocation.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        BuMyLocation.widthAnchor.constraint(equalToConstant: 50).isActive = true
        BuMyLocation.heightAnchor.constraint(equalTo: BuMyLocation.widthAnchor).isActive = true
        
        view.addSubview(BuGetDirecation)
        BuGetDirecation.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
        BuGetDirecation.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        BuGetDirecation.widthAnchor.constraint(equalToConstant: 50).isActive = true
        BuGetDirecation.heightAnchor.constraint(equalTo: BuMyLocation.widthAnchor).isActive = true
        
        view.addSubview(BuBack)
        BuBack.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        BuBack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true

        
    }

}
