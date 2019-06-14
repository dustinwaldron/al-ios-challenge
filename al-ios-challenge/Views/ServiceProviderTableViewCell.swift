import Foundation
import UIKit

class ServiceProviderTableViewCell : UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var reviewLabel: UILabel!
    @IBOutlet var gradeLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
