//
//  NumberDataSource.swift
//  Tách delegate and datasoure
//
//  Created by dohien on 5/28/18.
//  Copyright © 2018 ưqww. All rights reserved.
//

import UIKit
class NumnerDataSource: NSObject , UITableViewDataSource {
    
    var number = Array(1...4)
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return number.count
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        number.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(number[indexPath.row])
        return cell
    }
}
