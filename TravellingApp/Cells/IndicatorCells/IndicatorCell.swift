//
//  IndicatorCell.swift
//  TravellingApp
//
//  Created by Mohamed El Hanafi on 6/25/20.
//  Copyright © 2020 Mohamed El Hanafi. All rights reserved.
//

import UIKit

class IndicatorCell: UICollectionViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var dashedView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        dashedView.drawDottedLine(dashLenght: 2, gapLength: 2)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
}
