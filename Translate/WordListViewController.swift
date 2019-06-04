//
//  WordListViewController.swift
//  Translate
//
//  Created by Alexandra Gorshkova on 02/06/2019.
//  Copyright © 2019 Alexandra Gorshkova. All rights reserved.
//

import UIKit
import CoreData

class WordListViewController: UITableViewController{

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func loadWords()-> Words{
        let application =  UIApplication.shared.delegate as! AppDelegate
        let context = application.persistentContainer.viewContext
        let results = try! context.fetch(Words.fetchRequest()) as! [Words]
        let word = results.first!
        return word
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SomeCell", for: indexPath) as! WordViewCell
        let wor = loadWords()
        cell.word.text = wor.word
        cell.translate.text = wor.translate

        return cell
    }

}
