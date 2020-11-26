//
//  BookVisamanLiveChatVC.swift
//  VisaMan
//
//  Created by mac on 17/11/20.
//

import UIKit
import Razorpay
import SafariServices
class BookVisamanLiveChatVC: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,RazorpayPaymentCompletionProtocol {

    @IBOutlet weak var clShowAllChatDate : UICollectionView?
    @IBOutlet weak var clShowAllChatTimings : UICollectionView?
    @IBOutlet weak var viewPayment : UIView?
    
    @IBOutlet weak var lblVisamanChatTotalPayment : UILabel?
    @IBOutlet weak var lblRewardPointsCredit : UILabel?
    @IBOutlet weak var lblRemainingTotal : UILabel?
    @IBOutlet weak var lblPayNowTotal : UILabel?
    
    var selectedDate : Int = 2
    var selectedTime : Int = 3
    
    var razorpayObj : RazorpayCheckout? = nil
    //var merchantDetails : MerchantsDetails = MerchantsDetails.getDefaultData()
    
    let razorpayKey = "rzp_test_v5gJKsyJ0RZlVN" // Sign up for a Razorpay 
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.addBackButton()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
       
        self.title = "Book VISAMAN Live Chat"
    }
    override func viewDidLayoutSubviews()
    {
            super.viewDidLayoutSubviews()
            print("viewDidLayoutSubviews")
        self.addBackButton()
        viewPayment?.addshadow(top: false, left: false, bottom: true, right: true, shadowRadius: 12.0, viewHeight:CGFloat((viewPayment?.frame.size.height)!) , viewWidth: CGFloat((viewPayment?.frame.size.width)!))
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
    
    
    @IBAction func tapToPayNow(sender:UIButton)
    {
        self.openRazorpayCheckout()
    }
    
    private func openRazorpayCheckout() {
        // 1. Initialize razorpay object with provided key. Also depending on your requirement you can assign delegate to self. It can be one of the protocol from RazorpayPaymentCompletionProtocolWithData, RazorpayPaymentCompletionProtocol.
        razorpayObj = RazorpayCheckout.initWithKey(razorpayKey, andDelegate: self)
        let options: [AnyHashable:Any] = [
            "prefill": [
                "contact": "9990158536",
                "email": "ravikanttyagi85@gmail.com.com"
            ],
            "image": "",
            "amount" : 100,
            "name": "Ravikant Tyagi",
            "theme": [
                "color":""
            ]
            // follow link for more options - https://razorpay.com/docs/payment-gateway/web-integration/standard/checkout-form/
        ]
        if let rzp = self.razorpayObj {
            rzp.open(options)
        } else {
            print("Unable to initialize")
        }
    }
    
    
    func onPaymentError(_ code: Int32, description str: String) {
        print("error: ", code, str)
        
        self.presentAlert(withTitle: "Alert", message: str)
        tabBarController?.selectedIndex = 3
        self.navigationController?.popViewController(animated: true)
    }
    
    func onPaymentSuccess(_ payment_id: String)
    {
        print("success: ", payment_id)
        self.presentAlert(withTitle: "Success", message: "Payment Succeeded")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChatBookingConfirmationVC") as! ChatBookingConfirmationVC
        self.navigationController?.pushViewController(vc, animated: true)
        
//        tabBarController?.selectedIndex = 3
//        self.navigationController?.popViewController(animated: true)
    }
    
    
    func presentAlert(withTitle title: String?, message : String?) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Okay", style: .default)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
}



