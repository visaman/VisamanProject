//
//  WhatsAppCallVC.swift
//  VisaMan
//
//  Created by mac on 09/11/20.
//

import UIKit

class WhatsAppCallVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)

        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.navigationItem.title  = "What's App Call"
    }

}
