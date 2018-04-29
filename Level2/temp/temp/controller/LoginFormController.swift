//
//  ViewController.swift
//  temp
//
//  Created by Гюзель Маннанова on 18.03.2018.
//  Copyright © 2018 mif. All rights reserved.
//

import UIKit

class LoginFormController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
        // присваиваем его UIScrollVIew
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
        
        
        
        print("viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Подписываемся на два уведомления, одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        // Второе когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    

    @IBAction func loginButtonPressed(_ sender: Any) {
        if checkAuth() {
            print("успешная авторизация")
        } else {
            print("неуспешная авторизация")
        }
    }
    
    
    // когда клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {
        
        // получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0)
        
        // добавляем отступ внизу UIScrollView равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    //когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        // устанавливаем отступ внизу UIScrollView равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    
    //метод для возврата на этот контреллер через unwind segue
    @IBAction func myUnwindAction(​​unwindSegue: UIStoryboardSegue){
        print("myUnwindAction")
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let isUserAuthed = checkAuth()
        if !isUserAuthed {
            showPassError()
        }
        return isUserAuthed
    }
    
    func checkAuth() -> Bool {
        // получаем текст логина
        let login = loginTextField.text!
        // получаем текст пароль
        let password = passwordTextField.text!
        
        // проверяем верны ли они
        if login == "admin" && password == "123456" {
            return true
        } else {
            return false
        }
    }
    
    func showPassError() {
        let alert =  UIAlertController(title: "Error", message: "Wrong pass", preferredStyle: .alert)
        let alertOKButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(alertOKButton)
        present(alert, animated: true)
    }
    
}

