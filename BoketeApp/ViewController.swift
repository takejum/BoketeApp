//
//  ViewController.swift
//  BoketeApp
//
//  Created by Jumpei Takeshita on 2020/04/09.
//  Copyright © 2020 Jumpei Takeshita. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import SDWebImage
import Photos

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var searchTextField: UITextField!
    
    var count = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        
        
        commentTextView.layer.cornerRadius = 20.0
        PHPhotoLibrary.requestAuthorization { (status) in
            
            switch(status){
            case .authorized: break
            case .denied: break
            case .notDetermined: break
            case .restricted: break
            }
        }
        getImages(keyword: "absurd")
    }
    
    //defining the function to get images to show
    func getImages(keyword:String){
        
        //api key = 16009173-52b9a73c8104e15b27ffe987f
        let url = "https://pixabay.com/api/?key="your api key"&q=\(keyword)"
        
        //call http request using Alomofire
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
            
            //do json analysis with the value you get
                switch response.result{
                case .success:
                    let json:JSON =  JSON(response.data as Any)
                    
                    //put them into the imageVIew
                    var imageString = json["hits"][self.count]["webformatURL"].string
                    
                    if imageString == nil {
                        imageString = json["hits"][0]["webformatURL"].string
                        self.ImageView.sd_setImage(with: URL(string: imageString!), completed: nil)
                    }else{
                        self.ImageView.sd_setImage(with: URL(string: imageString!), completed: nil)
                    }
        
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    @IBAction func nextImageButton(_ sender: Any) {
        count += 1
        if searchTextField.text == "" {
            getImages(keyword: "absurd")
        }else{
            getImages(keyword: searchTextField.text!)
            
        }
    }
    
    @IBAction func searchButton(_ sender: Any) {
        self.count = 0
        if searchTextField.text == "" {
            getImages(keyword: "absurd")
        }else{
            getImages(keyword: searchTextField.text!)
        }
        searchTextField.endEditing(true)
        
    }
    
    @IBAction func nextButton(_ sender: Any) {
        performSegue(withIdentifier: "next", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let shareVC = segue.destination as? ShareViewController
        shareVC?.commentString = commentTextView.text
        shareVC?.resultImage = ImageView.image!
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}
