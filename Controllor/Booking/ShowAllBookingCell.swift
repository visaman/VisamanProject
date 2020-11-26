//
//  ShowAllBookingCell.swift
//  VisaMan
//
//  Created by mac on 10/11/20.
//

import UIKit
import Cosmos
class ShowAllBookingCell: UITableViewCell {

    @IBOutlet weak var lblVisaTitle : UILabel?
    @IBOutlet weak var lblVisaDestination : UILabel?
    @IBOutlet weak var lblShowDateTime : UILabel?
    @IBOutlet weak var viewMain : UIView?
    @IBOutlet weak var viewTotalRating : UIView?
    @IBOutlet weak var btnServiceDone : UIButton?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func layoutSubviews()
    {
        super.layoutSubviews()
        //self.viewMain?.addshadow(top: false, left: false, bottom: true, right: true, shadowRadius: 3.0, viewHeight:CGFloat((self.viewMain?.frame.size.height)!) , viewWidth: CGFloat((self.viewMain?.frame.size.width)!))
        // this does the trick
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       //self.viewMain?.addshadow(top: true, left: true, bottom: true, right: true, shadowRadius: 3.0, viewHeight:CGFloat((self.viewMain?.frame.size.height)!) , viewWidth: CGFloat((self.viewMain?.frame.size.width)!))
    }

}
