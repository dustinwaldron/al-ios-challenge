import Foundation

class ServiceProvider {
    var name: String
    var city: String
    var overallGrade: String
    var reviewCount: Int32
    var state: String
    var postalCode: String
    var latitude: Double
    var longitude: Double
    
    init(name: String, city: String, overallGrade: String, reviewCount: Int32, state: String,
         postalCode: String, latitude: Double, longitude: Double) {
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
