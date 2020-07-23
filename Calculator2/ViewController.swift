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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        setupNumberPad()
    }
    private func setupNumberPad(){
        // здесь у нас будет функция создания наших кнопок
        // каждая из которых занимает около четверти размера
        let buttonSize:CGFloat = view.frame.size.width / 4
        
        let zeroButton = UIButton(frame: CGRect(x: 0, y:holder.frame.size.height - buttonSize, width:buttonSize * 3, height: buttonSize ))
        zeroButton.setTitleColor(.black, for: .normal)
        zeroButton.backgroundColor = .white
        zeroButton.setTitle("0", for: .normal)
        holder.addSubview(zeroButton)
        
        
        //давайте дальше воспользуемся for loop, для того, что отрисовать остальные наши кнопки
        
        for x in 0..<3{
            let button1 = UIButton(frame: CGRect(x: buttonSize * CGFloat(x), y:holder.frame.size.height - (buttonSize*2), width:buttonSize , height: buttonSize ))
             button1.setTitleColor(.black, for: .normal)
             button1.backgroundColor = .white
             button1.setTitle("\(x+1)", for: .normal)
             holder.addSubview(button1)
             
            
        }
    
        for x in 0..<3{
            let button2 = UIButton(frame: CGRect(x: buttonSize * CGFloat(x), y:holder.frame.size.height - (buttonSize*3), width:buttonSize , height: buttonSize ))
             button2.setTitleColor(.black, for: .normal)
             button2.backgroundColor = .white
             button2.setTitle("\(x+4)", for: .normal)
             holder.addSubview(button2)
        }
        
        for x in 0..<3{
            let button3 = UIButton(frame: CGRect(x: buttonSize * CGFloat(x), y:holder.frame.size.height - (buttonSize*4), width:buttonSize , height: buttonSize ))
             button3.setTitleColor(.black, for: .normal)
             button3.backgroundColor = .white
             button3.setTitle("\(x+7)", for: .normal)
             holder.addSubview(button3)
        }
        //дальше давайте сделаем клавишу, которая у нас будет все выключать, если что:
        let clearButton = UIButton(frame: CGRect(x: 0, y:holder.frame.size.height - (buttonSize*5), width:view.frame.size.height , height: buttonSize ))
         clearButton.setTitleColor(.black, for: .normal)
         clearButton.backgroundColor = .white
         clearButton.setTitle("Clear button", for: .normal)
         holder.addSubview(clearButton)

          let operations = ["+", "-", "*", "÷"]
        
        for x in 0..<4{
            let button4 = UIButton(frame: CGRect(x: buttonSize * 3, y:holder.frame.size.height - (buttonSize*CGFloat(x+1)), width:buttonSize , height: buttonSize ))
             button4.setTitleColor(.white, for: .normal)
            button4.backgroundColor = .purple
             button4.setTitle(operations[x], for: .normal)
             holder.addSubview(button4)
        }
    }
    
  
    


}

