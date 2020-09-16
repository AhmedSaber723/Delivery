
import UIKit
@available(iOS 13.0, *)
enum MenuType : Int {
    case Home
    case PickerUP
    case Wallet
    case Summary
    case profile
    
}
@available(iOS 13.0, *)
class MenuViewController: UITableViewController {
    
    var didMenuTyper: ((MenuType)-> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let MenuTyper = MenuType(rawValue: indexPath.row)else{return}
        dismiss(animated: true){[weak self] in
            print("\(MenuTyper)")
            self?.didMenuTyper?(MenuTyper)
        }
    }
}
