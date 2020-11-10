//
//  FilterViewController.swift
//  Besmart
//
//  Created by mac on 2/27/20.
//  Copyright © 2020 eng.EleyanSaed. All rights reserved.
//

import UIKit
import DropDown



protocol SendData {
    func sendDataToFirstViewController(countryId: Int,matId: Int,secId: Int,spId: Int,rateId: Int)
    
    func sendDataToFirstViewController2(countryId: Int,matId: Int,secId: Int,spId: Int,teacher: Int)
}
class FilterViewController: UIViewController {

    @IBOutlet weak var countryBtn: UIButton!
    
    @IBOutlet weak var contView: UIView!
    @IBOutlet weak var teachBtn: UIButton!
    @IBOutlet weak var supBtn: UIButton!
    @IBOutlet weak var maBtn: UIButton!
    @IBOutlet weak var spBtn: UIButton!
    
    @IBOutlet weak var lbl_country: UILabel!
    @IBOutlet weak var lbl_Teach: UILabel!
    
    @IBOutlet weak var lbl_sup: UILabel!
    @IBOutlet weak var lbl_mat: UILabel!
    @IBOutlet weak var lbl_sp: UILabel!
    
    @IBOutlet weak var ico: UIImageView!
    
    
    var isTeacher = false
    var delegate: SendData? = nil

    
    let chooseDropDownContry = DropDown()
    let chooseDropDownSpecilize = DropDown()
    let chooseDropDownMateril = DropDown()
    let chooseDropDownTeacher = DropDown()
    let chooseDropDownSub = DropDown()
    
    
    var  countriesArry: [ContriesOB] = []
    var sup: [String] = []
    var supData: [sectionsOB] = []
    
    
    
    var MatData:[divisionsOB]=[]
    var MatStr:[String]=[]
    
    var seleMatId = 0


var selectedSup = 0
      var countriesTitle = [String]()

      var selectCountryID = 0

    
    
    var specData : [specialitiesOB]=[]
    var spec : [String]=[]
    var selectedSpId =  0
    
    
    var TeacherData:[TeacherOB]=[]

    var rateArry = ["1","2","3","4","5"]
    var selectedRate = 0
    var TeacherStr :[String] = []
    
    var selectedTechId = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isTeacher == true {
            
            self.lbl_Teach.text = "اختر التقييم"
            
            self.ico.image = #imageLiteral(resourceName: "Path 336-1")
        }


     
        getCountries()
        GetSlider()
        GetTeachers()
    }
    
    
    
    
    
    
    @IBAction func dismiss(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func SearchData(_ sender: Any) {
        
        
        if isTeacher == true {
        self.delegate?.sendDataToFirstViewController(countryId: selectCountryID, matId: seleMatId, secId: selectedSup, spId: selectedSpId, rateId: selectedRate)
            
        }else{
            self.delegate?.sendDataToFirstViewController2(countryId: selectCountryID, matId: seleMatId, secId: selectedSup, spId: selectedSpId, teacher: selectedTechId)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func setupChooseDropDownCountry() {
        chooseDropDownContry.anchorView = contView
    
        chooseDropDownContry.bottomOffset = CGPoint(x: 0, y: contView.bounds.height)
        
        chooseDropDownContry.dataSource = countriesTitle

        chooseDropDownContry.selectionAction = { [weak self] (index, item) in
            self?.lbl_country.text = item
            self?.selectCountryID = self?.countriesArry[index].id ?? 0
            
            
            
        }
    }

    
    
    
    func setupChooseDropDownSp() {
          chooseDropDownSpecilize.anchorView = spBtn
      
          chooseDropDownSpecilize.bottomOffset = CGPoint(x: 0, y: spBtn.bounds.height)
          
          chooseDropDownSpecilize.dataSource = spec

          chooseDropDownSpecilize.selectionAction = { [weak self] (index, item) in
            self?.lbl_sp.text = item
            self?.selectedSpId = self?.specData[index].id ?? 0
            
            self?.GetDiv(Id:self?.selectedSpId ?? 0)
          }
      }

    
    
    
    func setupChooseDropDownSup() {
          chooseDropDownContry.anchorView = supBtn
      
          chooseDropDownSub.bottomOffset = CGPoint(x: 0, y: supBtn.bounds.height)
          
        chooseDropDownSub.dataSource = sup

          chooseDropDownSub.selectionAction = { [weak self] (index, item) in
            self?.lbl_sup.text = item
            self?.selectedSup = self?.supData[index].id ?? 0
            
            self?.GetSp(Id:self?.selectedSup ?? 0)
          }
      }

    
    
    func setupChooseDropDownMat() {
          chooseDropDownContry.anchorView = maBtn
      
          chooseDropDownMateril.bottomOffset = CGPoint(x: 0, y: maBtn.bounds.height)
          
        chooseDropDownMateril.dataSource = self.MatStr

          chooseDropDownMateril.selectionAction = { [weak self] (index, item) in
            self?.lbl_mat.text = item
            self?.seleMatId = self?.MatData[index].id ?? 0
          }
      }

    
    func setupChooseDropDownTea() {
          chooseDropDownContry.anchorView = teachBtn
      
          chooseDropDownTeacher.bottomOffset = CGPoint(x: 0, y: teachBtn.bounds.height)
          
        
        if isTeacher == true {
            chooseDropDownTeacher.dataSource = rateArry


        }else{
                      chooseDropDownTeacher.dataSource = TeacherStr
        }

          chooseDropDownTeacher.selectionAction = { [weak self] (index, item) in
            self?.lbl_Teach.text = item
            self?.selectedTechId = self?.TeacherData[index].id ?? 0
            
            let ratId =  self?.rateArry[index] ?? ""
            self?.selectedRate = Int(ratId) ?? 1
          }
      }

    @IBAction func contryB(_ sender: Any) {
        chooseDropDownSub.direction = .any
        chooseDropDownContry.show()
    }
    
    
    @IBAction func spB(_ sender: Any) {
        chooseDropDownSpecilize.direction = .bottom

        chooseDropDownSpecilize.show()

    }
    
    @IBAction func MaBt(_ sender: Any) {
        chooseDropDownMateril.direction = .bottom

        chooseDropDownMateril.show()
    }
    @IBAction func supBt(_ sender: Any) {
        chooseDropDownSub.direction = .any

        chooseDropDownSub.show()
    }
    @IBAction func teaBtn(_ sender: Any) {
        chooseDropDownTeacher.direction = .bottom

        chooseDropDownTeacher.show()
    }
    
    func GetSlider(){
          
          DataClient.GetSlider(success: { (dict) in
              print("cities Success")
              print(dict)

              
//              self.sliderA = dict.slider
            
            self.sup.removeAll()
            
            self.supData = dict.sectionName
            
            for i in dict.sectionName {
                self.sup.append(i.sectionName)

            }
//              self.sliderC = dict.corsesArry
          
            self.setupChooseDropDownSup()
          }, failure: { (err) in
          })
          
          
          
          
      }
      
    
    
        func getCountries(){
          
                  DataClient.GetCountries(success: { (dict) in
                      print("cities Success")
                      print(dict)
                      self.countriesArry = dict
          
          
                      for i in self.countriesArry {
          
                          self.countriesTitle.append(i.countryName)
                      }
          
                    
                    self.setupChooseDropDownCountry()
                
          
    //        let indexNo = self.countriesArry.firstIndex{$0.countryName == self.userData.country_name} // 0
          
                      //
                      //            self.country_lbl.text = self.countriesTitle[indexNo!]
                      //            self.top_country.text = self.countriesTitle[indexNo!]
          
          
          
          
                  }, failure: { (err) in
                  })
          
          
          
          
              }
    
    
    
    func GetSp(Id:Int){
          
          DataClient.GetSpecialities(id: Id, success: { (dict) in
              print("cities Success")
              print(dict)
              self.specData = dict
            
            
            
            self.spec.removeAll()
            for i in dict {
                
                
                self.spec.append(i.specialityName)

                
            }
              self.setupChooseDropDownSp()

            
          
              
          }, failure: { (err) in
          })
          
          
          
          
      }
    
    
    
    func GetDiv(Id:Int){
          
          DataClient.GetSpecialitiesDive(id: Id, success: { (dict) in
              print("cities Success")
              print(dict)
              self.MatData = dict.diviton
            
            self.MatStr.removeAll()
            for i in  self.MatData {
                
                self.MatStr.append(i.divisionName)
            }
              
            
            
            self.setupChooseDropDownMat()

                                     
          }, failure: { (err) in
          })
          
          
          
          
      }
    
    
    func GetTeachers(){
                 
        DataClient.GetTeachers(country_id: 0, speciality_id: 0, material_id: 0, section_id: 0, rateId: 0, success: { (dict) in
                     print("cities Success")
                     print(dict)
                     self.TeacherData = dict
                     
                     
                    self.TeacherStr.removeAll()
                    for i in self.TeacherData {
                        
                        
                        
                        self.TeacherStr.append("\(i.firstName ?? "" ) \(i.lastName ?? "" )")
                    }
                     
            
                                                 self.setupChooseDropDownTea()
                         
                     
                     
                 }, failure: { (err) in
                 })
                 
                 
                 
                 
             }

        

}
