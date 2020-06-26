//
//  FlightCell.swift
//  TravellingApp
//
//  Created by Mohamed El Hanafi on 6/25/20.
//  Copyright © 2020 Mohamed El Hanafi. All rights reserved.
//

import UIKit

class FlightCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var badgeView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var departureDateLabel: UILabel!
    @IBOutlet weak var departureLocationLabel: UILabel!
    @IBOutlet weak var departureTimeLabel: UILabel!
    @IBOutlet weak var arrivalDateLabel: UILabel!
    @IBOutlet weak var arrivalLocationLabel: UILabel!
    @IBOutlet weak var arrivalTimeLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    var viewModel: FlightViewModel? {
        didSet {
            guard let viewModel = viewModel else {return}
            statusLabel.text = viewModel.state
            priceLabel.text = viewModel.price
            
            departureDateLabel.text = viewModel.departureDate
            departureLocationLabel.text = viewModel.departureCountry
            departureTimeLabel.text = viewModel.departureTime
            
            arrivalDateLabel.text = viewModel.arrivalDate
            arrivalLocationLabel.text = viewModel.arrivalCountry
            arrivalTimeLabel.text = viewModel.arrivalTime
            
            durationLabel.text = viewModel.flightDuration
            badgeView.backgroundColor = viewModel.statusColor
        }
    }
    
    private let cellID = "cellID"
    private let lastcellID = "lastcellID"
    
    var hasStops: Bool {
       return viewModel?.hasStops ?? false
    }
    var itemsPerRow: Int {
        return hasStops ? 3 : 2
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        roundViewWithShadow(raduis: 20, shadowColor: .gray, shadowRaduis: 10, shadowOpacity: 0.6)
        badgeView.roundViewCorners(fromSide: [.bottomLeft], withRaduis: 20)
        
        collectionView.register(UINib(nibName: "IndicatorCell", bundle: nil), forCellWithReuseIdentifier: cellID)
        collectionView.register(UINib(nibName: "LastIndicatorCell", bundle: nil), forCellWithReuseIdentifier: lastcellID)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension FlightCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let lastCellWidth = 30
        if indexPath.item == itemsPerRow - 1 {
            return .init(width: lastCellWidth, height: 20)
        }else {
            if hasStops {
                
                let widthPerItem = (collectionView.frame.size.width / 2) - CGFloat(lastCellWidth / 2)
                return .init(width: widthPerItem, height: 20)
            }else {
                
                let widthPerItem = (collectionView.frame.size.width) - CGFloat(lastCellWidth)
                return .init(width: widthPerItem, height: 20)
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}

extension FlightCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsPerRow
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if hasStops {
            if indexPath.item != itemsPerRow - 1 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! IndicatorCell
                return cell
            }else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: lastcellID, for: indexPath) as! LastIndicatorCell
                return cell
            }
        }else {
            if indexPath.item == 0 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! IndicatorCell
                return cell
            }else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: lastcellID, for: indexPath) as! LastIndicatorCell
                return cell
            }
        }
        
        
    }
}
