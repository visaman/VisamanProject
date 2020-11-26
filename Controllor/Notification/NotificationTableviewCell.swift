//
//  NotificationTableviewCell.swift
//  VisaMan
//
//  Created by mac on 19/11/20.
//

import UIKit

class NotificationTableviewCell: UITableViewCell {

    @IBOutlet weak var imgShowVisamanBanner : UIImageView?
    @IBOutlet weak var  lblNotificationTitle: UILabel?
    @IBOutlet weak var lblNotificationDescription : UILabel?
    @IBOutlet weak var lblNotificationDateTime : UILabel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
