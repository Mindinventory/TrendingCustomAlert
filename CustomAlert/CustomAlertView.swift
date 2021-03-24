//
//  CustomAlertView.swift
//  CustomAlert
//
//  Created by mac-00021 on 10/03/21.
//

import Foundation
import UIKit

final class CustomAlertView: UIView {
    
    //MARK:- @IBOutlet -
    
    @IBOutlet var mainView: UIView!
    @IBOutlet private weak var viewBackRadius: UIView!
    @IBOutlet private weak var imgVCustomIcon: UIImageView!
    @IBOutlet private weak var lblCustomTitle: UILabel!
    @IBOutlet private weak var lblCustomMessage: UILabel!
    @IBOutlet private weak var btnCustomDone: UIButton!
    @IBOutlet private weak var btnCustomCancel: UIButton!
    
    // MARK:- Global Variables -
    
    var onDoneClicked: (() -> Void)?
    var onCancelClicked: (() -> Void)?
    
    private static let customAlertView: CustomAlertView = {
        let customAlertView = CustomAlertView()
        return customAlertView
    }()
    
    static var shared: CustomAlertView {
        return customAlertView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("CustomAlertView", owner: self, options: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Emun AlertType -
    
    enum AlertType {
        case oneButton(title: String? = "Done", color: UIColor? = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
        case twoButton(title1: String? = "Cancel", color1: UIColor? = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), title2: String? = "OK", color2: UIColor? = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
    }
    
    //MARK:- Custom Alert Method -
    
    func showCustomAlert(title: String? = nil, message: String? = nil, alertType: AlertType, icon: String = "", alertRadius: CGFloat?, btnRadius: CGFloat?, customCorners: CACornerMask = CACornerMask(rawValue: 15)) {
        
        mainView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        mainView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        imgVCustomIcon.layer.cornerRadius = 30
        imgVCustomIcon.clipsToBounds = true
        imgVCustomIcon.layer.borderColor = UIColor.lightGray.cgColor
        imgVCustomIcon.layer.borderWidth = 2
        
        viewBackRadius.layer.maskedCorners = customCorners
        viewBackRadius.layer.cornerRadius = alertRadius ?? 70
        
        btnCustomDone.clipsToBounds = true
        btnCustomDone.layer.maskedCorners = customCorners
        btnCustomDone.layer.cornerRadius = btnRadius ?? 30
        
        btnCustomCancel.clipsToBounds = true
        btnCustomCancel.layer.cornerRadius = btnRadius ?? 30
        btnCustomCancel.layer.maskedCorners = customCorners
        
        imgVCustomIcon.isHidden = (icon == "")
        imgVCustomIcon.image = UIImage(named: icon)
        lblCustomTitle.text = title
        lblCustomMessage.text = message
        
        switch alertType {
        case .oneButton(let title, let color):
            
            btnCustomDone.isHidden = true
            btnCustomCancel.setTitle(title, for: .normal)
            btnCustomCancel.backgroundColor = color
            
        case .twoButton(let title1, let color1, let title2, let color2):
            
            btnCustomDone.isHidden = false
            btnCustomCancel.setTitle(title1, for: .normal)
            btnCustomCancel.backgroundColor = color1
            btnCustomDone.setTitle(title2, for: .normal)
            btnCustomDone.backgroundColor = color2
        }
        
        viewBackRadius.isHidden = false
        mainView.isHidden = false
        viewBackRadius.transform = CGAffineTransform(scaleX: 0, y: 0)
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            
            self.mainView.alpha = 1.0;
            self.viewBackRadius.transform = .identity
        }, completion: nil)
        
        if let window = UIApplication.shared.windows.first(where: { (window) -> Bool in window.isKeyWindow}) {
            window.addSubview(mainView)
        }
    }
}

//MARK:- Action Events -

extension CustomAlertView {
    
    @IBAction func onClickedDone(_ sender: Any) {
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            
            self.mainView.alpha = 0.0;
            self.viewBackRadius.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            
        }, completion: { _ in
            
            self.mainView.isHidden = true
            self.viewBackRadius.isHidden = true
            self.onDoneClicked?()
        })
    }
    
    @IBAction func onClickedCancel(_ sender: Any) {
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            
            self.mainView.alpha = 0.0;
            self.viewBackRadius.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            
        }, completion: { _ in
            
            self.mainView.isHidden = true
            self.viewBackRadius.isHidden = true
            self.onCancelClicked?()
        })
    }
}
