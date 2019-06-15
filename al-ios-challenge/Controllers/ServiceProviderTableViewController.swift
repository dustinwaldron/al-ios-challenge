import UIKit

class ServiceProviderTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var serviceProviders: [ServiceProvider] = []
    var selectedServiceProvider: ServiceProvider?
    
    @IBOutlet var serviceProviderTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return serviceProviders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let serviceProviderCell = tableView.dequeueReusableCell(withIdentifier: "ServiceProviderTableViewCell", for: indexPath) as! ServiceProviderTableViewCell
        let serviceProvider = serviceProviders[indexPath.row]
        return ServiceProviderMapper.toServiceProviderTableViewCell(serviceProvider: serviceProvider, serviceProviderCell: serviceProviderCell)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewServiceProviderDetail" {
            let controller = segue.destination as! ServiceProviderDetailViewController
            controller.serviceProvider = self.selectedServiceProvider
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedServiceProvider = serviceProviders[indexPath.row]
        self.performSegue(withIdentifier: "viewServiceProviderDetail", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if (self.serviceProviders.isEmpty) {
            ServiceProviderService.fetchServiceProviders { (serviceProviders) in
                self.serviceProviders.append(contentsOf: serviceProviders)
                self.serviceProviders.sort(by: { sp1, sp2 in return sp1.name < sp2.name})
                DispatchQueue.main.async {
                    self.serviceProviderTableView.reloadData()
                }
            }
        }
        self.navigationItem.title = "Serviceproviders";
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

