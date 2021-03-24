//
//  CustomActionsheet.swift
//  CustomAlert
//
//  Created by mac-00021 on 19/03/21.
//

import Foundation
import UIKit

class CustomActionsheet: UIViewController {
    
    // MARK:- Global Variables -
    
    typealias alertActionHandler = ((UIAlertAction) -> ())?
    
    private static let customActionsheet: CustomActionsheet = {
        let customActionsheet = CustomActionsheet()
        return customActionsheet
    }()
    
    static var shared: CustomActionsheet {
        return customActionsheet
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- Three Action Button Picker Method -
    
    func showThreeActionButtonPicker(headerMsg: String = "",
                                     title1: String, btnIcon1: String = "", btnStyle1: UIAlertAction.Style = .default,
                                     title2: String = "", btnIcon2: String = "", btnStyle2: UIAlertAction.Style = .default,
                                     title3: String = "", btnIcon3: String = "", btnStyle3: UIAlertAction.Style = .default,
                                     banner: String = "ic_alert", isShowBanner: Bool = false,
                                     isShowCancle: Bool = false,
                                     btn1Handler: alertActionHandler = nil,
                                     btn2Handler: alertActionHandler = nil,
                                     btn3Handler: alertActionHandler = nil,
                                     controller : UIViewController) {
        
        let actionSheetMenu = UIAlertController(title: isShowBanner ? "\n\n\n\n\n\n" : nil, message: headerMsg == "" ? nil : headerMsg, preferredStyle: .actionSheet)
        
        if isShowBanner {
            
            let imageView = UIImageView(frame: CGRect(x: 8.0, y: 8.0, width: actionSheetMenu.view.bounds.size.width - 8.0 * 4.5, height: 120.0))
            imageView.image = UIImage(named: banner)
            imageView.layer.cornerRadius = 10
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleAspectFit
            actionSheetMenu.view.addSubview(imageView)
        }
        
        let action1 = UIAlertAction(title: title1, style: btnStyle1, handler: btn1Handler)
        action1.setValue(UIImage(named: btnIcon1), forKey: "image")
        actionSheetMenu.addAction(action1)
        
        if title2 != "" {
            
            let action2 = UIAlertAction(title: title2, style: btnStyle2, handler: btn2Handler)
            action2.setValue(UIImage(named: btnIcon2), forKey: "image")
            actionSheetMenu.addAction(action2)
        }
        
        if title3 != "" {
            
            let action3 = UIAlertAction(title: title3, style: btnStyle3, handler: btn3Handler)
            action3.setValue(UIImage(named: btnIcon3), forKey: "image")
            actionSheetMenu.addAction(action3)
        }
        
        if isShowCancle {
            
            let cancelAction = UIAlertAction(title: "Close", style: .cancel, handler: nil)
            actionSheetMenu.addAction(cancelAction)
        }
        
        controller.present(actionSheetMenu, animated: true, completion: nil)
    }
}
