

import UIKit
class mahfazaPage: UIViewController {

    @IBOutlet weak var BuPay: UIButton!
    @IBOutlet weak var BuWaitPay: UIButton!
    @IBOutlet weak var PaidPG: UIView!
    @IBOutlet weak var WaitpayPG: UIView!
    @IBOutlet weak var LaPaid: UILabel!
    @IBOutlet weak var LaWaitpay: UILabel!
    @IBOutlet weak var LaCalender: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PaidPG.layer.masksToBounds = true
        WaitpayPG.layer.masksToBounds = true
        
        BuPay.layer.maskedCorners = [ .layerMinXMaxYCorner, .layerMinXMinYCorner]
         BuWaitPay.layer.maskedCorners = [ .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
    }
    
    
    @IBAction func Paid(_ sender: Any) {
        
        BuPay.backgroundColor = .white
               BuPay.setTitleColor(.systemPink, for: .normal)
               BuWaitPay.backgroundColor = .systemPink
               BuWaitPay.setTitleColor(.white, for: .normal)
        self.view.bringSubviewToFront(PaidPG)
    }
    
    
    @IBAction func WaitingToPay(_ sender: Any) {
        BuWaitPay.backgroundColor = .white
               BuWaitPay.setTitleColor(.systemPink, for: .normal)
               BuPay.backgroundColor = .systemPink
               BuPay.setTitleColor(.white, for: .normal)
        self.view.bringSubviewToFront(WaitpayPG)
    }
    
  
}
