import UIKit
import MapKit

class ServiceProviderDetailViewController: UIViewController {
    
    var serviceProvider: ServiceProvider?
    
    @IBOutlet weak var serviceProviderMapView: ServiceProviderDetailMapView!
    @IBOutlet weak var serviceProviderDetailView: ServiceProviderDetailView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let pro = self.serviceProvider!
        print("Opening details for Service Provider: \(pro.name)")
        self.navigationItem.title = pro.name;
        // initalize map view
        serviceProviderMapView.centerMapOnServiceProviderLocation(serviceProvider: pro)
        let pin = ServiceProviderMapper.toServiceProviderMapPin(serviceProvider: pro)
        serviceProviderMapView.addAnnotation(pin)
        // initialize detail view
        ServiceProviderMapper.toServiceProviderDetailView(serviceProvider: pro, serviceProviderDetailView: self.serviceProviderDetailView)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
