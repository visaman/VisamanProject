//
//  CountryCollectionViewCell.swift
//  VisaMan
//
//  Created by mac on 26/11/20.
//

import UIKit

class CountryCollectionViewCell: UICollectionViewCell,UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout
{
    @IBOutlet weak var imgVisaInfoImage : UIImageView?
    @IBOutlet weak var tbVisaInfoImage : UITableView?
    @IBOutlet weak var clVisaInfo : UICollectionView?
    var arrFooterOptions = ["Print this page","Share this Page","Embassy Contact","Visa Fee","From Download"]
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
      {
            return 2
      }

       func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
       {
            if(section == 0)
            {
                return "USA Visitor Bussiness Owner"
            }
            else if(section == 1)
            {
                return "Recommendations"
            }
           return ""
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        {
              if(section == 0)
              {
                return 5
              }
              else if(section == 1)
              {
                return 3
               }
            return 0
        }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryInfoTableViewCell",for: indexPath) as? CountryInfoTableViewCell
        return cell!
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 30
    }
    
    //Mark:-> Collectionview Datasource and Delegate methods
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
   {
       let cellIdentifier: String = "SeviceCollectionViewCell"
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! SeviceCollectionViewCell
       let strOption = self.arrFooterOptions[indexPath.row]
       cell.lblShowDate?.text = strOption
       return cell
   }
   func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
   {

   }
   
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
   {
       return self.arrFooterOptions.count
   }
   
   
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
   {
       let strOptionHeading = self.arrFooterOptions[indexPath.row]
       
      
       let width = textWidth(text:strOptionHeading , font: UIFont.systemFont(ofSize:13))
       return CGSize(width: width + 25 , height: 40.0)
   }
   
   func textWidth(text: String, font: UIFont?) -> CGFloat {
       let attributes = font != nil ? [NSAttributedString.Key.font: font] : [:]
       return text.size(withAttributes: attributes as [NSAttributedString.Key : Any]).width
   }
}
