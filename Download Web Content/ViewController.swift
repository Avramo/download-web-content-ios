//
//  ViewController.swift
//  Download Web Content
//
//  Created by admin on 27/01/2020.
//  Copyright © 2020 AM Kirsch. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController , WKUIDelegate {

    @IBOutlet weak var webview: WKWebView!
    
    @IBOutlet weak var button: UIButton!

    @IBAction func google(_ sender: Any) {
        if  let googleURL = URL(string: "https://www.google.com/"){
        
            let request = NSMutableURLRequest(url: googleURL)

            let task = URLSession.shared.dataTask(with: request as URLRequest){
                data, response, error in
                
                if error != nil {
                    print("HEY!  error!! ", error as Any)
                } else {
                    if let unwrappedData = data {
                        let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                        // print source code of url request site to log
                        print(dataString as Any)
                        
                        // show website on webview/screen
                        DispatchQueue.main.async { // Correct
                            self.webview.load(request as URLRequest)
                            self.button.alpha = 0.0
                        }
                        
            	            
                        
                        
                    }
                }
            }
            task.resume()
            //webview.load(   )
        }
        
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
       webview.loadHTMLString("<h2 style='color: red; font-size: 100pt;'>hello world!</h2>", baseURL: nil)
        
    }
    
    
    
    


}

