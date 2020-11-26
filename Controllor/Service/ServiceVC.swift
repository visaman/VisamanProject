//
//  ServiceVC.swift
//  VisaMan
//
//  Created by mac on 09/11/20.
//

import UIKit

class ServiceVC: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,SeviceCollectionViewProtocol {
    
    

    @IBOutlet weak var clShowAllServices : UICollectionView?
   
    @IBOutlet weak var pageControl: UIPageControl!
    let collectionMargin = CGFloat(45)
    let itemSpacing = CGFloat(20)
    let itemHeight = CGFloat(322)
    var itemWidth = CGFloat(0)
    var currentItem = 0
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        clShowAllServices?.reloadData()
        
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)

        
        
        let itemHeight = CGFloat(((self.clShowAllServices?.frame.size.height)! - 30))
        self.clShowAllServices?.automaticallyAdjustsScrollIndicatorInsets = true
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()

            itemWidth =  UIScreen.main.bounds.width - collectionMargin * 2.0
            
        layout.sectionInset = UIEdgeInsets(top: 15, left: 0, bottom: 40.0, right: 0)
            layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
            layout.headerReferenceSize = CGSize(width: collectionMargin, height: 0)
            layout.footerReferenceSize = CGSize(width: collectionMargin, height: 0)
            layout.minimumLineSpacing = itemSpacing
            layout.scrollDirection = .horizontal

          self.clShowAllServices?.collectionViewLayout = layout
          self.clShowAllServices?.decelerationRate = UIScrollView.DecelerationRate.normal
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let pageWidth = Float(itemWidth + itemSpacing)
        let targetXContentOffset = Float(targetContentOffset.pointee.x)
        let contentWidth = Float(clShowAllServices!.contentSize.width  )
        var newPage = Float(self.pageControl.currentPage)
        
        if velocity.x == 0 {
            newPage = floor( (targetXContentOffset - Float(pageWidth) / 2) / Float(pageWidth)) + 1.0
        } else {
            newPage = Float(velocity.x > 0 ? self.pageControl.currentPage + 1 : self.pageControl.currentPage - 1)
            if newPage < 0 {
                newPage = 0
            }
            if (newPage > contentWidth / pageWidth) {
                newPage = ceil(contentWidth / pageWidth) - 1.0
            }
        }
        self.pageControl.currentPage = Int(newPage)
        let point = CGPoint (x: CGFloat(newPage * pageWidth), y: targetContentOffset.pointee.y)
        targetContentOffset.pointee = point
    }
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.tabBarController?.title = "Service"
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
//
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 237.0/255.0, green: 120.0/255.0, blue: 65.0/255.0, alpha: 1.0)], for: .selected)
    }
    @IBAction func tapToBack(sender:UIButton)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "TabBarViewController")
        //mainTabBarController.modalPresentationStyle = .fullScreen
                
        self.present(mainTabBarController, animated: true, completion: nil)
    }

    @IBAction func tapToBookTheService(sender:UIButton)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "BookAServiceVC") as! BookAServiceVC
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    //Mark:-> Collectionview Datasource and Delegate methods
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cellIdentifier: String = "SeviceCollectionViewCell"
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? SeviceCollectionViewCell)!
        cell.delegate = self
        
        
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.layer.borderWidth = 1.0

        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true

        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.cornerRadius = 8.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
        
       
        return cell
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView)
//    {
//        scrollView.contentOffset.x = -(self.clShowAllServices?.frame.size.width)!-20
//    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        
    }
    
    func navigateToBookingServiceController()
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "BookVisaManService") as! BookVisaManService
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
