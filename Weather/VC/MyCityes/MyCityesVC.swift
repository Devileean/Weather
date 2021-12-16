//
//  MyCityesVC.swift
//  Weather
//
//  Created by Алексей Логинов on 17.12.2021.
//

import UIKit

class MyCityesVC: UITableViewController {
    var cityes = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityes.count
    }
    
    //----------------------------------------------------------------
    
    //MARK: Займемся методом func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell.  Добавим приведение типа ячейки, извлекаемой из пула, к классу AllCitiesCell. Получим город из массива, используя номер строки как индекс массива. Присвоим название города свойству text для надписи в ячейке.
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Получаем ячейку из пула
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCityes", for: indexPath) as! MyCityesCell
        // Получаем город для конкретной строки
        let city = cityes[indexPath.row]
        
        // Устанавливаем город в надпись ячейки
        cell.myCityesName.text = city
        
        return cell
    }
}
