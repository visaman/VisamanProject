//
//  DisplayNotificationVC.swift
//  VisaMan
//
//  Created by mac on 19/11/20.
//

import UIKit

class DisplayNotificationVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var tbDisplayAllNotification : UITableView?
    
    @IBOutlet weak var imgShowVisamanBanner : UIImageView?
    @IBOutlet weak var  lblNotificationTitle: UILabel?
    @IBOutlet weak var lblNotificationDescription : UILabel?
    @IBOutlet weak var lblNotificationDateTime : UILabel?
    
    var arrNotifictionDiscription = ["Sometimes, you would want to set the root view controller programmatically without using a storyboard in swift.","Open up SceneDelegate.swift file from the Project Navigator and replace the existing code to the willConnectTo() method","If everything goes well, you should be able to see the background color similar to the screenshot above when you run the app.","There you have it and now the app is running with a root view controller that is set programmatically without a storyboard."]
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tbDisplayAllNotification?.rowHeight = UITableView.automaticDimension
        self.tbDisplayAllNotification?.estimatedRowHeight = 100
        tbDisplayAllNotification?.register(UINib(nibName: "NotificationTableviewCell", bundle: nil), forCellReuseIdentifier: "NotificationTableviewCell")
        self.tbDisplayAllNotification?.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.title = "Notifications"
    }

    //Mark:-> Tableview Datasource and Delegate methods
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    // Mark:-> number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrNotifictionDiscription.count
    }
    // Mark:-> create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableviewCell",for: indexPath) as! NotificationTableviewCell
        print(self.arrNotifictionDiscription[indexPath.row])
        cell.lblNotificationDescription?.text = self.arrNotifictionDiscription[indexPath.row]
        cell.imgShowVisamanBanner?.layer.cornerRadius = (cell.imgShowVisamanBanner?.frame.size.height)!/2
        cell.imgShowVisamanBanner?.clipsToBounds = true
        return cell
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("You tapped cell number \(indexPath.row).")
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableView.automaticDimension
    }


}
