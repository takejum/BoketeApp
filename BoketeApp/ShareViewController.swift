//
//  SecondViewController.swift
//  BoketeApp
//
//  Created by Jumpei Takeshita on 2020/04/10.
//  Copyright © 2020 Jumpei Takeshita. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {
    
    var resultImage = UIImage()
    var commentString = String()
    var screenshotImage = UIImage()
    
    @IBOutlet weak var resultImageView: UIImageView!
    
    @IBOutlet weak var commentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultImageView.image = resultImage
        commentLabel.text = commentString
        commentLabel.adjustsFontSizeToFitWidth = true

        // Do any additional setup after loading the view.
    }
    
    @IBAction func shareButton(_ sender: Any) {
        //screenshot the view
        screenshot()
        //put them on activity view and share
        let items = [screenshotImage] as [Any]
        let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
        
    }
    
    //function to screenshot
    func screenshot(){
        let width = CGFloat(UIScreen.main.bounds.size.width)
        let height = CGFloat(UIScreen.main.bounds.size.height/1.3)
        let size = CGSize(width: width, height: height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        //encode on view
        self.view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        screenshotImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
