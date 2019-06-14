import Foundation

class ServiceProviderService {
    static func fetchServiceProviders(completion: @escaping (_ serviceProviders: [ServiceProvider]) -> ()) {
        let url = "http://private-895ba-angieslistcodingchallenge.apiary-mock.com/angieslist/codingChallenge/serviceproviders"
        HTTPHandler.getJson(fromUrlString: url) { data in
            if let data = data {
                let object = JSONParser.parse(data: data)
                completion(ServiceProviderJSONTrasformer.toServiceProviderList(json: object))
            } else {
                completion([])
            }
        }
    }
}
