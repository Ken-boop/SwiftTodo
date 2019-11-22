//
//  Todo.swift
//  todoapp
//
//  Created by 城間健太郎 on 2019/11/21.
//  Copyright © 2019 joma. All rights reserved.
//

import RealmSwift

//Todoの設計図
//Realmに保存するために、Object というのを継承(拡張)する
//Object is from RealmSwift
class Todo: Object {
    
    //各タスクのID
    @objc dynamic var id: Int = 0
    //タスクのタイトル
    @objc dynamic var title: String = ""
    //タスクの作成び
    @objc dynamic var date: Date = Date()
}
