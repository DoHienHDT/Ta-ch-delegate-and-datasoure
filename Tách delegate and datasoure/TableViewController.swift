//
//  TableViewController.swift
//  Tách delegate and datasoure
//
//  Created by dohien on 5/28/18.
//  Copyright © 2018 ưqww. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    let numberDataSource = NumnerDataSource()
    let stringDataSource = StringDataSource()
    @IBOutlet weak var switchData: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        // khi bat man hinh man number se hien len dau tien va khong co dong nay se hien man hinh trang
       self.tableView.dataSource = numberDataSource
        tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func switchData(_ sender: UISwitch) {
        if sender.isOn{
            tableView.dataSource = numberDataSource
        }else{
            tableView.dataSource = stringDataSource
        }
        tableView.reloadData()
    }
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        let viewcontroller = unwindSegue.source as! ViewController
        if let index = tableView.indexPathForSelectedRow?.row {
            if switchData.isOn {
                numberDataSource.number[index] = Int(viewcontroller.name!)!
                
            }else{
                stringDataSource.string[index] = viewcontroller.name!
            }
        }else{
            if switchData.isOn{
                numberDataSource.number.append(Int(viewcontroller.name!)!)
            }else {
                stringDataSource.string.append(viewcontroller.name!)
            }
        }
        tableView.reloadData()
    }
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "show" {
            let viewcontroller = segue.destination as! ViewController
            if let index = tableView.indexPathForSelectedRow?.row{
                if switchData.isOn {
                    viewcontroller.name = String(numberDataSource.number[index])
                }else{
                    viewcontroller.name = stringDataSource.string[index]
                }
            }
        }
    }
}
// viet gon ham if else


//if let index = tableView.indexPathForSelectedRow?.row {
//    switchData.isOn ?  ( numberDataSource.number[index] = Int(viewcontroller.name)!) : ( stringDataSource.string[index] = viewcontroller.name)
//}else{
//    switchData.isOn ? (numberDataSource.number.append(Int(viewcontroller.name)!)) : ( stringDataSource.string.append(viewcontroller.name))
//
//
//}

