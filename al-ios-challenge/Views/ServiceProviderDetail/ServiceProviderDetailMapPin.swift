import MapKit

class ServiceProviderDetailMapPin: NSObject, MKAnnotation {
    let title: String?
    let location: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    
    init(name: String, location: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.title = name
        self.location = location
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return location
    }
}
