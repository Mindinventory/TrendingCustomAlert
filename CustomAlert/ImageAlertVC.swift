//
//  ImageAlertVC.swift
//  CustomAlert
//
//  Created by mac-00021 on 22/03/21.
//

import UIKit
import WebKit

final class ImageAlertVC: UIViewController {
    
    //MARK:- @IBOutlet -
    
    @IBOutlet private weak var webView: WKWebView!
    @IBOutlet private weak var viewBack: UIView!
    @IBOutlet private weak var lblTitle: UILabel!
    @IBOutlet private weak var imgViewImage: UIImageView!
    @IBOutlet private weak var lblNoData: UILabel!
    
    // MARK:- Global Variables -
    
    var name: String? = ""
    var imageName: String? = ""
    var url: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async { [weak self] in
            
            guard let self = self else { return }
            self.viewBack.layer.cornerRadius = 20
            self.webView.layer.cornerRadius = 20
            self.webView.clipsToBounds = true
            
            self.imgViewImage.layer.cornerRadius = 20
            self.imgViewImage.clipsToBounds = true
        }
        
        lblTitle.isHidden = name == ""
        lblTitle.text = name
        
        if imageName != "" {
            
            lblTitle.isHidden = false
            imgViewImage.isHidden = false
            lblNoData.isHidden = true
            webView.isHidden = true
            imgViewImage.image = UIImage(named: self.imageName ?? "")
            
        } else if url != nil {
            
            lblTitle.isHidden = false
            imgViewImage.isHidden = true
            lblNoData.isHidden = true
            webView.isHidden = false
            webView.load(URLRequest(url: url!))
            
        } else {
            
            lblTitle.isHidden = true
            lblNoData.isHidden = false
        }
    }
    
    @IBAction func onClickedClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
