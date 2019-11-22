//
//  ListViewController.swift
//  todoapp
//
//  Created by 城間健太郎 on 2019/11/21.
//  Copyright © 2019 joma. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var todos:[Todo]=[]
    
    //一覧画面
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didClickAddButton(_ sender: UIButton) {
        performSegue(withIdentifier: "toInput", sender: nil)
    }

}

extension ListViewController: UITableViewDelegate,
UITableViewDataSource{
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return todos.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //to get cells
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    //to get a task from array to dispaly
    let todo = todos[indexPath.row]
    //to set a title
    cell.textLabel?.text = todo.title
    //to return cell
    return cell
}

