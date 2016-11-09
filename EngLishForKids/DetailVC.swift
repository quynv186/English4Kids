//
//  DetailVC.swift
//  EngLishForKids
//
//  Created by QUYNV on 11/8/16.
//  Copyright © 2016 QUYNV. All rights reserved.
//

import UIKit

class DetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var stringTitle : String!
    var dictData : NSDictionary!
    var arrayKeys = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register((UITableViewCell.self), forCellReuseIdentifier: "Cell")
        
        self.title = stringTitle
        self.createDataWithName(title: stringTitle)
        // Do any additional setup after loading the view.
    }
    
    func createDataWithName(title : String) {
        var path : String = ""
        if(title == "Fruits") {
            path = Bundle.main.path(forResource: "FruitsList", ofType: "plist")!
        }
        
        if (title == "Animals") {
            path = Bundle.main.path(forResource: "AnimalsList", ofType: "plist")!
        }
        
        if (title == "Color") {
            path = Bundle.main.path(forResource: "ColorList", ofType: "plist")!
        }
        
        dictData = NSDictionary(contentsOfFile: path)
        arrayKeys = dictData.allKeys as! [String]
        arrayKeys = arrayKeys.sorted()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayKeys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "sssss"
        
        let key : String = arrayKeys[indexPath.row] 
        cell.textLabel?.text = key
        
        cell.imageView?.image = UIImage(named: "\(dictData[key]!)")

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row) - \(arrayKeys[indexPath.row])")
        
        let detailVC = UIViewController()
        detailVC.view.backgroundColor = UIColor.white
        
        let img = UIImageView(frame: CGRect(x: (detailVC.view.bounds.size.width - 250) / 2, y: 50, width: 250, height: 250))
        img.image = UIImage(named: "\(dictData[arrayKeys[indexPath.row]]!)")
        detailVC.view.addSubview(img)
        
        let lbl = UILabel(frame: CGRect(x: (detailVC.view.bounds.size.width - 150) / 2, y: 300, width: 150, height: 50))
        lbl.text = "\(arrayKeys[indexPath.row])"
        lbl.textAlignment = NSTextAlignment.center
        detailVC.view.addSubview(lbl)
    
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
