import UIKit

enum Color {
    var value: UIColor {
        var instanceColor = UIColor.clear
        switch self {
        case .angieGreen:
            instanceColor = UIColor(red: 0.13, green: 0.49, blue: 0.17, alpha: 1.0)
        case .white:
            instanceColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        case .custom(let red, let green, let blue, let alpha):
            instanceColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        }
        return instanceColor
    }
}
