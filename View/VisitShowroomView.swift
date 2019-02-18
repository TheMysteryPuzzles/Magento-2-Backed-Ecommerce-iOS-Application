//
//  VisitShowroomView.swift
//  MagentoAPI
//
//  Created by Work on 2/14/19.
//  Copyright © 2019 TheMysteryPuzzles. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class VisitShowroomView: UIView {
    
    var delegate: VisitShowroomViewController?
    
    lazy var showroomCollectionViewLayout: UICollectionViewFlowLayout = {
       let flowLayout = UICollectionViewFlowLayout()
       flowLayout.itemSize = CGSize(width: self.frame.width, height: (self.frame.height/2) - 10)
       return flowLayout
    }()
    
    
    lazy var showroomCollectionView: UICollectionView = {
       let view = UICollectionView(frame: .zero, collectionViewLayout: showroomCollectionViewLayout)
       view.translatesAutoresizingMaskIntoConstraints = false
       view.backgroundColor = UIColor.green
       return view
    }()
    
    private func setupshowroomCollectionViewCnstraints(){
        NSLayoutConstraint.activate([
            showroomCollectionView.topAnchor.constraint(equalTo: self.safeTopAnchor),
            showroomCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            showroomCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            showroomCollectionView.bottomAnchor.constraint(equalTo: self.safeBottomAnchor)
            ])
    }
    
    lazy var mapView: GMSMapView = {
        
        let camera = GMSCameraPosition.camera(withLatitude: 24.807255, longitude: 67.039414, zoom: 15.0)
        var view = GMSMapView.map(withFrame: CGRect(x: 10, y: self.frame.minY + navBarHeight! + 20, width: self.frame.width - 20, height: self.frame.height * 0.3), camera: camera)
        view.isMyLocationEnabled = true
        view.settings.myLocationButton = true
        view.settings.compassButton = true
        view.settings.zoomGestures = true
        return view
    }()
    
    private func setupMapViewConstraints(){
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: self.safeTopAnchor, constant: 70),
            mapView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            mapView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            mapView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3)
            ])
       }
    
    lazy var showRoomNameLabel : UILabel = {
       let label = UILabel()
       label.text = "The Protectors DHA Karachi Showroom"
       label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 32)
       label.translatesAutoresizingMaskIntoConstraints = false
       label.backgroundColor = UIColor.clear
       return label
    }()

    private func setupShowRoomNameLabelConstraints(){
        NSLayoutConstraint.activate([
            showRoomNameLabel.topAnchor.constraint(equalTo: self.mapView.bottomAnchor, constant: 5),
            showRoomNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            showRoomNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            showRoomNameLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.05)
            ])
      }
    
    lazy var addressLabel: UILabel = {
       let label = UILabel()
       let formattedString = NSMutableAttributedString()
        formattedString
            .bold("Address:")
            .normal(" 26th Street, Phase V Tauheed Commercial Area Phase 5 Defence Housing Authority, Karachi, Karachi City, Sindh 75500")
       label.attributedText = formattedString
       label.adjustsFontSizeToFitWidth = true
       label.translatesAutoresizingMaskIntoConstraints = false
       label.backgroundColor = UIColor.clear
       label.numberOfLines = 0
        return label
    }()
    
    private func setupAddressLabelConstraints(){
        NSLayoutConstraint.activate([
            addressLabel.topAnchor.constraint(equalTo: self.showRoomNameLabel.bottomAnchor, constant: 5),
            addressLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            addressLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            addressLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15)
            ])
    }
    
    lazy var latitudeValueLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.backgroundColor = UIColor.clear
        label.text = "67358332.232,"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupLatitudeValueLabelConstraints(){
        NSLayoutConstraint.activate([
            latitudeValueLabel.topAnchor.constraint(equalTo: self.addressLabel.bottomAnchor, constant: 5),
            latitudeValueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            latitudeValueLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.45),
            latitudeValueLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.05)
            ])
    }
    
    lazy var longitudeValueLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.backgroundColor = UIColor.clear
        label.text = "83878332.232"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setuplongitudeValueLabelConstraints(){
        NSLayoutConstraint.activate([
            longitudeValueLabel.topAnchor.constraint(equalTo: self.addressLabel.bottomAnchor, constant: 5),
            longitudeValueLabel.leadingAnchor.constraint(equalTo: self.latitudeValueLabel.trailingAnchor, constant: 10),
            longitudeValueLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.45),
            longitudeValueLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.05)
            ])
       }

    lazy var getDirectionsButton: UIButton = {
       let button = UIButton()
        button.setTitle("Get Directions", for: .normal)
         button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .gray
       button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleDirections), for: .touchUpInside)
       return button
    }()
    
    private func setupgetDirectionsButtonConstraints(){
        NSLayoutConstraint.activate([
            getDirectionsButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            getDirectionsButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4),
            getDirectionsButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.05),
            getDirectionsButton.topAnchor.constraint(equalTo: self.latitudeValueLabel.bottomAnchor, constant: 5)
          ])
    }
    
    @objc func handleDirections(){
        delegate?.handleDirections()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
     /*   self.addSubview(showroomCollectionView)
        setupshowroomCollectionViewCnstraints()*/
      
        self.addSubview(mapView)
        //setupMapViewConstraints()
        
        self.addSubview(showRoomNameLabel)
        setupShowRoomNameLabelConstraints()
        
        self.addSubview(addressLabel)
        setupAddressLabelConstraints()
  
        self.addSubview(latitudeValueLabel)
        setupLatitudeValueLabelConstraints()
        
        self.addSubview(longitudeValueLabel)
        setuplongitudeValueLabelConstraints()
        
        self.addSubview(getDirectionsButton)
        setupgetDirectionsButtonConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class VisitShowroomCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
       lazy var mapView: GMSMapView = {
            
            let camera = GMSCameraPosition.camera(withLatitude: 24.807255, longitude: 67.039414, zoom: 15.0)
            var view = GMSMapView.map(withFrame: CGRect(x: 10, y:  self.frame.minY + navBarHeight! + 20, width: self.frame.width - 20, height: self.frame.height * 0.3), camera: camera)
            view.isMyLocationEnabled = true
            view.settings.myLocationButton = true
            view.settings.compassButton = true
            view.settings.zoomGestures = true
            return view
        }()
        
        func setupMapViewConstraints(){
            NSLayoutConstraint.activate([
                mapView.topAnchor.constraint(equalTo: self.safeTopAnchor, constant: 70),
                mapView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
                mapView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
                mapView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3)
                ])
        }
        
         var showRoomNameLabel : UILabel = {
            let label = UILabel()
            label.text = "The Protectors DHA Karachi Showroom"
            label.adjustsFontSizeToFitWidth = true
            label.font = UIFont.boldSystemFont(ofSize: 32)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.backgroundColor = UIColor.clear
            return label
        }()
        
         func setupShowRoomNameLabelConstraints(){
            NSLayoutConstraint.activate([
                showRoomNameLabel.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 5),
                showRoomNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
                showRoomNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
                showRoomNameLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.05)
                ])
        }
        
         var addressLabel: UILabel = {
            let label = UILabel()
            let formattedString = NSMutableAttributedString()
            formattedString
                .bold("Address:")
                .normal(" 26th Street, Phase V Tauheed Commercial Area Phase 5 Defence Housing Authority, Karachi, Karachi City, Sindh 75500")
            label.attributedText = formattedString
            label.adjustsFontSizeToFitWidth = true
            label.translatesAutoresizingMaskIntoConstraints = false
            label.backgroundColor = UIColor.clear
            label.numberOfLines = 0
            return label
        }()
        
         func setupAddressLabelConstraints(){
            NSLayoutConstraint.activate([
                addressLabel.topAnchor.constraint(equalTo: showRoomNameLabel.bottomAnchor, constant: 5),
                addressLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
                addressLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
                addressLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15)
                ])
        }
        
         var latitudeValueLabel: PaddingLabel = {
            let label = PaddingLabel()
            label.backgroundColor = UIColor.clear
            label.text = "67358332.232,"
            label.font = UIFont.boldSystemFont(ofSize: 24)
            label.adjustsFontSizeToFitWidth = true
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
         func setupLatitudeValueLabelConstraints(){
            NSLayoutConstraint.activate([
                latitudeValueLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 5),
                latitudeValueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
                latitudeValueLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.45),
                latitudeValueLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.05)
                ])
        }
        
         var longitudeValueLabel: PaddingLabel = {
            let label = PaddingLabel()
            label.backgroundColor = UIColor.clear
            label.text = "83878332.232"
            label.font = UIFont.boldSystemFont(ofSize: 24)
            label.adjustsFontSizeToFitWidth = true
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
         func setuplongitudeValueLabelConstraints(){
            NSLayoutConstraint.activate([
                longitudeValueLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 5),
                longitudeValueLabel.leadingAnchor.constraint(equalTo: latitudeValueLabel.trailingAnchor, constant: 10),
                longitudeValueLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.45),
                longitudeValueLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.05)
                ])
        }
        
         var getDirectionsButton: UIButton = {
            let button = UIButton()
            button.setTitle("Get Directions", for: .normal)
            button.setTitleColor(UIColor.white, for: .normal)
            button.backgroundColor = .gray
            button.translatesAutoresizingMaskIntoConstraints = false
            //button.addTarget(self, action: #selector(handleDirections), for: .touchUpInside)
            return button
        }()
        
         func setupgetDirectionsButtonConstraints(){
            NSLayoutConstraint.activate([
                getDirectionsButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
                getDirectionsButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4),
                getDirectionsButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.05),
                getDirectionsButton.topAnchor.constraint(equalTo: latitudeValueLabel.bottomAnchor, constant: 5)
                ])
        }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
