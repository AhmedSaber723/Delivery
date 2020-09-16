


import UIKit
@available(iOS 13.0, *)
class HomeViewController: UIViewController {
    
    @IBOutlet weak var ouDelivry: UIButton!
    @IBOutlet weak var ouReturn: UIButton!
    @IBOutlet weak var delivryPG: UIView!
    @IBOutlet weak var returnPG: UIView!
    
    let transiton = SlideInTransition()
    var topView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
          delivryPG.layer.masksToBounds = true
          returnPG.layer.masksToBounds = true
          if LocalizationSystem.sharedInstance.getLanguage() == "en" {
          ouDelivry.layer.maskedCorners = [ .layerMinXMaxYCorner, .layerMinXMinYCorner]
          ouReturn.layer.maskedCorners = [ .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
          } else {
              
              ouReturn.layer.maskedCorners = [ .layerMinXMaxYCorner, .layerMinXMinYCorner]
              ouDelivry.layer.maskedCorners = [ .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
          }
       
    }
    
    @IBAction func BuDelivry(_ sender: Any) {
        ouReturn.backgroundColor = .white
        ouReturn.setTitleColor(.systemPink, for: .normal)
        ouDelivry.backgroundColor = .systemPink
        ouDelivry.setTitleColor(.white, for: .normal)
        self.view.bringSubviewToFront(delivryPG)
    }
    @IBAction func BuReturns(_ sender: Any) {
        ouDelivry.backgroundColor = .white
        ouDelivry.setTitleColor(.systemPink, for: .normal)
        ouReturn.backgroundColor = .systemPink
        ouReturn.setTitleColor(.white, for: .normal)
        self.view.bringSubviewToFront(returnPG)
    }
    
    
    @IBAction func TapMenu(_ sender: UIBarButtonItem) {
        guard let MenuViewController = storyboard?.instantiateViewController(withIdentifier: "MenuViewController")as? MenuViewController else{ return}
        MenuViewController.didMenuTyper = { MenuType in 
            self.transitionToNew(MenuType)
        }
        
        MenuViewController.modalPresentationStyle = .overCurrentContext
        MenuViewController.transitioningDelegate = self
        present(MenuViewController, animated: true)
    
        
}
    func transitionToNew(_ menuType: MenuType){
        topView?.removeFromSuperview()
               switch menuType {
                
               case .Home:
               let Home = storyboard!.instantiateViewController(withIdentifier: "Home")
                addChild(Home)
               self.view.addSubview(Home.view)
               self.topView = Home.view
               let title = "Home".localized
                self.title = title
                
               case .PickerUP:
                let PickerUp = storyboard!.instantiateViewController(withIdentifier: "PickerUp")
                  addChild(PickerUp)
                  self.view.addSubview(PickerUp.view)
                  self.topView = PickerUp.view
                   let title = "Picker up".localized
                   self.title = title
                              
               case .Wallet:
                   let Wallet = storyboard!.instantiateViewController(withIdentifier: "Wallet")
                    addChild(Wallet)
                    self.view.addSubview(Wallet.view)
                    self.topView = Wallet.view
                    let title = "Wallet".localized
                    self.title = title
                              
               case .Summary:
                     let Summary = storyboard!.instantiateViewController(withIdentifier: "Summary")
                     addChild(Summary)
                       self.view.addSubview(Summary.view)
                        self.topView = Summary.view
                        let title = "Summary".localized
                        self.title = title
                
               case .profile:
                   let Profile = storyboard!.instantiateViewController(withIdentifier: "Profile")
                    addChild(Profile)
                      self.view.addSubview(Profile.view)
                       self.topView = Profile.view
                       let title = "Profile".localized
                       self.title = title
                                            
               
               default:
                   break
               }
    }
    
}
@available(iOS 13.0, *)
extension HomeViewController: UIViewControllerTransitioningDelegate{
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = true
        return transiton
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
       
        transiton.isPresenting = false
       return transiton
        
    }
   
}
