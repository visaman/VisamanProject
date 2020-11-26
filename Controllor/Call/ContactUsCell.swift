//
//  ContactUsCell.swift
//  VisaMan
//
//  Created by mac on 23/11/20.
//

import UIKit

class ContactUsCell: UITableViewCell {

    @IBOutlet weak var viewMain : UIView?
    @IBOutlet weak var imgContactUsImage : UIImageView?
    @IBOutlet weak var lblContactUsTitle : UILabel?
    @IBOutlet weak var lblContactUsRightTitle : UILabel?


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
