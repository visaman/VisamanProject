//
//  FAQVC.swift
//  VisaMan
//
//  Created by mac on 12/11/20.
//

import UIKit

class FAQVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.title = "FAQ"
    }
 

}
