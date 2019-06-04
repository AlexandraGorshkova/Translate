//
//  ViewController.swift
//  Translate
//
//  Created by Alexandra Gorshkova on 01/06/2019.
//  Copyright © 2019 Alexandra Gorshkova. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var output: UITextField!
 
    lazy var services = Services(db: UIApplication.shared.delegate as! AppDelegate)
    
    @IBAction func translateBlt(_ sender: Any) {
        guard let text = input.text else {
            return
        }
        services.urlSession(text: text, completion:  { text in
            DispatchQueue.main.async {
                self.output.text = text
            }
        }
        )
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

