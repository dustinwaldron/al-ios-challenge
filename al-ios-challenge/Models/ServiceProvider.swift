import Foundation

class ServiceProvider {
    var name: String
    var city: String
    var overallGrade: String
    var reviewCount: Int32
    var state: String
    var postalCode: String
    var latitude: String
    var longitude: String
    
    init(name: String, city: String, overallGrade: String, reviewCount: Int32, state: String,
         postalCode: String, latitude: String, longitude: String) {
        self.name = name
        self.city = city
        self.overallGrade = overallGrade
        self.reviewCount = reviewCount
        self.state = state
        self.postalCode = postalCode
        self.latitude = latitude
        self.longitude = longitude
    }
}
