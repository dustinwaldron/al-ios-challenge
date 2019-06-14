//
//  MovieTransformer.swift
//  movie-finder
//
//  Created by Dustin Waldron on 6/8/19.
//  Copyright © 2019 Dustin Waldron. All rights reserved.
//
import Foundation

class ServiceProviderJSONTrasformer {
    static private func toString(object: AnyObject?) -> String {
        let objectAsString = object as? String ?? ""
        return objectAsString
    }
    
    static private func toInt32(object: AnyObject?) -> Int32 {
        let objectAsInt32 = object as? Int32 ?? 0
        return objectAsInt32
    }
    
    static func toServiceProvider(json: [String: AnyObject]) -> ServiceProvider {
        let name = toString(object: json["name"])
        let city = toString(object: json["city"])
        let overallGrade = toString(object: json["overallGrade"])
        let reviewCount = toInt32(object: json["reviewCount"])
        let state = toString(object: json["state"])
        let postalCode = toString(object: json["postalCode"])
        let latitude = toString(object: json["latitude"])
        let longitude = toString(object: json["longitude"])
        return ServiceProvider(name: name, city: city, overallGrade: overallGrade, reviewCount: reviewCount, state: state, postalCode: postalCode, latitude: latitude, longitude: longitude)
    }
    
    static func toServiceProviderList(json: [String: AnyObject]?) -> [ServiceProvider] {
        guard let json = json, let movies = json["serviceproviders"] as? [[String: AnyObject]]
            else { return [] }
        return movies.map(toServiceProvider)
    }
}
