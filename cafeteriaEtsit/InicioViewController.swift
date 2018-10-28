//
//  InicioViewController.swift
//  cafeteriaEtsit
//
//  Created by Mario on 20/09/2018.
//  Copyright © 2018 Mario. All rights reserved.
//

import UIKit

class InicioViewController: UIViewController {

    var userDefaults = UserDefaults.standard
    @IBOutlet weak var botonEntrar: UIButton!
    @IBAction func entrarPulsado(_ sender: Any) {
        resetaUserDefaults()
        let seleccion =  self.storyboard?.instantiateViewController(withIdentifier: "Seleccion") as! SeleccionViewController
        let navigationController = UINavigationController(rootViewController:seleccion)
        
        self.show(navigationController, sender: botonEntrar)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        botonEntrar.layer.cornerRadius = 20.0
        // Do any additional setup after loading the view.
    }
    
    func resetaUserDefaults(){
        if var arrayPre = userDefaults.stringArray(forKey: "Precios"), var arrayPro = userDefaults.stringArray(forKey: "Productos"){
            arrayPro.removeAll()
            arrayPre.removeAll()
            userDefaults.set(arrayPro, forKey: "Productos")
            userDefaults.set(arrayPre, forKey: "Precios")
        }
    }
}
