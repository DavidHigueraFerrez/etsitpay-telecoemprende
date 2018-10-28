//
//  ProductosViewController.swift
//  cafeteriaEtsit
//
//  Created by Mario on 22/09/2018.
//  Copyright © 2018 Mario. All rights reserved.
//

import UIKit

class ProductosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var lista : [String] = []
    var precios :  [String] = []
    var titulo = ""
    let userDefaults = UserDefaults.standard
    
    @IBOutlet weak var tituloLista: UILabel?
    
   

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tituloLista?.text = titulo
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.tabBarController?.navigationController?.setNavigationBarHidden(true, animated: true)

        // Do any additional setup after loading the view.
    }
    
    // Configuracion Table View
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lista.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Producto", for: indexPath) as! ProductosTableViewCell
   
        cell.nombreProducto.text = lista[indexPath.row]
        cell.precioProducto.text = precios [indexPath.row]
        cell.añadirBoton.layer.cornerRadius = 25.0
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        añadeProductoRecibo(precios [indexPath.row], lista[indexPath.row])
        self.tabBarController?.selectedViewController = self.tabBarController?.viewControllers![1]
    }
    
    func añadeProductoRecibo(_ precio : String, _ producto : String) {
        if var arrayP = userDefaults.stringArray(forKey: "Productos"), var arrayPrecio = userDefaults.stringArray(forKey: "Precios"){
            arrayP.append(producto)
            arrayPrecio.append(precio)
            userDefaults.set(arrayPrecio, forKey: "Precios")
            userDefaults.set(arrayP, forKey: "Productos")
        }else{
            let precios = [precio]
            let productos = [producto]
            userDefaults.set(precios,forKey: "Precios")
            userDefaults.set(productos,forKey: "Productos")
        }
    }
}
