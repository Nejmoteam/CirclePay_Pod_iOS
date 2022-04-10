//
//  Items.swift
//  Alamofire
//
//  Created by apple on 08/04/2022.
//

import Foundation

public class Items: NSObject {
    var itemDescription:String
    var itemnName:String
    var itemPrice:Double
    var itemQuantity:Int
    
   public init(itemDescription:String, itemnName:String, itemPrice:Double, itemQuantity:Int ) {
        self.itemDescription = itemDescription
        self.itemnName = itemnName
        self.itemPrice = itemPrice
        self.itemQuantity = itemQuantity
    }
}
