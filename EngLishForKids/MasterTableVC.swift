//
//  MasterTableVC.swift
//  EngLishForKids
//
//  Created by QUYNV on 11/8/16.
//  Copyright © 2016 QUYNV. All rights reserved.
//

import UIKit

class MasterTableVC: UITableViewController {
    
    var dictList = ["Fruits" : "fruits.png", "Animals" : "animals.jpeg", "Colors" : "color.jpeg"]

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dictList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        var arrayKey = Array(dictList.keys)
        
        cell.textLabel?.text = arrayKey[indexPath.row]
        cell.imageView?.image = UIImage(named: dictList["\(arrayKey[indexPath.row])"]!)
        
        return cell
    }

    

}
