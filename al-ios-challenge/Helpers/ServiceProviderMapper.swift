//
//  ServiceProviderMapper.swift
//  al-ios-challenge
//
//  Created by Dustin Waldron on 6/13/19.
//  Copyright © 2019 Dustin Waldron. All rights reserved.
//

import Foundation
import UIKit

class ServiceProviderMapper {
    static func toServiceProviderTableViewCell(serviceProvider: ServiceProvider, serviceProviderCell: ServiceProviderTableViewCell) -> ServiceProviderTableViewCell {
        serviceProviderCell.nameLabel?.text = serviceProvider.name
        serviceProviderCell.gradeLabel?.text = serviceProvider.overallGrade
        serviceProviderCell.gradeLabel?.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        serviceProviderCell.gradeLabel?.backgroundColor = UIColor(red: 0.13, green: 0.49, blue: 0.17, alpha: 1.0)
        serviceProviderCell.gradeLabel?.layer.cornerRadius = serviceProviderCell.gradeLabel!.frame.height / 2.0
        serviceProviderCell.gradeLabel?.layer.masksToBounds = true;
        serviceProviderCell.reviewLabel?.text = "\(serviceProvider.reviewCount) Recent Reviews"
        serviceProviderCell.locationLabel?.text = "\(serviceProvider.city), \(serviceProvider.state) \(serviceProvider.postalCode)"
        return serviceProviderCell
    }
}
