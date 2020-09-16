import UIKit
import Alamofire
@available(iOS 13.0, *)
class HomeDelivryPg: UIViewController , UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var TableView: UITableView!
    typealias clientsCallBack = (_ ClientS:[Client]?, _ status: Bool, _ massage:String) -> Void
    var Calls:clientsCallBack?
   public var Clients = [Client]()
    let spinner = UIActivityIndicatorView()
    let loadingView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   completionHandler { [weak self] (ClientS, status, message) in
        if status {
            guard let self = self else {return}
            guard let _ClientS = ClientS else {return}
            self.Clients = _ClientS
            self.TableView.reloadData()
           
        }
    }
        getData()
        self.setloadingScreen()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return Clients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "HomeDelivry") as! HomeDelivryPG
         let client =  Clients[indexPath.row]
        tableView.rowHeight = 290
        cell.delegete = self
        cell.index = indexPath
        cell.LaName.text! = client.client_name!
        cell.LaPhoneNumber.text! = "0\(client.client_phone!)"
        cell.LaLocation.text! = client.client_address!
        cell.LaIdNumber.text! = "language".localized == "en" ?  "# \(client.id!)" : "\(client.id!) #"
        cell.SETClients(Client: client)
        return cell
    }

    func getData(){
    let urlstring = "http://belalhamdy6.pythonanywhere.com/api/client/"
       
        AF.request(urlstring, method: .get, interceptor: CustomInterceptor() ).responseJSON { (response: AFDataResponse<Any>) in
            
                guard let data = response.data else {
                    self.Calls?(nil,false,"")
                           return }
            
                do {
                    
                    let clients = try JSONDecoder().decode([Client].self, from: data)
                    self.Calls?(clients,true,"")
                    self.removeloadingScreen()
                }catch {
                    
                    self.Calls?(nil,false,error.localizedDescription)
                }

            
            }
        }
    
       func completionHandler(Calls: @escaping clientsCallBack) {
          self.Calls = Calls
      }

}
@available(iOS 13.0, *)
extension HomeDelivryPg : SetAction {

    
    func openWhats(PhoneNumber: String) {
           let urlWhats = "https://wa.me/+2\(PhoneNumber)"
              if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed){
                  if let whatsappURL = URL(string: urlString) {
                      if UIApplication.shared.canOpenURL(whatsappURL){
                        
                        
                             UIApplication.shared.open(whatsappURL, options: [:], completionHandler: nil)
                              
                           
                             
                          }
                      }
                      else {
                          print("Install Whatsapp")
                     
                          let download = "https://apps.apple.com/us/app/whatsapp-messenger/id310633997"
                          let url = URL(string: download)
                                                 
                          let alert = UIAlertController(title: "Whatsapp not found", message: nil, preferredStyle: .alert)
                         alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
                         alert.addAction(UIAlertAction(title: "Download", style: .default, handler: {(nil) in
                                                     
                         UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                                                     
                                                 }))
                         present(alert, animated: true, completion: nil)
                     
                      }
                  }
    }
    
    func callPhone(PhoneNumber: String) {
        
              guard let url = URL(string: "telprompt://\(PhoneNumber)"),
                UIApplication.shared.canOpenURL(url) else {
                return
            }
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
       

    }
    func deletRow() {
        TableView.beginUpdates()
         let index = IndexPath(row: Clients.count - 1  , section: 0)
        self.TableView.deleteRows(at: [index], with: .automatic)
//        numberOfRow -= 1
//        print(numberOfRow)
        TableView.endUpdates()
         view.endEditing(true)
        
    }
   func OpenMap(Lat: String, Long: String) {
        LLat = Lat
        LLong = Long
        let vc = storyboard?.instantiateViewController(withIdentifier: "MapVIew")
        vc?.modalPresentationStyle = .fullScreen
        present(vc!, animated: true, completion: nil)
    }
    private func setloadingScreen() {
        
        self.spinner.style = UIActivityIndicatorView.Style.gray
        spinner.center = self.TableView.center
        self.spinner.startAnimating()
        loadingView.addSubview(spinner)
        self.TableView.addSubview(loadingView)
    }
    private func removeloadingScreen() {
        spinner.isHidden = true
        self.spinner.stopAnimating()
        
        
    }

    
    
}

