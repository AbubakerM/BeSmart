//
//  HomeVC.swift
//  Besmart
//
//  Created by mac on 12/7/19.
//  Copyright © 2019 eng.EleyanSaed. All rights reserved.
//

import UIKit
import Kingfisher
import MSPeekCollectionViewDelegateImplementation
import SDWebImage

class HomeVC: UIViewController ,UIScrollViewDelegate{
    
    @IBOutlet weak var collectionA: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionC: UICollectionView!
    @IBOutlet weak var collectionB: UICollectionView!
    @IBOutlet weak var pageControl: QuadPageControl!
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    
    
    var peekImplementation: MSPeekCollectionViewDelegateImplementation!
    var Btitle = ["السينما الدراسية","دليل المدرسين"]
    var Bimg = ["C-1","teacher guid-1"]
    var sliderImage: [SliderOB] = []
    var  countriesArry: [ContriesOB] = []

    
    
    var sliderA: [SliderOB] = []
    var sliderB: [sectionsOB] = []
    var sliderC: [CoursesOB] = []

    var imgTest = [String]()
    let Ctitle = ["المرحلة الثانوية","مهندسين حديثي التخرج","طلبة كليات الهندسة"]
    let Cimg = ["secoundSch","NewGrad","Engineer"]

    
    let imgArry = ["cenma","grad","secoundry","engg","teacherr"]
    private let spacing:CGFloat = 10
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//        GetSlider()
         getCountries()
        pageControl.currentPage = 0
        
        self.pageControl.currentPageIndicatorTintColor = UIColor.white
        self.pageControl.pageIndicatorTintColor = UIColor(hexString:         "D1CFCD")

        
        
        peekImplementation = MSPeekCollectionViewDelegateImplementation()
        peekImplementation.delegate = self
        collectionA.configureForPeekingDelegate()
        collectionA.delegate = peekImplementation
        collectionA.dataSource = self
        GetSlider()
        
        
        
      
        

//        let layout = UICollectionViewFlowLayout()
//                              layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
//                              layout.minimumLineSpacing = spacing
//                              layout.minimumInteritemSpacing = spacing
//                              self.collectionC?.collectionViewLayout = layout
        // Do any additional setup after loading the view.
    }
    
    
//    @IBAction func logOut(_ sender: Any) {
//        UserDefaults.standard.set(false, forKey: "status")
//
//
//        self.delegate.presentLoginViewController(animated: true)
//
//
//    }
//
    
    @IBAction func showAll(_ sender: Any) {
        
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "CorsessVC") as! CorsessVC
               

            let backButton = UIBarButtonItem()

        //            backButton.title = obj.materialName

            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
                    navigationController?.pushViewController(vc, animated: true)
    }
    
    func getCountries(){
           
           DataClient.GetCountries(success: { (dict) in
               print("cities Success")
               print(dict)
               self.countriesArry = dict
        
           }, failure: { (err) in
           })
    }
       
      
    func GetSlider(){
        
        DataClient.GetSlider(success: { (dict) in
            print("cities Success")
            print(dict)

            
            self.sliderA = dict.slider
            self.sliderB = dict.sectionName
            self.sliderC = dict.corsesArry
            self.pageControl.numberOfPages = self.sliderA.count

            
            self.collectionA.reloadData()
            self.collectionB.reloadData()
            self.collectionC.reloadData()
            self.tableView.reloadData()
            
            
        }, failure: { (err) in
        })
        
        
        
        
    }
    
}



extension HomeVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == collectionA {
            return self.sliderA.count
            
        }else if collectionView == collectionB{
            return self.Btitle.count
            
            
        }else{
            
            return countriesArry.count
            
        }
        
        
        
    }
    
 
    
    

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

            let numberOfItemsPerRow:CGFloat = 1
            let spacingBetweenCells:CGFloat = 2

            let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row

            if collectionView == self.collectionC {
//
                let width = (collectionC.bounds.width - totalSpacing)/numberOfItemsPerRow
                return CGSize(width: width, height: width)


            }else if collectionView == self.collectionC{


                return CGSize(width: 100, height: 90)

            }else {

             return CGSize(width: 156, height: 160)
            }
        }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == collectionA {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "slideCell", for: indexPath) as? HomeCollectionCell
            let obj = sliderA[indexPath.row]
            
            cell?.lbl_title.text = obj.title
            cell?.lbl_desc.text = obj.description
            
//
//            cell?.img.setShowActivityIndicator(true)
//            cell?.img.setIndicatorStyle(.gray)

            let url = URL(string: obj.image_link)
            
            cell?.img.sd_setImage(with: url)

            
            
            
            return cell!
            
        }else if collectionView == collectionB{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellB", for: indexPath) as? HomeCollectionCell
            

            cell?.lbl_title.text = Btitle[indexPath.row]
            cell?.img.image  = UIImage(named:Bimg[indexPath.row])
//
            return cell!
            
            
            
        }else{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellC", for: indexPath) as? HomeCollectionCell
             
                       let obj = countriesArry[indexPath.row]
                       cell?.lbl_title.text = obj.countryName
                       let url = URL(string: obj.image)
                       
                       cell?.img.sd_setImage(with: url)
            
            return cell!
            
            
            
            
            
            
            
            
            
            
        }
        
        
        
        
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        if collectionView == collectionB {
            
            
            
            if indexPath.row  == 0 {
                let vc = storyboard?.instantiateViewController(withIdentifier: "VideossVC") as? VideossVC
                           
                           let backItem = UIBarButtonItem()
                              backItem.title = "السينما الدراسية"
                           
                           vc?.isCinema = true
                vc?.title = "السينما الدراسية"
                           
                              navigationItem.backBarButtonItem = backItem
                     navigationController?.pushViewController(vc!, animated: true)

            }else{
                let vc = storyboard?.instantiateViewController(withIdentifier: "PeopleVC") as? PeopleVC
                           
                           let backItem = UIBarButtonItem()
                              backItem.title = "دليل المدرسين"
                           
                           vc?.isTeachers = true
                           vc?.title = "دليل المدرسين"

                              navigationItem.backBarButtonItem = backItem
                     navigationController?.pushViewController(vc!, animated: true)

            }
            
           
            
        }else{
            
            let obj = countriesArry[indexPath.row]
             
                  let vc = storyboard?.instantiateViewController(withIdentifier: "SubCatVC") as? SubCatVC
            
            vc?.iD = obj.id
            vc?.title = obj.countryName

            navigationController?.pushViewController(vc!, animated: true)
            
        }

        
    }
    
    
    
    
    
    
}






class QuadPageControl: UIPageControl {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard !subviews.isEmpty else { return }
        
        let spacing: CGFloat = 3
        
        let width: CGFloat = 15
        
        let height = spacing
        
        var total: CGFloat = 0
        
        for view in subviews {
            view.layer.cornerRadius = 2
            view.frame = CGRect(x: total, y: frame.size.height / 2 - height / 2, width: width, height: height)
            total += width + spacing
        }
        
        total -= spacing
        
        frame.origin.x = frame.origin.x + frame.size.width / 2 - total / 2
        frame.size.width = total
    }
}



import UIKit

final class ContentSizedTableView: UITableView {
    override var contentSize:CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}





extension HomeVC: MSPeekImplementationDelegate {
    func peekImplementation(_ peekImplementation: MSPeekCollectionViewDelegateImplementation, didChangeActiveIndexTo activeIndex: Int) {
        print("Changed active index to \(activeIndex)")
        self.pageControl.currentPage = activeIndex
        
        
    }
    
    func peekImplementation(_ peekImplementation: MSPeekCollectionViewDelegateImplementation, didSelectItemAt indexPath: IndexPath) {
        
        
    }
}


extension HomeVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sliderC.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell") as? CourseTableCell
        
        let obj = sliderC[indexPath.row]

        
        cell?.lbl_title.text = obj.courseName
        cell?.lbl_name.text = obj.teacher_name
        cell?.lbl_course.text = obj.division_name
        cell?.lbl_jop.text = obj.section_name
        cell?.lbl_internt.text = obj.country_name
        cell?.lbl_price.text = "\(obj.price ?? "")$"
        
        let url = URL(string: obj.image_link!)
        
        cell?.img.sd_setImage(with: url)
        
        if obj.is_favoraite == true {
                     
            cell?.likeImg.image = #imageLiteral(resourceName: "heartGreen")
                 }else{
                                cell?.likeImg.image = #imageLiteral(resourceName: "heart")

                 }
        
        
        if obj.is_purchased == true {
            cell?.priceView.isHidden = true
        }else{
            cell?.priceView.isHidden = false

        }
                 
        
        
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let obj = sliderC[indexPath.row]

        
        
        
              let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                                       let vc = storyboard.instantiateViewController(withIdentifier: "VideoDetialVC") as! VideoDetialVC

                                    vc.obj = obj

                                        navigationController?.pushViewController(vc, animated: true)
    }
   
    
    
    
    
    
    
}

