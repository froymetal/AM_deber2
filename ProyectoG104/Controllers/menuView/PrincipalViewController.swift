//
//  ViewController.swift
//  ProyectoG104
//
//  Created by fredyM1 on 27/07/22.
//

import UIKit

class PrincipalViewController: UIViewController {

    @IBOutlet weak var logoImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        logoImg.alpha = 0
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
       animandoLogo()
       
    }
    func animandoLogo(){
        UIView.animate(withDuration: 1.0, delay: 0) {
            self.logoImg.alpha = 0.9
            self.logoImg.frame = CGRect(x: 80, y: 320, width: 240, height: 128)
        }
        
    }

}

