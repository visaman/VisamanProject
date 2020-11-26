//
//  SeviceCollectionViewCell.swift
//  VisaMan
//
//  Created by mac on 10/11/20.
//

import UIKit
protocol SeviceCollectionViewProtocol : class
{
    func navigateToBookingServiceController()
}
class SeviceCollectionViewCell: UICollectionViewCell,UITableViewDataSource,UITableViewDelegate
{
    @IBOutlet weak var tbShowAllServices : UITableView?
    @IBOutlet weak var viewMain : UIView?
    @IBOutlet weak var lblShowDay : UILabel?
    @IBOutlet weak var lblShowDate : UILabel?
    @IBOutlet weak var lblShowTime : UILabel?
    weak var delegate:SeviceCollectionViewProtocol?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
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
        
        //let btnHeight = (cell?.btnBookVisamanService?.frame.size.height)!/2
        //cell?.btnBookVisamanService?.addButtonShadow(top: true, left: true, bottom: true, right: true, shadowRadius: 16, viewHeight:CGFloat((cell?.btnBookVisamanService?.frame.size.height)!) , viewWidth: CGFloat((cell?.btnBookVisamanService?.frame.size.width)!))
        cell?.contentView.layoutIfNeeded()
        
        cell?.btnBookVisamanService?.addTarget(self,action:#selector(tapToRedirectOnLiveChatPayment(sender:)), for: .touchUpInside)
        cell?.btnBookVisamanService?.tag = indexPath.row
        
        
        return cell!
    }
    
    /// Mark:->  View User Details
    @objc  func tapToRedirectOnLiveChatPayment(sender:UIButton)
    {
        delegate?.navigateToBookingServiceController()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return self.frame.size.height
    }
}
