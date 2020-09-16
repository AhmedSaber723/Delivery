
import UIKit
@available(iOS 13.0, *)


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
 
    
    let canvas = Canvas()
    @IBOutlet weak var TextView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      canvas.backgroundColor = .white
        canvas.cornerRadius = 17
        canvas.layer.maskedCorners = [ .layerMinXMaxYCorner, .layerMinXMinYCorner , .layerMaxXMinYCorner , .layerMaxXMaxYCorner]
       TextView.addSubview(canvas)
        canvas.frame.size = TextView.frame.size
        canvas.cornerRadius = TextView.cornerRadius
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 5
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "Cells") as! Cells
         tableView.rowHeight = 38
         return cell
     }
   

    @IBAction func BuSave(_ sender: Any) {
    
        let alert = UIAlertController(title: nil, message:"Signtrue Massage".localized, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel Signtrue".localized, style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Save Signtrue".localized, style: .default, handler: { (nil) in
            
            let x = self.canvas.screenshot()
                               Image = x!
            
                  UIImageWriteToSavedPhotosAlbum(Image, nil, nil, nil)
                  
              
        }))
        present(alert, animated: true, completion: nil)
        
        
    }
    
    @IBAction func BuDelet(_ sender: Any) {
       
       canvas.clear()
      
    }
    
    
    
    @IBAction func BuBack(_ sender: Any) {
          let vc = storyboard?.instantiateViewController(withIdentifier: "NavHome")
            vc?.modalPresentationStyle = .fullScreen
            present(vc!, animated: true, completion: nil)
        
    }
    
    
}

