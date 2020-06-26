//
//  DetailViewController.swift
//  TravellingApp
//
//  Created by Mohamed El Hanafi on 6/24/20.
//  Copyright © 2020 Mohamed El Hanafi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var priceButton: UIButton!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var segmentControll: UISegmentedControl!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let cellId = "cellId"
    private let sectionInsets = UIEdgeInsets(top: 8.0,left: 8.0,bottom: 8.0,right: 8.0)
    private let itemsPerRow :CGFloat = 1
    
    var flights: [Flight] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setDataSource()
        
        setView()
    }
    
    private func setDataSource() {
        let flight1 = Flight(departure: Flight.FlightDetails(time: .init(), location: "Tunisia", airport: "Carthage"), arrival: Flight.FlightDetails(time: Date(timeIntervalSinceNow: TimeInterval(10000)), location: "Italie", airport: "Roma"), price: 630, state: .top, hasStops: true)
        
        let flight2 = Flight(departure: Flight.FlightDetails(time: .init(), location: "Tunisia", airport: "Carthage"), arrival: Flight.FlightDetails(time: Date(timeIntervalSinceNow: TimeInterval(10000)), location: "France", airport: "Paris"), price: 1030, state: .med, hasStops: false)
        
        flights.append(flight1)
        flights.append(flight2)
    }
    
    private func setView() {
        priceButton.roundView(raduis: priceButton.frame.height / 2)
        
        profileButton.roundView(raduis: priceButton.frame.height / 2)
        searchButton.roundView(raduis: priceButton.frame.height / 2)
        
        let selectedtitleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.primaryColor, NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .headline)]
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .headline)]
        
        segmentControll.setTitleTextAttributes(titleTextAttributes, for: .normal)
        segmentControll.setTitleTextAttributes(selectedtitleTextAttributes, for: .selected)
        segmentControll.roundView(raduis: segmentControll.frame.height / 2, borderColor: .white, borderWidth: 0.5)
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "FlightCell", bundle: nil), forCellWithReuseIdentifier: cellId)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        backgroundImageView.roundViewCorners(fromSide: [.bottomLeft, .bottomRight], withRaduis: 80)
    }

}

extension DetailViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 2)
        let availableWidth = self.view.frame.size.width - paddingSpace
        let widthPerItem = (availableWidth / itemsPerRow).rounded(.down)
        return .init(width: widthPerItem, height: 230)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }

}

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return flights.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FlightCell
        
        cell.contentView.roundViewWithShadow(raduis: 20, shadowColor: .gray, shadowRaduis: 10, shadowOpacity: 0.6)
        cell.contentView.layer.masksToBounds = true;
        
        cell.layer.masksToBounds = false
        
        cell.viewModel = FlightViewModel(flight: flights[indexPath.item])
        return cell
    }
}
