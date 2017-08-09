//
//  ViewController.swift
//  MyAlamofire
//
//  Created by Ovsyankinds on 08/08/2017.
//  Copyright © 2017 Ovsyankinds. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var arr = [String]()
    
   @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request("https://swapi.co/api/people/1").responseJSON { response in
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
                print("------------")
                
                let myJson = json as! Dictionary <String, AnyObject>
                
                //print(myJson["eye_color"]!)
                
                self.arr.append((myJson["name"] as? String)!)
                self.arr.append((myJson["hair_color"] as? String)!)
                self.arr.append((myJson["eye_color"] as? String)!)
                self.arr.append(String((myJson["height"] as? String)!)!)
                self.arr.append(String((myJson["mass"] as? String)!)!)
                
                self.tableView.reloadData()
                
                
                /*do{
                let myJson = try JSONSerialization.jsonObject(with: response.data!, options: []) as! [String: AnyObject]
                    
                    
                    self.arr.append((myJson["name"] as? String)!)
                    self.arr.append((myJson["hair_color"] as? String)!)
                    self.arr.append((myJson["eye_color"] as? String)!)
                    self.arr.append(String((myJson["height"] as? String)!)!)
                    self.arr.append(String((myJson["mass"] as? String)!)!)
                    
                    self.tableView.reloadData()
                    
                    //print(myJson["birth_year"]! as! String)
                    
                    print(self.arr)
                } catch{
                    print("Error")
                }*/
                
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension ViewController: UITableViewDataSource{
    @available(iOS 2.0, *)
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arr.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel!.text = self.arr[indexPath.row] 
        return cell
    }
    
}








