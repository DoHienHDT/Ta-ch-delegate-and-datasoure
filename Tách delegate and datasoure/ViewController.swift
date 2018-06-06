//
//  ViewController.swift
//  Tách delegate and datasoure
//
//  Created by dohien on 5/28/18.
//  Copyright © 2018 ưqww. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    var name: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if name != nil {
            nameTextField.text = name
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        name = nameTextField.text!
    }
}

