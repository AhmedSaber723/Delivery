
import UIKit
import AVFoundation
@available(iOS 13.0, *)
class FullScreen: UIViewController,AVCaptureMetadataOutputObjectsDelegate {

    @IBOutlet weak var QRView: UIView!
    @IBOutlet weak var BuFlash: UIButton!
    
    @IBOutlet weak var ImageQR: UIImageView!
    @IBOutlet weak var BuFull: UIButton!
    var video = AVCaptureVideoPreviewLayer()
    let session = AVCaptureSession()
    var  on = true
    override func viewDidLoad() {
        super.viewDidLoad()

        BuFull.setImage(#imageLiteral(resourceName: "Full"), for: .normal)
        BuFlash.setImage(#imageLiteral(resourceName: "FlashOff"), for: .normal)
       scaner()
    }
    

    
    @IBAction func BuFlashLight(_ sender: Any) {
        
        if on == true {
                     toggleTorch(on: on)
                     on = false
                     BuFlash.setImage(#imageLiteral(resourceName: "FlashOn"), for: .normal)
                 }else {
                    toggleTorch(on: on)
                     on = true
                    BuFlash.setImage(#imageLiteral(resourceName: "FlashOff"), for: .normal)
                 }
            
        
    }
   
    @IBAction func BuFullScreen(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "PickerUp")
        vc?.modalPresentationStyle = .fullScreen
        present(vc!, animated: true, completion: nil)
        if on == false {
                 toggleTorch(on: on)
                 on = true
                 
             }
    }
    func scaner () {
        
        guard let CaptureDevice = AVCaptureDevice.default(for: .video) else {return}
        
        do {
            let input = try AVCaptureDeviceInput(device: CaptureDevice)
            session.addInput(input)
        }catch {
            
            print("Error")
            
        }
        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        output.metadataObjectTypes = [.ean8, .ean13, .pdf417,.qr]
        video = AVCaptureVideoPreviewLayer(session: session)
        video.frame = QRView.layer.bounds
        QRView.layer.addSublayer(video)
        self.QRView.bringSubviewToFront(ImageQR)
        self.QRView.bringSubviewToFront(BuFlash)
        self.QRView.bringSubviewToFront(BuFull)
        
        session.startRunning()
        
    }
     func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects != nil && metadataObjects.count != 0 {
            
            if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject {
                
                let alert = UIAlertController(title: "Items", message: object.stringValue, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "retry",style: .default, handler: nil))
                alert.addAction(UIAlertAction(title: "Done", style: .default, handler: {(nil) in
                    
                    UIPasteboard.general.string = object.stringValue }))
                present(alert, animated: true, completion: nil)
            }
        }
    }
    func toggleTorch(on: Bool) {
           
           guard let device = AVCaptureDevice.default(for: .video) else { return  }

           if device.hasTorch {
               do {
                   try device.lockForConfiguration()

                   if on == true {
                       device.torchMode = .on
                       
                     
                   } else {
                       device.torchMode = .off
                      
                      
                   }

                   device.unlockForConfiguration()
               } catch {
                   print("Torch could not be used")
               }
           } else {
               print("Torch is not available")
           }
       }
}
