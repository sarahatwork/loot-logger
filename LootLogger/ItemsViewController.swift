//
//  ItemsViewController.swift
//  LootLogger
//
//  Created by Sarah Mogin on 2/14/23.
//

import UIKit

class ItemsViewController: UITableViewController {
    var itemStore: ItemStore!
    
    @IBAction func addNewItem(_ sender: UIButton) {
        let newItem = itemStore.createItem()
        
        if (newItem.isChihuahua()) {
            if let index = itemStore.chihuahuas.firstIndex(of: newItem) {
                let indexPath = IndexPath(row: index, section: 0)
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
        } else {
            if let index = itemStore.toys.firstIndex(of: newItem) {
                let indexPath = IndexPath(row: index, section: 1)
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    @IBAction func toggleEditingMode(_ sender: UIButton) {
        if isEditing {
            sender.setTitle("Edit", for: .normal)
            setEditing(false, animated: true)
        } else {
            sender.setTitle("Done", for: .normal)
            setEditing(true, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return itemStore.chihuahuas.count
        } else {
            return itemStore.toys.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        let list = indexPath.section == 0 ? itemStore.chihuahuas : itemStore.toys
        let item = list[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0) {
            return "The Pack"
        } else {
            return "Their Toys"
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let item = indexPath.section == 0 ? itemStore.chihuahuas[indexPath.row] : itemStore.toys[indexPath.row]
            itemStore.removeItem(item)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {

        if (sourceIndexPath.section != proposedDestinationIndexPath.section) || (sourceIndexPath.row == proposedDestinationIndexPath.row) {
            return sourceIndexPath
        }
        
        return proposedDestinationIndexPath
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        itemStore.moveItem(isChihuahua: sourceIndexPath.section == 0, from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
}
