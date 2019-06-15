import Foundation
import UIKit
import CoreLocation

class ServiceProviderMapper {
    static private func makeLocationLabelString(serviceProvider: ServiceProvider) -> String {
        return "\(serviceProvider.city), \(serviceProvider.state) \(serviceProvider.postalCode)"
    }
    
    static func toServiceProviderTableViewCell(serviceProvider: ServiceProvider, serviceProviderCell: ServiceProviderTableViewCell) -> ServiceProviderTableViewCell {
        serviceProviderCell.nameLabel?.text = serviceProvider.name
        serviceProviderCell.gradeLabel?.text = serviceProvider.overallGrade
        serviceProviderCell.gradeLabel?.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        serviceProviderCell.gradeLabel?.backgroundColor = UIColor(red: 0.13, green: 0.49, blue: 0.17, alpha: 1.0)
        serviceProviderCell.gradeLabel?.layer.cornerRadius = serviceProviderCell.gradeLabel!.frame.height / 2.0
        serviceProviderCell.gradeLabel?.layer.masksToBounds = true;
        serviceProviderCell.reviewLabel?.text = "\(serviceProvider.reviewCount) Recent Reviews"
        serviceProviderCell.locationLabel?.text = makeLocationLabelString(serviceProvider: serviceProvider)
        return serviceProviderCell
    }
    
    static func toServiceProviderDetailView(serviceProvider: ServiceProvider, serviceProviderDetailView: ServiceProviderDetailView) {
        serviceProviderDetailView.nameLabel?.text = serviceProvider.name
        serviceProviderDetailView.gradeLabel?.text = "Grade: \(serviceProvider.overallGrade)"
        serviceProviderDetailView.reviewLabel?.text = "Reviews: \(serviceProvider.reviewCount)"
        serviceProviderDetailView.locationLabel?.text = makeLocationLabelString(serviceProvider: serviceProvider)
    }
    
    static func toServiceProviderMapPin(serviceProvider: ServiceProvider) -> ServiceProviderDetailMapPin {
        return ServiceProviderDetailMapPin(name: serviceProvider.name, location: makeLocationLabelString(serviceProvider: serviceProvider), discipline: "Service Provider", coordinate: CLLocationCoordinate2D(latitude: serviceProvider.latitude, longitude: serviceProvider.longitude))
    }
}
