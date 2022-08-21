//
//  ViewController.swift
//  someproject2
//
//  Created by Даша Волошина on 21.08.22.
//3. Будем проектировать интерфейс. Для расставленная элементов используем AutoLayout. Сделаем джойстик в контейнере (UIView) и кнопку. По нажатию на кнопку удаляем джойстик с экрана и удаляем его из памяти. При следующем нажатии на кнопку создаем джойстик и показываем его на экран.


import UIKit

class View:UIView {
//   weak var newView: UIView!
//    init(newView:UIView) {
//        self.newView = newView
//    }
    deinit {
        print ("game over")
    }
}

import UIKit

class ViewController: UIViewController {
    let button = UIButton(frame: CGRect(x: 0, y: 100, width: 60, height: 30))
    var view1:View? = View(frame: CGRect(x: 0, y: 0, width: 400, height: 400))

    var view2 = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
    let buttonUp = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
    let buttonDown = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
    let buttonLeft = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
    let buttonRight = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
   
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.addSubview(view1!)
        view1! .backgroundColor = .orange
        view1!.center = view.center
        view1!.addSubview(buttonUp)
        view1!.addSubview(buttonDown)
        view1!.addSubview(buttonLeft)
        view1!.addSubview(buttonRight)
        view.addSubview(button)
        view2.backgroundColor = .yellow
        view2.center = view.center
        
        button.backgroundColor = .systemIndigo
        button.center.x = view.center.x
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        
        buttonUp.backgroundColor = .purple
        buttonDown.backgroundColor = .purple
        buttonLeft.backgroundColor = .purple
        buttonRight.backgroundColor = .purple
        
        buttonUp.translatesAutoresizingMaskIntoConstraints = false
        buttonUp.centerXAnchor.constraint(equalTo:view1!.centerXAnchor).isActive =  true
        buttonUp.topAnchor.constraint(equalTo: view1!.topAnchor, constant: 20).isActive = true
        buttonUp.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        buttonDown.translatesAutoresizingMaskIntoConstraints = false
        buttonDown.centerXAnchor.constraint(equalTo:view1!.centerXAnchor).isActive =  true
        buttonDown.bottomAnchor.constraint(equalTo: view1!.bottomAnchor, constant: -20).isActive = true
        buttonDown.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        buttonLeft.translatesAutoresizingMaskIntoConstraints = false
        buttonLeft.centerYAnchor.constraint(equalTo: view1!.centerYAnchor).isActive =  true
        buttonLeft.leftAnchor.constraint(equalTo:view1!.leftAnchor, constant: 20).isActive = true
        buttonLeft.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        buttonRight.translatesAutoresizingMaskIntoConstraints = false
        buttonRight.centerYAnchor.constraint(equalTo: view1!.centerYAnchor).isActive =  true
        buttonRight.rightAnchor.constraint(equalTo: view1!.rightAnchor, constant: -20).isActive = true
        buttonRight.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
    }

   
    @objc func buttonTap(_ sender:UIButton){

      if  view1 != nil {
          view1?.removeFromSuperview()
          view1 = nil
         
      } else{
          view.addSubview(view1 ?? view2)
      }
      

          }
}




  
    


