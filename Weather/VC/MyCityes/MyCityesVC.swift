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
    
    
    //----------------------------------------------------------------------
    //MARK: Поясним, зачем повторили все два раза. Дело в том, что эти два контроллера будут показывать города. Но один будет содержать список доступных городов, а другой — выбранных. В данный момент MyCitiesController — пустой, в нем нет городов, и надо добавить функциональность выбора.
    
    //MARK: Город будет выбираться на контроллере AllCitiesController и передаваться на MyCitiesController. Для этого используем unwind segue.
    
    //MARK: Unwind segue будет осуществлять переход с контроллера AllCitiesController обратно на MyCitiesController. Для этого установим метод-получатель. Его необходимо добавить в контроллере, на который переходим или возвращаемся (в случае с unwind segue). Откроем MyCitiesController и пропишем следующий код.
    @IBAction func addCity(segue: UIStoryboardSegue) {
        // Проверяем идентификатор перехода, чтобы убедиться, что это нужный
        if segue.identifier == "addCity" {
            // Получаем ссылку на контроллер, с которого осуществлен переход
            guard let allCityesVC = segue.source as? AllCityesVC
            else {
                return
            }
            // Получаем индекс выделенной ячейки. Она выделяется, если на нее нажать, так что ячейка с городом, на который мы кликнули, в данный момент выделена
            if let indexPath = allCityesVC.tableView.indexPathForSelectedRow {
                // Получаем город по индексу
                let city = allCityesVC.cityes[indexPath.row]
                // Проверяем, что такого города нет в списке
                if !cityes.contains(city) {
                    // Добавляем город в список выбранных
                    cityes.append(city)
                    // Обновляем таблицу
                    tableView.reloadData()
                }
            }
        }
    }
    
    
    //MARK: Теперь откроем storyboard, выберем AllCitiesController и протянем unwind segue от прототипа ячейки до иконки выхода вверху сцены. В появившейся табличке выберем Selection Segue — addCityWithSegue.
    
    //MARK: Теперь при нажатии на строку с городом будем возвращаться назад, но нам необходимо еще передать город. Так как на метод для unwind segue может быть совершено несколько переходов, надо уметь отличать один от другого. Для этого segue можно назначать идентификаторы. Выберем наш переход в инспекторе объектов и изменим атрибут identifier: напишем addCity.
    //------------------------------------------------------------------------------------------------
    
    //MARK: Когда реализовали возможность добавлять город, приступаем к созданию функции удаления.
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // Если была нажата кнопка «Удалить»
        if editingStyle == .delete {
            // Удаляем город из массива
            cityes.remove(at: indexPath.row)
            // И удаляем строку из таблицы
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    
    
    
    
}
