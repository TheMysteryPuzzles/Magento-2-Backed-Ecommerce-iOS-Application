//
//  VisitShowroomViewController.swift
//  MagentoAPI
//
//  Created by Work on 2/14/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class VisitShowroomViewController: GoogleDirectionsNetworkLayerViewController {

   // 24.808418, 67.039235
    let destination = CLLocation(latitude: 24.808418, longitude: 67.039235)
    var showRooms: [[String : String?]]?
    private func addMarker(){
       
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        
        marker.position = CLLocationCoordinate2D(latitude: 24.807255, longitude: 67.039414)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = visitShowroomView.mapView
    }
    
    
    lazy var visitShowroomView: VisitShowroomView = {
       let view = VisitShowroomView(frame: self.view.bounds)
        view.delegate = self
       return view
    }()
    
    func handleDirections(){
        self.getUserCurrentLocation()
    }
    
    func updateUserLocationOnMap(withLatitude latitude: CLLocationDegrees, withLongitude longitude: CLLocationDegrees){
        
          let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 20.0)
        
        visitShowroomView.mapView.camera = camera
        
       /* let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = visitShowroomView.mapView*/
    }
    
    private func getAllShowrooms(){
     
        var request = URLRequest(url: URL(string: "http://157.230.218.91/magenta/blindapi/storelocator")!)
        
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(ShowroomJSONModel.self, from: data!)
                self.showRooms = responseModel.response!.data!.storelocations
            } catch {
                print("JSON Serialization error")
            }
        }).resume()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
    addMarker()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(visitShowroomView)
        
        getAllShowrooms()
        
        self.actionHandler = { (latitude,longitude) in
            self.updateUserLocationOnMap(withLatitude: latitude, withLongitude: longitude)
            
            self.drawPath(startLocation: CLLocation(latitude: latitude, longitude: longitude), endLocation: self.destination, completionHandler: { (model) in
                
                for route in model.routes!
                {
                    let routeOverviewPolyline = route.overviewPolyline
                    let points = routeOverviewPolyline?.points
                    let path = GMSPath.init(fromEncodedPath: points!)
                    let polyline = GMSPolyline.init(path: path)
                    polyline.strokeWidth = 5
                    polyline.strokeColor = UIColor.blue
                    polyline.map = self.visitShowroomView.mapView
                }
            })
        }
    }
}

extension VisitShowroomViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShowroomCell", for: indexPath)
        return cell
    }
    
    
}
