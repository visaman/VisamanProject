//
//  PhoneCallVC.swift
//  VisaMan
//
//  Created by mac on 09/11/20.
//

import UIKit

class PhoneCallVC: UIViewController,UITableViewDataSource,UITableViewDelegate
{
    @IBOutlet weak var tbContactUs : UITableView?
    @IBOutlet weak var imgHeader : UIImageView?
    var arrContactIcons = ["Dash_call_orange_icon","contact_whats_app_icon","contact_email_icon","contact_sms_icon","contact_feed_back_icon","contact_share_icon"]
    var arrContactTitle = ["Please click the icon to call","Click the whatsapp icon on chat.","Click to Email our visa consultants","Text us your queries for information","Please write your valuable feedback.","Share the app with your loved ones"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)

        let image = UIImage(named: "registerBack")?.withRenderingMode(.alwaysOriginal)
            let backButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(self.backButtonClick)) //
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
       
        self.navigationItem.leftBarButtonItem  = backButton
    }
    @objc override func backButtonClick(sender : UIButton)
    {
        let story = UIStoryboard(name: "Main", bundle:nil)
        let vc = story.instantiateViewController(withIdentifier: "TabBarViewController") as! UITabBarController
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }

    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.title = "Contact Us"
    }

    override func viewWillLayoutSubviews() {
        
    }
    
    //Mark:-> Tableview Datasource and Delegate methods
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    // Mark:-> number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrContactIcons.count
    }
    // Mark:-> create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactUsCell",for: indexPath) as! ContactUsCell
        let iconName = arrContactIcons[indexPath.row]
        cell.imgContactUsImage?.image = UIImage(named: iconName)
        cell.lblContactUsTitle?.text = arrContactTitle[indexPath.row]
        cell.lblContactUsRightTitle?.text = "9990158536"

        return cell
        
    }
//    private func tableView(_ tableView: UITableView, willDisplay cell: ContactUsCell, forRowAt indexPath: IndexPath) {
//        // this will turn on `masksToBounds` just before showing the cell
//        cell.viewMain?.layer.masksToBounds = true
//        cell.viewMain?.backgroundColor = .clear // very important
//        cell.viewMain?.layer.masksToBounds = false
//        cell.viewMain?.layer.shadowOpacity = 0.23
//        cell.viewMain?.layer.shadowRadius = 4
//        cell.viewMain?.layer.shadowOffset = CGSize(width: 0, height: 0)
//        cell.viewMain?.layer.shadowColor = UIColor.black.cgColor
//    }
    // Mark:-> method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("You tapped cell number \(indexPath.row).")
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 74
    }
}

