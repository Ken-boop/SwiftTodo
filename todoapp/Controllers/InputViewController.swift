//
//  InputViewController.swift
//  todoapp
//
//  Created by 城間健太郎 on 2019/11/21.
//  Copyright © 2019 joma. All rights reserved.
//

import UIKit
import RealmSwift

class InputViewController: UIViewController {


    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func didClickButton(_ sender: UIButton) {
        //タスクが入力されているかチェック
        guard let inputTitle = textField.text else {
            //textField.textがnilの場合
            //return:このメソッド(didClickButtonが実行される)
            return
        }
        
        if inputTitle == ""{
            //画面で何も入力されていない場合
            return //処理を終了する
        }
        //Realmに保存する
        //1 Realmに接続する
        let realm = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        //2 新規タスクを作成して、項目を埋める
        let todo =  Todo()
        todo.title = inputTitle
        todo.date = Date() //現時刻
        //2.1 現在あるIDの最大値 +1の値を取得する
        let id = (realm.objects(Todo.self).max(ofProperty: "id")as Int? ?? 0) + 1
        
        todo.id = id
        //3 Realmに新規タスクを書き込む
        try! realm.write {
            realm.add(todo)
        }
        //前の画面に戻る
        navigationController?.popViewController(animated: true)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
