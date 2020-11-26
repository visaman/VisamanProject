//
//  CountryVisaInfoVC.swift
//  VisaMan
//
//  Created by mac on 25/11/20.
//

import UIKit

class CountryVisaInfoVC: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout
{

    @IBOutlet weak var clVisaInfoImage : UICollectionView?
    @IBOutlet weak var clFootorOptions : UICollectionView?
    override func viewDidLoad() {
        super.viewDidLoad()

       
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.title = "USA Visitor Business Owner"
       

        
        let editImage1 = UIImage(named: "registerBack")!
        let searchImag1  = UIImage(named: "Moscow")!

//        let editButton1   = UIBarButtonItem(image: editImage1,  style: .plain, target: self, action: "didTapEditButton:")
//        let searchButton1 = UIBarButtonItem(image: searchImag1,  style: .plain, target: self, action: "didTapSearchButton:")
        
        let searchBtn3: UIButton = UIButton(type: UIButton.ButtonType.custom)
        searchBtn3.setImage(searchImag1, for: UIControl.State.normal)
        searchBtn3.addTarget(self, action: Selector("searchBtnPressed"), for: UIControl.Event.touchUpInside)
        searchBtn3.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let widthConstraint = searchBtn3.widthAnchor.constraint(equalToConstant: 32)
         let heightConstraint = searchBtn3.heightAnchor.constraint(equalToConstant: 32)
         heightConstraint.isActive = true
         widthConstraint.isActive = true
        let searchBarBtn3 = UIBarButtonItem(customView: searchBtn3)

        let searchBtn4: UIButton = UIButton(type: UIButton.ButtonType.custom)
        searchBtn4.setImage(editImage1, for: UIControl.State.normal)
        searchBtn4.addTarget(self, action: Selector("searchBtnPressed"), for: UIControl.Event.touchUpInside)
        searchBtn4.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let searchBarBtn4 = UIBarButtonItem(customView: searchBtn4)

          navigationItem.leftBarButtonItems = [searchBarBtn4,searchBarBtn3]
        //self.addBackButton()
    }
    
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
    }
    
    
    //Mark:-> Collectionview Datasource and Delegate methods
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cellIdentifier: String = "CountryCollectionViewCell"
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? CountryCollectionViewCell)!
        cell.tbVisaInfoImage?.reloadData()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
       
        return CGSize(width:(self.clVisaInfoImage?.frame.size.width)!, height: (self.clVisaInfoImage?.frame.size.height)!)
    
    }
   
}
