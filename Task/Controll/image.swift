//
//  image.swift
//  Task
//
//  Created by Saber on 2/13/20.
//  Copyright © 2020 Saber. All rights reserved.
//

import UIKit

var Image:UIImage = UIImage()

class image: UIViewController {

    @IBOutlet weak var myImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

            myImage.image = Image
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
