//
//  CardModel.swift
//  MyNP
//
//  Created by Данила Кардашевский on 07.11.2022.
//

import Foundation
import SwiftUI

struct CardModel: Identifiable{
    
    var id = UUID().uuidString
    var colors:[Color]
    
    static let colors:[CardModel] = [
        CardModel(colors: [Color("peachColor"),Color("lightBlue")]),
        CardModel(colors: [Color("lightIndigo"),Color("lightBlue")]),
        CardModel(colors: [Color("lightGreen"),Color("lightBlue")]),
    ]
    
    
}
