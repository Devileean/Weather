//
//  AllCityesVC.swift
//  Weather
//
//  Created by Алексей Логинов on 17.12.2021.
//

import UIKit

class AllCityesVC: UITableViewController {
    
    
    
    var cityes = [
        "Moscow",
        "Krasnoyarsk",
        "London",
        "Paris",
        "Saint-Petersburg",
        "Dubai",
        "Sidney",
        "Tokyo"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    //MARK: Изменим метод tableView(_ tableView: UITableView, numberOfRowsInSection section: Int). Здесь уже не будем возвращать определенное число. Так как отображаем данные из массива, вернем количество данных в нем.
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cityes.count
        
    }
    //MARK: Осталось разобраться с возвратом ячеек для строки. Вернемся на storyboard и добавим прототипу ячейки идентификатор.
    //----------------------------------------------------------------
    
    //MARK: Займемся методом func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell.  Добавим приведение типа ячейки, извлекаемой из пула, к классу AllCitiesCell. Получим город из массива, используя номер строки как индекс массива. Присвоим название города свойству text для надписи в ячейке.
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Получаем ячейку из пула
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllCityes", for: indexPath) as! AllCityesCell
        // Получаем город для конкретной строки
        let city = cityes[indexPath.row]
        
        // Устанавливаем город в надпись ячейки
        cell.cityesName.text = city
        
        return cell
    }
    
}
