//
//  ViewController.swift
//  Calculator
//
//  Created by Павел Якупов on 23.07.2020.
//  Copyright © 2020 Павел Якупов. All rights reserved.
//

import UIKit

 class ViewController: UIViewController {
    
  
    
    @IBOutlet var holder: UIView!
    
    var firstNumber = 0
    var resultNumber = 0
    var currentOperations: Operation?
    
    enum Operation{
        case add, substract, multiply, divide
    }
    
    private var resultLabel:UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont(name: "Times New Roman", size: 60)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Здесь у нас происходит загрузка нашего view
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
        zeroButton.tag = 1
        zeroButton.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)

        holder.addSubview(zeroButton)
        
        
        //давайте дальше воспользуемся for loop, для того, что отрисовать остальные наши кнопки
        
        for x in 0..<3{
            let button1 = UIButton(frame: CGRect(x: buttonSize * CGFloat(x), y:holder.frame.size.height - (buttonSize*2), width:buttonSize , height: buttonSize ))
             button1.setTitleColor(.black, for: .normal)
             button1.backgroundColor = .white
             button1.setTitle("\(x+1)", for: .normal)
             button1.titleLabel?.font = UIFont(name: "Helvetica", size: FontSize)
             holder.addSubview(button1)
             button1.tag = x + 2
             button1.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
             
            
        }
    
        for x in 0..<3{
            let button2 = UIButton(frame: CGRect(x: buttonSize * CGFloat(x), y:holder.frame.size.height - (buttonSize*3), width:buttonSize , height: buttonSize ))
             button2.setTitleColor(.black, for: .normal)
             button2.backgroundColor = .white
             button2.setTitle("\(x+4)", for: .normal)
             button2.titleLabel?.font = UIFont(name: "Helvetica", size: FontSize)
             holder.addSubview(button2)
             button2.tag = x + 5
             button2.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        }
        
        for x in 0..<3{
            let button3 = UIButton(frame: CGRect(x: buttonSize * CGFloat(x), y:holder.frame.size.height - (buttonSize*4), width:buttonSize , height: buttonSize ))
             button3.setTitleColor(.black, for: .normal)
             button3.backgroundColor = .white
             button3.setTitle("\(x+7)", for: .normal)
            button3.titleLabel?.font = UIFont(name: "Helvetica", size: FontSize)
             holder.addSubview(button3)
            button3.tag = x + 8
            button3.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
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
            button_operand.tag = x+1
            button_operand.addTarget(self,  action: #selector(operationPressed(_:)), for: .touchUpInside )
        }
        
        
        resultLabel.frame = CGRect(x: 20, y: clearButton.frame.origin.y - 110.0, width: view.frame.size.width - 40, height: 100)
        holder.addSubview(resultLabel)
        
        //добавляем действия к нашей кнопке очистить
        clearButton.addTarget(self , action: #selector(clearResult), for: .touchUpInside)
        
    }
    
    @objc func clearResult(){
        resultLabel.text = "0"
        currentOperations = nil // в результате мы хот
        
    }
    
    @objc func numberPressed(_ sender: UIButton){
        let tag = sender.tag - 1
        
        if resultLabel.text == "0"{
            resultLabel.text = "\(tag)"
        }else if let text = resultLabel.text{
            resultLabel.text = "\(text)\(tag)"
        }
        
    }
    
    @objc func operationPressed(_ sender: UIButton){
        let tag = sender.tag
        if let text = resultLabel.text, let value = Int(text), firstNumber == 0{
             firstNumber = value
            resultLabel.text  = "0"
        }
       
        
        if tag == 1{
            if let operation = currentOperations{
                var secondNumber = 0
                if let text = resultLabel.text, let value = Int(text){
                    secondNumber = value
                }
                switch operation{
                case .add:
                    
                    let result = firstNumber  + secondNumber
                    resultLabel.text = "\(result)"
                    break
                case .substract:
                    
                    let result = firstNumber  - secondNumber
                    resultLabel.text = "\(result)"
                    break
                case .multiply:
                    
                    let result = firstNumber  * secondNumber
                    resultLabel.text = "\(result)"
                    break
                case .divide:
                    
                    let result = firstNumber  / secondNumber
                    resultLabel.text = "\(result)"
                    break
                }
            }
        }
        else if tag == 2{
            currentOperations = .add
        }
        else if tag == 3{
            currentOperations = .substract
        }
        else if tag == 4{
            currentOperations = .multiply
        }
        else if tag == 5{
            currentOperations = .divide
        }
        

        
    }
}

