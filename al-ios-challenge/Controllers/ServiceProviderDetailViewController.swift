import UIKit

class ServiceProviderDetailViewController: UIViewController {
    
    var serviceProvider: ServiceProvider?
    
    @IBOutlet var serviceProviderDetailView: ServiceProviderDetailView!

    override func viewDidLoad() {
        let pro = self.serviceProvider!
        print("Opening details for \(pro.name)")
        self.navigationItem.title = pro.name;
        ServiceProviderMapper.toServiceProviderDetailView(serviceProvider: self.serviceProvider!, serviceProviderDetailView: self.serviceProviderDetailView)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
