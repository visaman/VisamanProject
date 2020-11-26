//
//  BookingVC.swift
//  VisaMan
//
//  Created by mac on 09/11/20.
//

import UIKit

class BookingVC: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tbShowAllBooking : UITableView?
    @IBOutlet weak var tbShowVendorAllBooking : UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        tbShowAllBooking?.isHidden = true
       
    }
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.title = "My Bookings"
    }
    
        //Mark:-> Tableview Datasource and Delegate methods
        func numberOfSections(in tableView: UITableView) -> Int
        {
            
            return 1
        }
        // Mark:-> number of rows in table view
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        {
            if tableView == tbShowAllBooking
            {
               return 20
            }
            else  if tableView == tbShowVendorAllBooking
            {
                return 20
            }
            return 0
        }
        // Mark:-> create a cell for each table view row
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ShowAllBookingCell",for: indexPath) as! ShowAllBookingCell
//            cell.viewMain?.layer.borderWidth = 1
//            cell.viewMain?.layer.borderColor = UIColor.lightGray.cgColor
//            cell.viewMain?.layer.cornerRadius = 5
//            cell.viewMain?.clipsToBounds = true
            if tableView == tbShowAllBooking
            {
               cell.viewMain?.addshadow(top: true, left: true, bottom: true, right: true, shadowRadius: 3.0, viewHeight:CGFloat((cell.viewMain?.frame.size.height)!) , viewWidth: CGFloat((cell.viewMain?.frame.size.width)!))
               cell.contentView.layoutIfNeeded()
            }
            else  if tableView == tbShowVendorAllBooking
            {
//                cell.viewMain?.layer.cornerRadius = 10
//                cell.viewMain?.clipsToBounds = true
                
                cell.btnServiceDone?.layer.cornerRadius = (cell.btnServiceDone?.frame.size.height)!/2
                cell.btnServiceDone?.clipsToBounds = true
            }
            return cell
            
        }
        // Mark:-> method to run when table view cell is tapped
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
        {
            print("You tapped cell number \(indexPath.row).")
            
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
        {
            if tableView == tbShowAllBooking
            {
                return 79
            }
            else  if tableView == tbShowVendorAllBooking
            {
                return 111
            }
            return 0
        }
    

}
