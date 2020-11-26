//
//  BookVisaManService.swift
//  VisaMan
//
//  Created by mac on 17/11/20.
//

import UIKit
import Razorpay
import SafariServices
class BookVisaManService: UIViewController,RazorpayPaymentCompletionProtocolWithData {
   
    

    @IBOutlet weak var viewPayment : UIView?
    var razorpayObj : RazorpayCheckout? = nil
  
    
    let razorpayKey = "rzp_test_1DP5mmOlF5G5ag" // Sign up for a Razorpay Account(https://dashboard.razorpay.com/#/access/signin) and generate the API Keys(https://razorpay.com/docs/payment-gateway/dashboard-guide/settings/#api-keys/) from the Razorpay Dashboard.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Book VISAMAN Service"
        self.navigationController?.setNavigationBarHidden(false, animated: true)

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews()
    {
            super.viewDidLayoutSubviews()
        self.addBackButton()
            print("viewDidLayoutSubviews")
        viewPayment?.addshadow(top: false, left: false, bottom: true, right: true, shadowRadius: 12.0, viewHeight:CGFloat((viewPayment?.frame.size.height)!) , viewWidth: CGFloat((viewPayment?.frame.size.width)!))
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
    
    func onPaymentError(_ code: Int32, description str: String, andData response: [AnyHashable : Any]?) {
        self.presentAlert(withTitle: "Alert", message: str)
        tabBarController?.selectedIndex = 4
        self.navigationController?.popViewController(animated: true)
    }
    
    func onPaymentSuccess(_ payment_id: String, andData response: [AnyHashable : Any]?) {
        print("success: ", payment_id)
        print("success: ", payment_id)
        self.presentAlert(withTitle: "Success", message: "Payment Succeeded")
        tabBarController?.selectedIndex = 4
        self.navigationController?.popViewController(animated: true)
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



