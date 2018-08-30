//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Halil Özel on 30.08.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }

    
    @IBAction func getData(_ sender: Any) {
        
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=f4739692fbb8b1ad41fb08e935b619f8&format=1")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            
            if error != nil{
                
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                
                let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alert.addAction(okButton)
                
                self.present(alert, animated: true, completion: nil)
            }else{
                if data != nil{
                    
                    do{
                        let jSONResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String,AnyObject>
                        
                        // mutableContainers : Dizilerin ve sözlüklerin değişebilir nesneler olarak oluşturulduğunu belirtir.
                        
                        // DispatchQueue : çalışma öğelerinin yürütülmesini yönetir. Bir sıraya gönderilen her iş öğesi, sistem tarafından yönetilen bir iş parçacığı havuzunda işlenir.
                        
                        DispatchQueue.main.async {
                            print(jSONResult)
                        }
                        
                    }catch{
                       
                    }
                    
                    
                }
               
            
            }
            
        }
        
             task.resume()
        }
    
    }
    


