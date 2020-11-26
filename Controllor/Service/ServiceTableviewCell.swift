//
//  ServiceTableviewCell.swift
//  VisaMan
//
//  Created by mac on 10/11/20.
//

import UIKit

class ServiceTableviewCell: UITableViewCell,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var btnShowCategory : UIButton?
    @IBOutlet weak var imgCategory : UIImageView?
    @IBOutlet weak var viewImage : UIView?
    @IBOutlet weak var tbHeightConstraint : NSLayoutConstraint?
    @IBOutlet weak var tbShowDescription : UITableView?
    @IBOutlet weak var lblShowDiscription : UILabel?
    @IBOutlet weak var lblShowBullet : UILabel?
    @IBOutlet weak var btnBookVisamanService : UIButton?
    
    @IBOutlet weak var btnBookVisamanLiveChatVC : UIButton?
    
    @IBOutlet weak var viewShowPrice : UIView?
    @IBOutlet weak var viewShowCart : UIView?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        //self.viewShowPrice?.addshadow(top: true, left: true, bottom: true, right: true, shadowRadius: 3.0, viewHeight:CGFloat((self.viewShowPrice?.frame.size.height)!) , viewWidth: CGFloat((self.viewShowPrice?.frame.size.width)!))
        //self.viewShowCart?.addshadow(top: true, left: true, bottom: true, right: true, shadowRadius: 3.0, viewHeight:CGFloat((self.viewShowCart?.frame.size.height)!) , viewWidth: CGFloat((self.viewShowCart?.frame.size.width)!))
        //self.btnBookVisamanService?.addshadow(top: true, left: true, bottom: true, right: true, shadowRadius: (self.btnBookVisamanService?.frame.size.height)!/2, viewHeight:CGFloat((self.btnBookVisamanService?.frame.size.height)!) , viewWidth: CGFloat((self.btnBookVisamanService?.frame.size.width)!))
        // Configure the view for the selected state
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceTableviewCell",for: indexPath) as? ServiceTableviewCell
        cell?.lblShowBullet?.text = "\u{2022}"
        cell?.lblShowBullet?.textColor = UIColor.darkGray
        cell?.lblShowBullet?.backgroundColor = UIColor.clear
        
        return cell!
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 21
    }
    
}
