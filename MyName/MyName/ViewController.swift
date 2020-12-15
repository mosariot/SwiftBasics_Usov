//
//  ViewController.swift
//  MyName
//
//  Created by Александр Воробьев on 16.02.2020.
//  Copyright © 2020 Alex Vorobev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBAction func changeLabelText(_ sender: UIButton) {
        label.text = ("The \(sender.titleLabel!.text!.lowercased()) button was pressed")
    }
    @IBAction func showMessage() -> Void {
        let alertController = UIAlertController(
            title: "Welcome to MyName App",
            message: "Alexandr Vorobev",
            preferredStyle: UIAlertController.Style.alert)
        // добавляем кнопки к всплывающему сообщению
        alertController.addAction(UIAlertAction(title: "First", style: UIAlertAction.Style.default, handler: nil))
        alertController.addAction(UIAlertAction(title: "Second", style: UIAlertAction.Style.default, handler: nil))
        // вывод всплывающего окна
        self.present(alertController, animated: true, completion: nil)
    }
}
