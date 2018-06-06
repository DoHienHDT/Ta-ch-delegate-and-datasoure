//
//  StringDataSource.swift
//  Tách delegate and datasoure
//
//  Created by dohien on 5/28/18.
//  Copyright © 2018 ưqww. All rights reserved.
//

import UIKit
class StringDataSource: NSObject , UITableViewDataSource{
    
    var string = ["one","two","three","four"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return string.count
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        string.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = string[indexPath.row]
        return cell
    }

}
