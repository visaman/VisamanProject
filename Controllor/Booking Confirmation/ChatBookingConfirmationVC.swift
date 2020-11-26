//
//  ChatBookingConfirmationVC.swift
//  VisaMan
//
//  Created by mac on 18/11/20.
//

import UIKit

class ChatBookingConfirmationVC: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var clShowAllChatDate : UICollectionView?
    @IBOutlet weak var clShowAllChatTimings : UICollectionView?
    @IBOutlet weak var viewPayment : UIView?
    @IBOutlet weak var lblKnowYourConsultant : UILabel?
    var selectedDate : Int = 2
    var selectedTime : Int = 3
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Booking Confirmation"
        self.addBackButton()
        let text = "Know about your consultant."
        self.lblKnowYourConsultant?.text = text
        self.lblKnowYourConsultant?.textColor =  UIColor.black
        let underlineAttriString = NSMutableAttributedString(string: text)
        let range1 = (text as NSString).range(of: "Know about your consultant.")
                underlineAttriString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range1)
        //underlineAttriString.addAttribute(NSAttributedString.Key.font, value: UIFont.init(name: "gothicb.ttf", size: 14)!, range: range1)
        underlineAttriString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(red: 0.0/255.0, green: 149.0/255.0, blue: 218.0/255.0, alpha: 1.0), range: range1)
        self.lblKnowYourConsultant?.attributedText = underlineAttriString
        self.lblKnowYourConsultant?.isUserInteractionEnabled = true
       
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(tappedOnLabel(_ :)))
        tapgesture.numberOfTapsRequired = 1
        self.lblKnowYourConsultant?.addGestureRecognizer(tapgesture)
    }
    @objc func tappedOnLabel(_ gesture: UITapGestureRecognizer)
    {
        if gesture.didTapAttributedTextInLabel(label: self.lblKnowYourConsultant!, targetText: "Know about your consultant.")
        {
           print("Know about your consultant.")
        }
        else
        {
           print("Tapped none")
        }
    }
    //Mark:-> Collectionview Datasource and Delegate methods
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cellIdentifier: String = "SeviceCollectionViewCell"
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? SeviceCollectionViewCell)!
        if collectionView == self.clShowAllChatDate
        {
           let cellIdentifier: String = "SeviceCollectionViewCell"
           let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? SeviceCollectionViewCell)!
            cell.viewMain?.layer.cornerRadius = 12
            cell.viewMain?.layer.borderWidth = 1
            cell.viewMain?.layer.borderColor =  UIColor.darkGray.cgColor
            cell.lblShowDate?.textColor = UIColor.black
            cell.lblShowDay?.textColor = UIColor.black
            if self.selectedDate == indexPath.row
            {
                cell.viewMain?.backgroundColor = UIColor(red: 239/255.0, green: 122/255.0, blue: 35/255.0, alpha: 1)
                cell.lblShowDate?.textColor = UIColor.white
                cell.lblShowDay?.textColor = UIColor.white
                cell.viewMain?.layer.borderColor =  UIColor.clear.cgColor
            }
            else
            {
                cell.viewMain?.backgroundColor = UIColor.clear
            }
            
            
           return cell
        }
        else
        {
            let cellIdentifier: String = "SeviceCollectionViewCell"
            let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? SeviceCollectionViewCell)!
            cell.layer.cornerRadius = 12
            cell.layer.borderWidth = 1
            cell.layer.borderColor =  UIColor.darkGray.cgColor
            cell.lblShowTime?.textColor = UIColor.black
            if self.selectedTime == indexPath.row
            {
                cell.backgroundColor = UIColor(red: 239/255.0, green: 122/255.0, blue: 35/255.0, alpha: 1)
                cell.layer.borderColor =  UIColor.white.cgColor
                cell.lblShowTime?.textColor = UIColor.white
            }
            else
            {
                cell.backgroundColor = UIColor.clear
            }
            return cell
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if collectionView == self.clShowAllChatDate
        {
            return 8
        }
        else
        {
            return 8
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        if collectionView == clShowAllChatDate
        {
            self.selectedDate = indexPath.row
            self.clShowAllChatDate?.reloadData()
        }
        else if collectionView == clShowAllChatTimings
        {
            self.selectedTime = indexPath.row
            self.clShowAllChatTimings?.reloadData()
        }
    }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
            if collectionView == clShowAllChatDate
            {
                return CGSize(width:(((self.clShowAllChatDate?.frame.size.width)! - 40))/5,height: (self.clShowAllChatDate?.frame.size.height)!)
            }
            else if collectionView == clShowAllChatTimings
            {
                return CGSize(width:(((self.clShowAllChatTimings?.frame.size.width)! - 30))/4,height: (self.clShowAllChatTimings?.frame.size.height)!)
            }
              return CGSize(width:0,height:0)
        }

   
}
