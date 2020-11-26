//
//  BookAServiceVC.swift
//  VisaMan
//
//  Created by mac on 09/11/20.
//

import UIKit

class BookAServiceVC: UIViewController {

   
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.tabBarController?.title = "Service"
    }
    

    @IBAction func tapToBack(sender:UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
   

}
