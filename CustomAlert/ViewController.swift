//
//  ViewController.swift
//  CustomAlert
//
//  Created by mac-00021 on 10/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK:- @IBOutlet -
    
    @IBOutlet private weak var btnOpenWebAlert: UIButton!
    @IBOutlet private weak var btnOpenImageAlert: UIButton!
    @IBOutlet private weak var btnOneAlert: UIButton!
    @IBOutlet private weak var btnTwoAlert: UIButton!
    @IBOutlet private weak var btnOneActionsheet: UIButton!
    @IBOutlet private weak var btnActionsheetWithBanner: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CustomAlertView.shared.onDoneClicked = { [weak self] in
            
            guard let _ = self else { return }
            CustomAlertView.shared.mainView.removeFromSuperview()
        }
        
        CustomAlertView.shared.onCancelClicked = { [weak self] in
            
            guard let _ = self else { return }
            CustomAlertView.shared.mainView.removeFromSuperview()
        }
        
        DispatchQueue.main.async { [weak self] in
            
            guard let self = self else { return }
            
            self.btnOpenWebAlert.layer.cornerRadius = 10
            self.btnOpenImageAlert.layer.cornerRadius = 10
            self.btnOneAlert.layer.cornerRadius = 10
            self.btnTwoAlert.layer.cornerRadius = 10
            self.btnOneActionsheet.layer.cornerRadius = 10
            self.btnActionsheetWithBanner.layer.cornerRadius = 10
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK:- Action Events -

extension ViewController {
    
    @IBAction func onClickedOpenWebPopup(_ sender: Any) {
        
        if let popupViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ImageAlertVC") as? ImageAlertVC {
            
            popupViewController.name = "Terms & Conditions"
            popupViewController.url = URL(string: "https://www.apple.com")
            self.present(popupViewController, animated: true)
        }
    }
    
    @IBAction func onClickedOpenImagePopup(_ sender: Any) {
        
        if let popupViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ImageAlertVC") as? ImageAlertVC {
            
            //            popupViewController.name = "Burj Al Arab"
            popupViewController.imageName = "burj _al_arab"
            self.present(popupViewController, animated: true)
        }
    }
    
    @IBAction func onClickedOneBtnAlert(_ sender: Any) {
        
        CustomAlertView.shared.showCustomAlert(title: "Alert",
                                               message: "Custom Alert with One option button view. Custom corner radius can also apply for view and buttons.",
                                               alertType: .oneButton(),
                                               alertRadius: 30,
                                               btnRadius: 20)
    }
    
    @IBAction func onClickedTwoBtnAlert(_ sender: Any) {
        
        CustomAlertView.shared.showCustomAlert(title: "LogOut",
                                               message: "Are you sure you want to LogOut? ",
                                               alertType: .twoButton(title1: "No", title2: "Yes"),
                                               icon: "user",
                                               alertRadius: 70,
                                               btnRadius: 25,
                                               customCorners: [.layerMinXMinYCorner, .layerMaxXMaxYCorner])
    }
    
    @IBAction func onClickedOpenActionSheet(_ sender: Any) {
        
        CustomActionsheet.shared.showThreeActionButtonPicker(title1: "Help", btnIcon1: "ic_help_circle",
                                                             title2: "Info", btnIcon2: "ic_info", btnStyle2: .default,
                                                             title3: "Logout", btnIcon3: "ic_logout", btnStyle3: .destructive,
                                                             isShowCancle: true, controller: self)
    }
    
    @IBAction func onClickedOpenActionSheetWithBanner(_ sender: Any) {
        
        CustomActionsheet.shared.showThreeActionButtonPicker(title1: "Male", btnStyle1: .default,
                                                             title2: "Female",btnStyle2: .default,
                                                             banner: "gender", isShowBanner: true,
                                                             controller: self)
    }
}
