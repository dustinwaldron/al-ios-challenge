import UIKit

class ServiceProviderTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var serviceProviders: [ServiceProvider] = []
    var selectedServiceProvider: ServiceProvider?
    
    @IBOutlet weak var serviceProviderTableView: UITableView!
    
    private func sortServiceProviderTableView(sortOption: String) {
        print("Sorting service providers by \(sortOption)")
        switch sortOption {
        case "name":
            self.serviceProviders.sort(by: { sp1, sp2 in return sp1.name < sp2.name})
        case "reviewCount":
            self.serviceProviders.sort(by: { sp1, sp2 in return sp1.reviewCount > sp2.reviewCount})
        case "overallGrade":
            self.serviceProviders.sort(by: { sp1, sp2 in return sp1.overallGrade < sp2.overallGrade})
        default:
            print("invalid value for sortOption: \(sortOption)")
        }
        self.serviceProviderTableView.reloadData()
    }
    
    @IBAction func selectSort(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let sortByName = UIAlertAction(title: "Sort by name", style: .default) { (action:UIAlertAction) in
            self.sortServiceProviderTableView(sortOption: "name")
        }
        let sortByReviews = UIAlertAction(title: "Sort by reviews", style: .default) { (action:UIAlertAction) in
            self.sortServiceProviderTableView(sortOption: "reviewCount")
        }
        let sortByGrade = UIAlertAction(title: "Sort by grade", style: .default) { (action:UIAlertAction) in
            self.sortServiceProviderTableView(sortOption: "overallGrade")
        }
        alert.addAction(sortByName)
        alert.addAction(sortByReviews)
        alert.addAction(sortByGrade)
        self.present(alert, animated: true, completion: nil)
    }
    
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
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Serviceproviders";
    }


}

