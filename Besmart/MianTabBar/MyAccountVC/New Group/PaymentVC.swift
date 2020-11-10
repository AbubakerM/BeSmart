//
//  PaymentVC.swift
//  Besmart
//
//  Created by Mohammed Abubaker on 02/11/2020.
//  Copyright © 2020 eng.EleyanSaed. All rights reserved.
//

import UIKit
import MFSDK

class PaymentVC: UIViewController {
    
    //MARK: Variables
    var paymentMethods: [MFPaymentMethod]?
    var selectedPaymentMethodIndex: Int?
    
    
    //MARK: Outlet
    @IBOutlet weak var errorCodeLabel : UILabel!
    @IBOutlet weak var payButton: UIButton!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var resultTextView: UITextView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var cardInfoStackViews: [UIStackView]!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var cardNumberTextField: UITextField!
    @IBOutlet weak var cardHolderNameTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var secureCodeTextField: UITextField!
    @IBOutlet weak var sendPaymentButton: UIButton!
    @IBOutlet weak var sendPaymentActivityIndicator: UIActivityIndicatorView!

    //at list one product Required
    let productList = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        payButton.isEnabled = false
        
        //setCardInfo()//Prepare test cards
        initiatePayment()//Get Payment Methods
        
//        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func payDidPRessed(_ sender: Any) {
        if let paymentMethods = paymentMethods, !paymentMethods.isEmpty {
            if let selectedIndex = selectedPaymentMethodIndex {
                
//                if paymentMethods[selectedIndex].paymentMethodCode == MFPaymentMethodCode.applePay.rawValue {
//                    executeApplePayPayment(paymentMethodId: paymentMethods[selectedIndex].paymentMethodId)
//                } else
                if paymentMethods[selectedIndex].isDirectPayment {//Cards
                    executeDirectPayment(paymentMethodId: paymentMethods[selectedIndex].paymentMethodId)
                } else {//Knet
                    executePayment(paymentMethodId: paymentMethods[selectedIndex].paymentMethodId)
                }
            }
        }
    }
    
    @IBAction func sendPaymentDidTapped(_ sender: Any) {
        sendPayment()
    }
}

extension PaymentVC  {
    func startSendPaymentLoading() {
        errorCodeLabel.text = "Status:"
        resultTextView.text = "Result:"
        sendPaymentButton.setTitle("", for: .normal)
        sendPaymentActivityIndicator.startAnimating()
    }
    func stopSendPaymentLoading() {
        sendPaymentButton.setTitle("Send Payment", for: .normal)
        sendPaymentActivityIndicator.stopAnimating()
    }
    func startLoading() {
        //errorCodeLabel.text = "Status:"
        //resultTextView.text = "Result:"
        payButton.setTitle("", for: .normal)
        activityIndicator.startAnimating()
    }
    func stopLoading() {
        payButton.setTitle("ادفع الآن", for: .normal)
        activityIndicator.stopAnimating()
    }
    func showSuccess(_ message: String) {
        errorCodeLabel.text = "Succes"
        resultTextView.text = "result: \(message)"
    }
    
    func showFailError(_ error: MFFailResponse) {
        //errorCodeLabel.text = "responseCode: \(error.statusCode)"
        //resultTextView.text = "Error: \(error.errorDescription)"
        print("responseCode: \(error.statusCode)")
        print("Error: \(error.errorDescription)")
        self.errorAlert(title: "\(error.statusCode)", body: "Error: \(error.errorDescription)")
    }
}
extension PaymentVC {
    func hideCardInfoStacksView(isHidden: Bool) {
        for stackView in cardInfoStackViews {
            stackView.isHidden = isHidden
        }
    }
    private func setCardInfo() {
        cardNumberTextField.text = "5123450000000008"
        cardHolderNameTextField.text = "name on card"
        monthTextField.text = "05"
        yearTextField.text = "21"
        secureCodeTextField.text = "100"
    }
}

//extension UIViewController {
//    func hideKeyboardWhenTappedAround() {
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
//        tap.cancelsTouchesInView = false
//        view.addGestureRecognizer(tap)
//    }
//
//    @objc func dismissKeyboard() {
//        view.endEditing(true)
//    }
//}

extension PaymentVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let paymentMethods = paymentMethods else {
            return 0
        }
        return paymentMethods.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PaymentMethodCollectionViewCell
        if let paymentMethods = paymentMethods, !paymentMethods.isEmpty {
            let selectedIndex = selectedPaymentMethodIndex ?? -1
            cell.configure(paymentMethod: paymentMethods[indexPath.row], selected: selectedIndex == indexPath.row)
        }
        return cell
    }
    
}

extension PaymentVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedPaymentMethodIndex = indexPath.row
        payButton.isEnabled = true
        
        if let paymentMethods = paymentMethods {
            if paymentMethods[indexPath.row].isDirectPayment {
                hideCardInfoStacksView(isHidden: false)
            } else {
                hideCardInfoStacksView(isHidden: true)
            }
        }
        collectionView.reloadData()
    }
}

extension PaymentVC {
    func initiatePayment() {
        let request = generateInitiatePaymentModel()
        startLoading()
        MFPaymentRequest.shared.initiatePayment(request: request, apiLanguage: .arabic, completion: { [weak self] (result) in
            self?.stopLoading()
            switch result {
            case .success(let initiatePaymentResponse):
                self?.paymentMethods = initiatePaymentResponse.paymentMethods
                self?.collectionView.reloadData()
            case .failure(let failError):
                self?.showFailError(failError)
            }
        })
    }
    
    func executeDirectPayment(paymentMethodId: Int) {
        let request = getExecutePaymentRequest(paymentMethodId: paymentMethodId)
        let card = getCardInfo()
        startLoading()
        MFPaymentRequest.shared.executeDirectPayment(request: request, cardInfo: card, apiLanguage: .arabic) { [weak self] (response, invoiceId) in
            self?.stopLoading()
            switch response {
            case .success(let directPaymentResponse):
                //Call API
                
                if let cardInfoResponse = directPaymentResponse.cardInfoResponse, let card = cardInfoResponse.cardInfo {
                    //self?.resultTextView.text =
                        print("Status: with card number: \(card.number)")
                }
                if let invoiceId = invoiceId {
                    //self?.errorCodeLabel.text =
                        print("Success with invoice id \(invoiceId)")
                } else {
                        print("Success")
                    //self?.errorCodeLabel.text = "Success"
                }
                
                self?.sendPayment()
            case .failure(let failError):
                self?.errorAlert(title: "\(failError.statusCode)", body: "\(failError.errorDescription)")
//                self?.resultTextView.text = "Error: \(failError.errorDescription)"
//                if let invoiceId = invoiceId {
//                    self?.errorCodeLabel.text = "Fail: \(failError.statusCode) with invoice id \(invoiceId)"
//                } else {
//                    self?.errorCodeLabel.text = "Fail: \(failError.statusCode)"
//                }
            }
        }
    }
    
//    func executeApplePayPayment(paymentMethodId: Int) {
//        let request = getExecutePaymentRequest(paymentMethodId: paymentMethodId)
//        startLoading()
//        if #available(iOS 13.0, *) {
//            MFPaymentRequest.shared.executeApplePayPayment(request: request, apiLanguage: .arabic) { [weak self] (response, invoiceId) in
//                self?.stopLoading()
//                switch response {
//                case .success(let executePaymentResponse):
//                    if let invoiceStatus = executePaymentResponse.invoiceStatus {
//                        self?.showSuccess(invoiceStatus)
//                    }
//                case .failure(let failError):
//                    self?.showFailError(failError)
//                }
//            }
//        } else {
//            // Fallback on earlier versions
//            let urlScheme = "com.myFatoorah.MFSDKDemo"
//            MFPaymentRequest.shared.executeApplePayPayment(request: request, urlScheme: urlScheme, apiLanguage: .arabic) { [weak self] response, invoiceId  in
//                self?.stopLoading()
//                switch response {
//                case .success(let executePaymentResponse):
//                    if let invoiceStatus = executePaymentResponse.invoiceStatus {
//                        self?.showSuccess(invoiceStatus)
//                    }
//                case .failure(let failError):
//                    self?.showFailError(failError)
//                }
//            }
//        }
//    }

    func executePayment(paymentMethodId: Int) {
        let request = getExecutePaymentRequest(paymentMethodId: paymentMethodId)
        startLoading()
        MFPaymentRequest.shared.executePayment(request: request, apiLanguage: .arabic) { [weak self] response, invoiceId  in
            self?.stopLoading()
            switch response {
            case .success(let executePaymentResponse):
                //if let invoiceStatus = executePaymentResponse.invoiceStatus {
                    //self?.showSuccess(invoiceStatus)
                //}
            //Hit the request
                self?.sendPayment()
            case .failure(let failError):
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
                    self?.showFailError(failError)
                }
            }
        }
    }
    
    
    func sendPayment() {
        let request = getSendPaymentRequest()
        startLoading()
        MFPaymentRequest.shared.sendPayment(request: request, apiLanguage: .arabic) { [weak self] (result) in
            self?.stopLoading()
            switch result {
            case .success(let sendPaymentResponse):
                if let invoiceURL = sendPaymentResponse.invoiceURL {
//                    self?.errorCodeLabel.text = "Success"
//                    self?.resultTextView.text = "result: send this link to your customers \(invoiceURL)"
                    print(invoiceURL)
                
                /*
                 token

                 payment_method_id
                 amount
                 */
                    let index = self?.selectedPaymentMethodIndex ?? 0
                    let par = ["link":invoiceURL,
                               "payment_method_id":self?.paymentMethods?[index].paymentMethodId ?? 0,
                               "amount":self?.amountTextField.text ?? ""] as [String : Any]
                    DataClient.submitPayment(parameters: par, success: { (response) in
                        let alert = UIAlertController(title: "تمت العملية بنجاح", message: "تم شراء واضافة الرصيد الى محفظتك بنجاح", preferredStyle: .alert)
                        let ok = UIAlertAction(title: "انهاء", style: .default) { (action) in
                            self?.dismiss(animated: true, completion: {
                                //Dismiss & Update Profile
                                NotificationCenter.default.post(name: .updatePoints, object: nil)
                            })
                        }
                        alert.addAction(ok)
                        self?.present(alert, animated: true, completion: nil)
                    }) { (failResponse) in
                        
                    }

                    
                }
            case .failure(let failError):
                self?.showFailError(failError)
            }
            
        }
        
    }
}
extension PaymentVC {
    private func generateInitiatePaymentModel() -> MFInitiatePaymentRequest {
         //you can create initiate payment request with invoice value and currency
         let invoiceValue = Double(amountTextField.text ?? "") ?? 0
        let request = MFInitiatePaymentRequest(invoiceAmount: Decimal(invoiceValue), currencyIso: .unitedStates_USD)
         return request
        
//        let request = MFInitiatePaymentRequest()
//        return request
    }
    private func getCardInfo() -> MFCardInfo {
        let cardNumber = cardNumberTextField.text ?? ""
        let cardExpiryMonth = monthTextField.text ?? ""
        let cardExpiryYear = yearTextField.text ?? ""
        let cardSecureCode = secureCodeTextField.text ?? ""
        let cardHolderName = cardHolderNameTextField.text ?? ""

        
        let card = MFCardInfo(cardNumber: cardNumber, cardExpiryMonth: cardExpiryMonth, cardExpiryYear: cardExpiryYear, cardHolderName: cardHolderName, cardSecurityCode: cardSecureCode, saveToken: false)
//        card.bypass = false
        return card
    }
    
    private func getExecutePaymentRequest(paymentMethodId: Int) -> MFExecutePaymentRequest {
        let invoiceValue = Decimal(string: amountTextField.text ?? "0") ?? 0
        let request = MFExecutePaymentRequest(invoiceValue: invoiceValue , paymentMethod: paymentMethodId)
        //request.userDefinedField = ""
        request.customerEmail = ISConstant.Email// must be email
        request.customerMobile = ISConstant.mobile
        request.customerCivilId = ""
        let address = MFCustomerAddress(block: "ddd", street: "sss", houseBuildingNo: "sss", address: "sss", addressInstructions: "sss")
        request.customerAddress = address
        request.customerReference = ""
        request.language = .arabic
        //request.mobileCountryCode = MFMobileCountryCodeISO.kuwait.rawValue
        request.displayCurrencyIso = .unitedStates_USD
        // Uncomment this to add products for your invoice
//         var productList = [MFProduct]()
//        let product = MFProduct(name: "ABC", unitPrice: 1.887, quantity: 1)
//         productList.append(product)
//         request.invoiceItems = productList
        return request
    }
    
    func getSendPaymentRequest() -> MFSendPaymentRequest {
        let invoiceValue = Decimal(string: amountTextField.text ?? "") ?? 0
        let name = ISConstant.Firstname + " " + ISConstant.Lastname
        let request = MFSendPaymentRequest(invoiceValue: invoiceValue, notificationOption: .all, customerName: name)
        
        // send invoice link as sms to specified number
        // let request = MFSendPaymentRequest(invoiceValue: invoiceValue, notificationOption: .sms, customerName: "Test")
        // request.customerMobile  = "" // required here
        
        // get invoice link
        // let request = MFSendPaymentRequest(invoiceValue: invoiceValue, notificationOption: .link, customerName: "Test")
        
        //  send invoice link to email
        // let request = MFSendPaymentRequest(invoiceValue: invoiceValue, notificationOption: .email, customerName: "Test")
        // request.customerEmail = "" required here
        
        
        
        //request.userDefinedField = ""
        request.customerEmail = ISConstant.Email// must be email
        request.customerMobile = ISConstant.mobile.isEmpty ? "123123123" : ISConstant.mobile//Required
        request.customerCivilId = ""
        //request.mobileCountryIsoCode = MFMobileCountryCodeISO.uAE.rawValue
        request.customerReference = ""
        request.language = .arabic
        let address = MFCustomerAddress(block: "aaa", street: "bbb", houseBuildingNo: "ccc", address: "ddd", addressInstructions: "eee")
        request.customerAddress = address
        request.customerReference = ""
        request.language = .arabic
        request.displayCurrencyIso = .unitedStates_USD
        let date = Date().addingTimeInterval(1000)
        request.expiryDate = date
        return request
    }
}

 // MARK: - Recurring Payment
extension PaymentVC {

    func executeRecurringPayment(paymentMethodId: Int) {
        let request = MFExecutePaymentRequest(invoiceValue: 5.000 , paymentMethod: paymentMethodId)
        let card = MFCardInfo(cardNumber: "", cardExpiryMonth: "", cardExpiryYear: "", cardHolderName: "", cardSecurityCode: "")
        MFPaymentRequest.shared.executeRecurringPayment(request: request, cardInfo: card, recurringIntervalDays: 10, apiLanguage: .arabic) { (response, invoiceId) in
            switch response {
            case .success(let directPaymentResponse):
                if let cardInfoResponse = directPaymentResponse.cardInfoResponse, let card = cardInfoResponse.cardInfo {
                    print("Status: with card number: \(card.number)")
                    print("Status: with recurring Id: \(cardInfoResponse.recurringId ?? "")")
                }
                if let invoiceId = invoiceId {
                    print("Success with invoice id \(invoiceId)")
                } else {
                    print("Success")
                }
            case .failure(let failError):
                print("Error: \(failError.errorDescription)")
                if let invoiceId = invoiceId {
                    print("Fail: \(failError.statusCode) with invoice id \(invoiceId)")
                } else {
                    print("Fail: \(failError.statusCode)")
                }
            }
        }


    }

    func executeRecurringPayment(recurringId: String) {
        MFPaymentRequest.shared.cancelRecurringPayment(recurringId: recurringId, apiLanguage: .arabic) { [weak self] (result) in
            switch result {
            case .success(let isCanceled):
                if isCanceled {
                    print("Success")
                }

            case .failure(let failError):
                self?.showFailError(failError)
            }
        }
    }

}


