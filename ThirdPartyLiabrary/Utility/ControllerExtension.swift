//
//  ControllerExtension.swift
//  VisaMan
//
//  Created by mac on 20/11/20.
//

import UIKit

class ControllerExtension: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   

}

extension UIView {
func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 15, scale: Bool = true) {
    layer.masksToBounds = false
    layer.shadowColor = color.cgColor
    layer.shadowOpacity = opacity
    layer.shadowOffset = offSet
    layer.shadowRadius = radius
    layer.cornerRadius = radius


    layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    layer.shouldRasterize = true
    layer.rasterizationScale = scale ? UIScreen.main.scale : 1
  }
}


extension UIView
{
    func addshadow(top: Bool,
                   left: Bool,
                   bottom: Bool,
                   right: Bool,
                   shadowRadius: CGFloat = 2.0,viewHeight:CGFloat,viewWidth:CGFloat) {

        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = 1.0
        self.layer.shadowColor = UIColor.lightGray.cgColor

        let path = UIBezierPath()
        var x: CGFloat = 0
        var y: CGFloat = 0
        var viewWidth = (viewWidth) //+ self.frame.height + self.frame.height/3
        var viewHeight = (viewHeight)

        // here x, y, viewWidth, and viewHeight can be changed in
        // order to play around with the shadow paths.
        if (!top) {
            y+=(shadowRadius+1)
        }
        if (!bottom) {
            viewHeight-=(shadowRadius+1)
        }
        if (!left) {
            x+=(shadowRadius+1)
        }
        if (!right) {
            viewWidth-=(shadowRadius+1)
        }
        // selecting top most point
        path.move(to: CGPoint(x: x, y: y))
        // Move to the Bottom Left Corner, this will cover left edges
        /*
         |☐
         */
        path.addLine(to: CGPoint(x: x, y: viewHeight))
        // Move to the Bottom Right Corner, this will cover bottom edge
        /*
         ☐
         -
         */
        path.addLine(to: CGPoint(x: viewWidth, y: viewHeight))
        // Move to the Top Right Corner, this will cover right edge
        /*
         ☐|
         */
        path.addLine(to: CGPoint(x: viewWidth, y: y))
        // Move back to the initial point, this will cover the top edge
        /*
         _
         ☐
         */
        path.close()
        self.layer.shadowPath = path.cgPath
    }
}

extension UIButton
{
    func addButtonShadow(top: Bool,
                   left: Bool,
                   bottom: Bool,
                   right: Bool,
                   shadowRadius: CGFloat = 2.0,viewHeight:CGFloat,viewWidth:CGFloat) {

        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = shadowRadius
        self.layer.cornerRadius = shadowRadius
        self.layer.shadowOpacity = 1.0
        self.layer.shadowColor = UIColor.lightGray.cgColor

        let path = UIBezierPath()
        var x: CGFloat = 0
        var y: CGFloat = 0
        var viewWidth = (viewWidth) //+ self.frame.height + self.frame.height/3
        var viewHeight = (viewHeight)

        // here x, y, viewWidth, and viewHeight can be changed in
        // order to play around with the shadow paths.
        if (!top) {
            y+=(shadowRadius+1)
        }
        if (!bottom) {
            viewHeight-=(shadowRadius+1)
        }
        if (!left) {
            x+=(shadowRadius+1)
        }
        if (!right) {
            viewWidth-=(shadowRadius+1)
        }
        // selecting top most point
        path.move(to: CGPoint(x: x, y: y))
        // Move to the Bottom Left Corner, this will cover left edges
        /*
         |☐
         */
        path.addLine(to: CGPoint(x: x, y: viewHeight))
        // Move to the Bottom Right Corner, this will cover bottom edge
        /*
         ☐
         -
         */
        path.addLine(to: CGPoint(x: viewWidth, y: viewHeight))
        // Move to the Top Right Corner, this will cover right edge
        /*
         ☐|
         */
        path.addLine(to: CGPoint(x: viewWidth, y: y))
        // Move back to the initial point, this will cover the top edge
        /*
         _
         ☐
         */
        path.close()
        self.layer.shadowPath = path.cgPath
    }
}


extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
extension UITapGestureRecognizer {

    
        func didTapAttributedTextInLabel(label: UILabel, targetText: String) -> Bool {
            guard let attributedString = label.attributedText, let lblText = label.text else { return false }
            let targetRange = (lblText as NSString).range(of: targetText)
            //IMPORTANT label correct font for NSTextStorage needed
            let mutableAttribString = NSMutableAttributedString(attributedString: attributedString)
            mutableAttribString.addAttributes(
                [NSAttributedString.Key.font: label.font ?? UIFont.smallSystemFontSize],
                range: NSRange(location: 0, length: attributedString.length)
            )
            // Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
            let layoutManager = NSLayoutManager()
            let textContainer = NSTextContainer(size: CGSize.zero)
            let textStorage = NSTextStorage(attributedString: mutableAttribString)

            // Configure layoutManager and textStorage
            layoutManager.addTextContainer(textContainer)
            textStorage.addLayoutManager(layoutManager)

            // Configure textContainer
            textContainer.lineFragmentPadding = 0.0
            textContainer.lineBreakMode = label.lineBreakMode
            textContainer.maximumNumberOfLines = label.numberOfLines
            let labelSize = label.bounds.size
            textContainer.size = labelSize

            // Find the tapped character location and compare it to the specified range
            let locationOfTouchInLabel = self.location(in: label)
            let textBoundingBox = layoutManager.usedRect(for: textContainer)
            let textContainerOffset = CGPoint(x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x,
                                              y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y);
            let locationOfTouchInTextContainer = CGPoint(x: locationOfTouchInLabel.x - textContainerOffset.x, y:
                locationOfTouchInLabel.y - textContainerOffset.y);
            let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)

            return NSLocationInRange(indexOfCharacter, targetRange)
        }

  

}


extension UIViewController {

    func addBackButton() {
        
        let image = UIImage(named: "registerBack")?.withRenderingMode(.alwaysOriginal)
        
            let backButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(self.backButtonClick)) //
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        self.navigationItem.leftBarButtonItems  = [backButton]

       
       
    }

    @objc func backButtonClick(sender : UIButton) {
        self.navigationController?.popViewController(animated: true);
    }
    
    func addRightbarButtons()
    {
        let faqImage    = UIImage(named: "faq_icon_white")!
        let notificationImage  = UIImage(named: "notification_icon_white")!
        let backImage    = UIImage(named: "faq_icon_white12")
        
        let btnNotification: UIButton = UIButton(type: UIButton.ButtonType.custom)
        btnNotification.setImage(notificationImage, for: UIControl.State.normal)
        btnNotification.addTarget(self, action: #selector(self.notificatiomBtnPressed), for: UIControl.Event.touchUpInside)
        btnNotification.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let barBtnNotofication = UIBarButtonItem(customView: btnNotification)

        let btnFaq: UIButton = UIButton(type: UIButton.ButtonType.custom)
        btnFaq.setImage(faqImage, for: UIControl.State.normal)
        btnFaq.addTarget(self, action: #selector(self.faqBtnPressed), for: UIControl.Event.touchUpInside)
        btnFaq.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let barBtnFaq = UIBarButtonItem(customView: btnFaq)
        
        let btnBackk: UIButton = UIButton(type: UIButton.ButtonType.custom)
        btnBackk.setImage(backImage, for: UIControl.State.normal)
        btnBackk.addTarget(self, action: #selector(self.backButtonClickk), for: UIControl.Event.touchUpInside)
        btnBackk.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let barBackLeft = UIBarButtonItem(customView: btnBackk)

        navigationItem.rightBarButtonItems = [barBtnNotofication, barBtnFaq]
        
        navigationItem.leftBarButtonItem = barBackLeft
    }
    
    @objc func notificatiomBtnPressed(sender : UIButton)
    {
        
    }
    
    @objc func faqBtnPressed(sender : UIButton)
    {
        
    }
    
    @objc func backButtonClickk(sender : UIButton) {
        
    }
    
}
