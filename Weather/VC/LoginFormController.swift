//
//  LoginFormController.swift
//  Weather
//
//  Created by Алексей Логинов on 22.11.2021.
//

import UIKit

class LoginFormController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    //DidLoad - загрузилось
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        // Присваиваем его UIScrollVIew
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
    


    }
    
//-----------------------------------------------------------------------------------------------------------------------------------
    //MARK: Добавим два метода: один будем вызывать, когда клавиатура появляется, второй — когда исчезает. В этих методах получим размер клавиатуры и увеличим внутренний размер UIScrollview, получив прокрутку.
    
    // Когда клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {
        
        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    //Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }
//-----------------------------------------------------------------------------------------------------------------------------------
    
    //MARK: Теперь надо подписаться на сообщения из центра уведомлений, которые рассылает клавиатура:
    //WillAppear - будет отображено
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
            NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
            // Второе — когда она пропадает
            NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        }
//-----------------------------------------------------------------------------------------------------------------------------------
    
    //MARK: А сейчас отметим, что от уведомлений надо отписываться, когда они не нужны. Добавим метод отписки при исчезновении контроллера с экрана.
    //WillDisappear - будет убрано
    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        }
//-----------------------------------------------------------------------------------------------------------------------------------
    //MARK: Осталось еще одно дело с клавиатурой. В альбомной ориентации есть кнопка «Свернуть клавиатуру», в портретной — нет. Добавим исчезновение клавиатуры при клике по пустому месту на экране и метод, который будет вызываться при клике.
    
    @objc func hideKeyboard() {
            self.scrollView?.endEditing(true)
        }
    //MARK: И добавим жест нажатия к UIScrollView: В методе viewDidLoad
    // Жест нажатия
    //let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
    // Присваиваем его UIScrollVIew
    //scrollView?.addGestureRecognizer(hideKeyboardGesture)
    //}
//-----------------------------------------------------------------------------------------------------------------------------------
    //MARK: На этом пока интерфейс закончен.

    
    
//-----------------------------------------------------------------------------------------------------------------------------------
    //MARK: Напишем логику авторизации в метод нажатия кнопки:

    
    @IBAction func loginButtomPressed(_ sender: Any) {
        // Получаем текст логина
        let login = loginInput.text!
        // Получаем текст-пароль
        let password = passwordInput.text!
        
        // Проверяем, верны ли они
        if login == "1" && password == "1" {
            print("успешная авторизация")
        } else {
            print("неуспешная авторизация")
        }

    }

    //MARK: Добавляем проверку. Чтобы подтвердить или отменить переход, в UIViewController.
    //Прежде чем совершить переход, UIKit вызовет метод shouldPerformSegue. Если метод вернет true, переход выполнится, а если false — будет отменен. Проверяем введенные пользователем данные: если они верны — возвращаем true, в противном случае — false.
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
            // Проверяем данные
            let checkResult = checkUserData()
            
            // Если данные не верны, покажем ошибку
            if !checkResult {
                showLoginError()
            }
            
            // Вернем результат
            return checkResult
        }
        
        func checkUserData() -> Bool {
            guard let login = loginInput.text,
                let password = passwordInput.text else { return false }
            
            if login == "1" && password == "1" {
                return true
            } else {
                return false
            }
        }
        
        func showLoginError() {
            // Создаем контроллер
            let alter = UIAlertController(title: "Ошибка", message: "Введены не верные данные пользователя", preferredStyle: .alert)
            // Создаем кнопку для UIAlertController
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            // Добавляем кнопку на UIAlertController
            alter.addAction(action)
            // Показываем UIAlertController
            present(alter, animated: true, completion: nil)
        }


    }

