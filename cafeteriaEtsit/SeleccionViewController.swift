//
//  SeleccionViewController.swift
//  cafeteriaEtsit
//
//  Created by Mario on 21/10/2018.
//  Copyright © 2018 Mario. All rights reserved.
//

import UIKit

class SeleccionViewController: UIViewController {

    @IBOutlet weak var botonPublicaciones: UIButton!
    @IBOutlet weak var botonCafeteria: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        botonPublicaciones.layer.cornerRadius = 20.0
        botonCafeteria.layer.cornerRadius = 20.0
        // Do any additional setup after loading the view.
    }

    @IBAction func cafeteriaPulsado(_ sender: Any) {
        let tabBarController = UITabBarController()
        let ticket =  self.storyboard?.instantiateViewController(withIdentifier: "Ticket") as! TicketViewController
        let categorias =  self.storyboard?.instantiateViewController(withIdentifier: "Categorias") as! CategoriasViewController
        
        let navigationController = UINavigationController(rootViewController:categorias)
        let navigationController2 = UINavigationController(rootViewController:ticket)
        let controllers = [navigationController,navigationController2]
        
        tabBarController.viewControllers = controllers
        navigationController2.tabBarItem.image = UIImage(named:"cestaCompra")
        navigationController.tabBarItem.image = UIImage(named:"listaCategorias")
        navigationController2.tabBarItem.title = "Ticket"
        navigationController.tabBarItem.title = "Categorías"
        
        tabBarController.tabBar.barTintColor = UIColor.white
        tabBarController.tabBar.tintColor = UIColor.red
        
        VariablesGlobales.publicaciones = false
        
        self.show(tabBarController, sender: botonCafeteria)
    }
    @IBAction func publicacionesPulsado(_ sender: Any) {
        let tabBarController = UITabBarController()
        let ticket =  self.storyboard?.instantiateViewController(withIdentifier: "Ticket") as! TicketViewController
        let categorias =  self.storyboard?.instantiateViewController(withIdentifier: "Categorias") as! CategoriasViewController
        let navigationController = UINavigationController(rootViewController:categorias)
        let navigationController2 = UINavigationController(rootViewController:ticket)
        let controllers = [navigationController,navigationController2]
        
        tabBarController.viewControllers = controllers
        navigationController2.tabBarItem.image = UIImage(named:"cestaCompra")
        navigationController.tabBarItem.image = UIImage(named:"listaCategorias")
        navigationController2.tabBarItem.title = "Ticket"
        navigationController.tabBarItem.title = "Categorías"
        
        tabBarController.tabBar.barTintColor = UIColor.white
        tabBarController.tabBar.tintColor = UIColor.red
        
        VariablesGlobales.publicaciones = true

        self.show(tabBarController, sender: botonPublicaciones)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
