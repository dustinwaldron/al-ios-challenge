import Foundation

class ServiceProviderJSONTrasformer {
    static private func toString(object: AnyObject?) -> String {
        let objectAsString = object as? String ?? ""
        return objectAsString
    }
    
    static private func toString(object: Any?) -> String {
        let objectAsString = object as? String ?? ""
        return objectAsString
    }
    
    static private func toInt32(object: AnyObject?) -> Int32 {
        let objectAsInt32 = object as? Int32 ?? 0
        return objectAsInt32
    }
    
    static private func toDouble(object: Any?) -> Double {
        let objectAsDouble = Double(toString(object: object))
        return objectAsDouble!
    }
    
    static private func getCoordinate(key: String, object: AnyObject?) -> Double {
        if let object = object {
            return toDouble(object: object.value(forKeyPath: key))
        } else {
            return 0.0
        }
    }
    
    static func toServiceProvider(json: [String: AnyObject]) -> ServiceProvider {
        let name = toString(object: json["name"])
        let city = toString(object: json["city"])
        let overallGrade = toString(object: json["overallGrade"])
        let reviewCount = toInt32(object: json["reviewCount"])
        let state = toString(object: json["state"])
        let postalCode = toString(object: json["postalCode"])
        let latitude = getCoordinate(key: "latitude", object: json["coordinates"])
        let longitude = getCoordinate(key: "longitude", object: json["coordinates"])
        return ServiceProvider(name: name, city: city, overallGrade: overallGrade, reviewCount: reviewCount, state: state, postalCode: postalCode, latitude: latitude, longitude: longitude)
    }
    
    static func toServiceProviderList(json: [String: AnyObject]?) -> [ServiceProvider] {
        guard let json = json, let movies = json["serviceproviders"] as? [[String: AnyObject]]
            else { return [] }
        return movies.map(toServiceProvider)
    }
}
