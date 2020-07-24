//
//  ViewController.swift
//  Calculator2
//
//  Created by Павел Якупов on 23.07.2020.
//  Copyright © 2020 Павел Якупов. All rights reserved.
//

import UIKit

 class ViewController: UIViewController {
    
  
    
    @IBOutlet var holder: UIView!
    private var resultLabel:UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont(name: "Times New Roman", size: 80)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        setupNumberPad()
    }
    private func setupNumberPad(){
        let  FontSize:CGFloat = 25
        // здесь у нас будет функция создания наших кнопок
        // каждая из которых занимает около четверти размера
        let buttonSize:CGFloat = view.frame.size.width / 4
        
        let zeroButton = UIButton(frame: CGRect(x: 0, y:holder.frame.size.height - buttonSize, width:buttonSize * 3, height: buttonSize ))
        zeroButton.setTitleColor(.black, for: .normal)
        zeroButton.backgroundColor = .white
        zeroButton.setTitle("0", for: .normal)
        zeroButton.titleLabel?.font = UIFont(name: "Helvetica", size: FontSize)
        holder.addSubview(zeroButton)
        
        
        //давайте дальше воспользуемся for loop, для того, что отрисовать остальные наши кнопки
        
        for x in 0..<3{
            let button1 = UIButton(frame: CGRect(x: buttonSize * CGFloat(x), y:holder.frame.size.height - (buttonSize*2), width:buttonSize , height: buttonSize ))
             button1.setTitleColor(.black, for: .normal)
             button1.backgroundColor = .white
             button1.setTitle("\(x+1)", for: .normal)
             button1.titleLabel?.font = UIFont(name: "Helvetica", size: FontSize)
             holder.addSubview(button1)
             
            
        }
    
        for x in 0..<3{
            let button2 = UIButton(frame: CGRect(x: buttonSize * CGFloat(x), y:holder.frame.size.height - (buttonSize*3), width:buttonSize , height: buttonSize ))
             button2.setTitleColor(.black, for: .normal)
             button2.backgroundColor = .white
             button2.setTitle("\(x+4)", for: .normal)
             button2.titleLabel?.font = UIFont(name: "Helvetica", size: FontSize)
             holder.addSubview(button2)
        }
        
        for x in 0..<3{
            let button3 = UIButton(frame: CGRect(x: buttonSize * CGFloat(x), y:holder.frame.size.height - (buttonSize*4), width:buttonSize , height: buttonSize ))
             button3.setTitleColor(.black, for: .normal)
             button3.backgroundColor = .white
             button3.setTitle("\(x+7)", for: .normal)
            button3.titleLabel?.font = UIFont(name: "Helvetica", size: FontSize)
             holder.addSubview(button3)
        }
        //дальше давайте сделаем клавишу, которая у нас будет все выключать, если что:
        let clearButton = UIButton(frame: CGRect(x: 0, y:holder.frame.size.height - (buttonSize*5), width:view.frame.size.width - buttonSize , height: buttonSize ))
         clearButton.setTitleColor(.white, for: .normal)
         clearButton.backgroundColor = .blue
         clearButton.setTitle("Очистить", for: .normal)
         clearButton.titleLabel?.font = UIFont(name: "Helvetica", size: FontSize)
         holder.addSubview(clearButton)

          let operations = ["= ","+", "-", "*", "÷"]
        
        for x in 0..<5{
            let button_operand = UIButton(frame: CGRect(x: buttonSize * 3, y:holder.frame.size.height - (buttonSize*CGFloat(x+1)), width:buttonSize , height: buttonSize ))
             button_operand.setTitleColor(.white, for: .normal)
            button_operand.backgroundColor = .purple
             button_operand.setTitle(operations[x], for: .normal)
            button_operand.titleLabel?.font = UIFont(name: "Helvetica", size: FontSize+3)
             holder.addSubview(button_operand)
        }
        
        
        resultLabel.frame = CGRect(x: 20, y: clearButton.frame.origin.y - 110.0, width: view.frame.size.width - 40, height: 100)
        holder.addSubview(resultLabel)
        
        //добавляем действия к нашей кнопке очистить
        clearButton.addTarget(self , action: #selector(clearResult), for: .touchUpInside)
        
    }
    
    @objc func clearResult(){
        resultLabel.text = "0"
    }
}

