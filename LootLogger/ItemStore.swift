//
//  ItemStore.swift
//  LootLogger
//
//  Created by Sarah Mogin on 2/14/23.
//

import UIKit

class ItemStore {
    var chihuahuas = [Item]()
    var toys = [Item]()
    
    @discardableResult func createItem() -> Item {
        let newItem = Item()
        if newItem.isChihuahua() {
            chihuahuas.append(newItem)
        } else {
            toys.append(newItem)
        }

        return newItem
    }
    
    func removeItem(_ item: Item) {
        if item.isChihuahua() {
            if let index = chihuahuas.firstIndex(of: item) {
                chihuahuas.remove(at: index)
            }
        } else {
            if let index = toys.firstIndex(of: item) {
                toys.remove(at: index)
            }
        }
    }

    func moveItem(isChihuahua: Bool, from fromIndex: Int, to toIndex: Int) {
        if isChihuahua {
            let movedItem = chihuahuas[fromIndex]
            chihuahuas.remove(at: fromIndex)
            chihuahuas.insert(movedItem, at: toIndex)
        } else {
            let movedItem = toys[fromIndex]
            toys.remove(at: fromIndex)
            toys.insert(movedItem, at: toIndex)
        }

    }
}
