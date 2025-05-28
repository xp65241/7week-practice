//
//  ItemModel.swift
//  8weekLab
//
//  Created by 김성민 on 5/25/25.
//

import UIKit

struct ItemModel {
    let data: String
}

extension ItemModel {
    static func Info1() -> [ItemModel] {
        return [
            ItemModel(data: "아침"),
            ItemModel(data: "08:00"),
            ItemModel(data: "09:30"),
            ItemModel(data: "점심"),
            ItemModel(data: "11:30"),
            ItemModel(data: "13:30"),
            ItemModel(data: "저녁"),
            ItemModel(data: "17:00"),
            ItemModel(data: "09:30"),
        ]
    }
}

extension ItemModel {
    static func Info2() -> [ItemModel] {
        return [
            ItemModel(data: "아침"),
            ItemModel(data: "미운영"),
            ItemModel(data: "미운영"),
            ItemModel(data: "점심"),
            ItemModel(data: "11:30"),
            ItemModel(data: "13:00"),
            ItemModel(data: "저녁"),
            ItemModel(data: "17:30"),
            ItemModel(data: "18:30"),
        ]
    }
}

struct HeaderModel {
    let data1: String
    let data2: String
    let data3: String
}

extension HeaderModel {
    static var defaultHeader: HeaderModel {
        return HeaderModel(data1: "시간", data2: "시작시간", data3: "마감시간")
    }
}
