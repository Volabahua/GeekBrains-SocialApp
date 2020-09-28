//
//  ViewController.swift
//  SocialApp
//
//  Created by Владимир Лабахуа on 27.09.2020.
//

import UIKit

class ViewController: UIViewController {
   //Объявляем скроллер для вложенного контента
    @IBOutlet weak var scroller: UIScrollView!
    // Когда клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {
        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scroller?.contentInset = contentInsets
        scroller?.scrollIndicatorInsets = contentInsets
    }
    //Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scroller?.contentInset = contentInsets
    }
    
    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
            NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
            // Второе — когда она пропадает
            NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    
    @objc func hideKeyboard() {
            self.scroller?.endEditing(true)
        }

    // Текстовое поле логина
    @IBOutlet weak var loginInput: UITextField!
    // Текстовое поле пароля
    @IBOutlet weak var passwordInput: UITextField!
   
    
    override func viewDidLoad() {
            super.viewDidLoad()
            // Жест нажатия
            let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
            // Присваиваем его UIScrollVIew
            scroller?.addGestureRecognizer(hideKeyboardGesture)
        }
    
    
    // Переход к приложению при правильно указанном логине и пароле
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
        
    // Сравниваем введенные данные с теми что указаны тут
        func checkUserData() -> Bool {
            guard let login = loginInput.text,
                let password = passwordInput.text else { return false }
            if login == "q" && password == "q" {
                return true
            } else {
                return false
            }
        }
        
    // Показываем уведомление при неправильном вводе пароля
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

    // Нажатие на кнопку "Вход"
    @IBAction func loginButtomPressed(_ sender: Any){
        
    }
    
}
