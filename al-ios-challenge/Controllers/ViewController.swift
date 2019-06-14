import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var serviceProviders: [ServiceProvider] = []
    
    @IBOutlet var serviceProviderTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return serviceProviders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let serviceProviderCell = tableView.dequeueReusableCell(withIdentifier: "ServiceProviderTableViewCell", for: indexPath) as! ServiceProviderTableViewCell
        let serviceProvider = serviceProviders[indexPath.row]
        return ServiceProviderMapper.toServiceProviderTableViewCell(serviceProvider: serviceProvider, serviceProviderCell: serviceProviderCell)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        ServiceProviderService.fetchServiceProviders { (serviceProviders) in
            self.serviceProviders.append(contentsOf: serviceProviders)
            self.serviceProviders.sort(by: { sp1, sp2 in return sp1.name < sp2.name})
            DispatchQueue.main.async {
                self.serviceProviderTableView.reloadData()
            }
        }
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

