//
//  RestaurantCell.swift
//  RxSwiftSample
//
//  Created by nguyen.duc.huyb on 8/16/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//


final class RestaurantCell: UITableViewCell {
    @IBOutlet private weak var restaurantNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func configCell(_ restaurants: Restaurants) {
        restaurantNameLabel.text = restaurants.restaurant?.name
    }
}
