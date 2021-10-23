//
//  ViewController.swift
//  ShoppingList
//
//  Created by Baffoe, Joseph - FUT on 10/23/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource
{
    //MARK: Declare Outlets and Variables
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var textField: UITextField!
    
    var items:[Item] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.dataSource = self
        let item = Item(theName: "milk")
        let item2 = Item(theName: "eggs")
        let item3 = Item(theName: "bacon")
        items = [item, item2]
        items.append(item3)
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        print(indexPath.row)
        cell.textLabel?.text = items[indexPath.row].name
        return cell
    }
    
    @IBAction func whenButtonPressed(_ sender: UIBarButtonItem)
    {
        if let newItemName = textField.text
        {
            let newItem = Item(theName: newItemName)
            items.append(newItem)
            tableView.reloadData()
        }
    }
    
}

