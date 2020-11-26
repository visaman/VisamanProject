//
//  LiveChatVC.swift
//  VisaMan
//
//  Created by mac on 09/11/20.
//

import UIKit

class LiveChatVC: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tbLiveChatVC : UITableView?
    @IBOutlet weak var viewOuter : UIView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.title  = "Visaman Chat"
       
    }
    
    override func viewDidLayoutSubviews()
    {
            super.viewDidLayoutSubviews()
            print("viewDidLayoutSubviews")
        
//        self.tbLiveChatVC?.layer.cornerRadius = 10
//        self.tbLiveChatVC?.layer.borderWidth = 1.0
//
//        self.tbLiveChatVC?.layer.borderColor = UIColor.clear.cgColor
//        self.tbLiveChatVC?.layer.masksToBounds = true
       
        self.viewOuter?.backgroundColor = UIColor.clear
        self.viewOuter?.addshadow(top: true, left: true, bottom: true, right: true, shadowRadius: 7, viewHeight:CGFloat((self.viewOuter?.frame.size.height)!) , viewWidth: CGFloat(( self.viewOuter?.frame.size.width)!))
     
        self.tbLiveChatVC?.layer.cornerRadius = 10
        self.tbLiveChatVC?.layer.masksToBounds = true
        
       
        
    }

    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.tabBarController?.title = "Live Chat"
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceTableviewCell",for: indexPath) as? ServiceTableviewCell
        cell?.btnShowCategory?.layer.cornerRadius = 6
        cell?.btnShowCategory?.clipsToBounds = true
        
        cell?.btnBookVisamanService?.layer.cornerRadius = (cell?.btnBookVisamanService?.frame.size.height)!/2
        cell?.btnBookVisamanService?.clipsToBounds = true
        
        cell?.viewShowCart?.layer.cornerRadius = 10
        cell?.viewShowCart?.clipsToBounds = true
        
        cell?.btnShowCategory?.layer.cornerRadius = 10
        cell?.btnShowCategory?.clipsToBounds = true
        
        cell?.viewShowPrice?.layer.cornerRadius = 8
        cell?.viewShowPrice?.clipsToBounds = true
        
       
       
        cell?.btnShowCategory?.layer.cornerRadius = 2
        cell?.btnShowCategory?.layer.borderColor = UIColor(red: 239/255.0, green: 122/255.0, blue: 35/255.0, alpha: 1).cgColor
        cell?.tbHeightConstraint?.constant = 63
        cell?.layoutIfNeeded()
        cell?.viewShowPrice?.addshadow(top: true, left: true, bottom: true, right: true, shadowRadius: 3.0, viewHeight:CGFloat((cell?.viewShowPrice?.frame.size.height)!) , viewWidth: CGFloat((cell?.viewShowPrice?.frame.size.width)!))
        cell?.viewShowCart?.addshadow(top: true, left: true, bottom: true, right: true, shadowRadius: 3.0, viewHeight:CGFloat((cell?.viewShowCart?.frame.size.height)!) , viewWidth: CGFloat((cell?.viewShowCart?.frame.size.width)!))
        
        
        cell?.contentView.layoutIfNeeded()
        
       
        cell?.btnBookVisamanLiveChatVC?.addTarget(self,action:#selector(tapToRedirectOnLiveChatPayment(sender:)), for: .touchUpInside)
        cell?.btnBookVisamanLiveChatVC?.tag = indexPath.row
        
        
        return cell!
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return (self.tbLiveChatVC?.frame.size.height)!
    }
    
    /// Mark:->  View User Details
    @objc  func tapToRedirectOnLiveChatPayment(sender:UIButton)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "BookVisamanLiveChatVC") as! BookVisamanLiveChatVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
