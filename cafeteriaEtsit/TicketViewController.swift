//
//  TicketViewController.swift
//  cafeteriaEtsit
//
//  Created by Mario on 20/09/2018.
//  Copyright © 2018 Mario. All rights reserved.
//

import UIKit

class TicketViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var imagenPagado: UIImageView!
    @IBOutlet weak var botonPagar: UIButton!
    @IBOutlet weak var botonBorrar: UIButton!
    var productoSeleccionado :  [String] =  []
    var preciosSeleccionados :  [String] =  []
    
    let userDefaults = UserDefaults.standard
    var pagado = false
    var importe = 0.00

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func borrarPulsado(_ sender: Any) {
        if productoSeleccionado.count > 0 && preciosSeleccionados.count > 0{
            muestraAlerta()
        }
    }
    
    @IBAction func pagarPulsado(_ sender: Any) {
        if productoSeleccionado.count > 0 && preciosSeleccionados.count  > 0{
            let webView =  self.storyboard?.instantiateViewController(withIdentifier: "PayPal") as! PaypalViewController
            
           webView.importe = importe
            self.navigationController?.pushViewController(webView, animated: true)
        }
   }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if pagado{
            botonPagar.alpha = 0
            botonPagar.isUserInteractionEnabled = false
            imagenPagado.alpha = 1
        }else{
            botonPagar.alpha = 1
            botonPagar.isUserInteractionEnabled = true
            imagenPagado.alpha = 0
        }
        botonPagar.layer.cornerRadius = 20.0
        botonBorrar.layer.cornerRadius = 20.0
       self.tabBarController?.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        descargarUserDefault()
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if pagado{
            botonPagar.alpha = 0
            botonPagar.isUserInteractionEnabled = false
            imagenPagado.alpha = 1
        }else{
            botonPagar.alpha = 1
            botonPagar.isUserInteractionEnabled = true
            imagenPagado.alpha = 0
        }
        self.tabBarController?.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        descargarUserDefault()
        tableView.reloadData()
    }
    
    func borraUserDefault(){
        if var arrayPro = userDefaults.stringArray(forKey: "Productos"), var arrayPre = userDefaults.stringArray(forKey: "Precios"){
            arrayPre.removeAll()
            arrayPro.removeAll()
            userDefaults.set(arrayPro, forKey: "Productos")
            userDefaults.set(arrayPre, forKey: "Precios")
        }
        productoSeleccionado.removeAll()
        preciosSeleccionados.removeAll()
    }
    
    func muestraAlerta(){
        let title = "BORRAR RECIBO"
        let message = "¿DESEA ELIMINAR ESTE RECIBO?"
        let alert =  UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let actionCancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: {(action) in
            alert.dismiss(animated: true, completion: nil)
        })
        let actionAceptar = UIAlertAction(title: "Aceptar", style: .destructive, handler: {(action) in
            self.borraUserDefault()
            self.pagado = false
            self.botonPagar.alpha = 1
            self.botonPagar.isUserInteractionEnabled = true
            self.imagenPagado.alpha = 0
            self.tableView.reloadData()
            alert.dismiss(animated: true, completion: nil)
        })
        alert.addAction(actionAceptar)
        alert.addAction(actionCancelar)
        present(alert,animated: true, completion: nil)
    }
    
    func descargarUserDefault(){
        if let array =  userDefaults.stringArray(forKey: "Productos"), let arrayP = userDefaults.stringArray(forKey: "Precios"){
                productoSeleccionado = array
                preciosSeleccionados = arrayP
        }
    }
    
    func eliminarProducto(_ precio : String, _ producto : String){
    
        let indexPrecio = preciosSeleccionados.index(of: precio)
        let indexProducto = productoSeleccionado.index(of: producto)
        preciosSeleccionados.remove(at: indexPrecio!)
        productoSeleccionado.remove(at: indexProducto!)
        userDefaults.set(preciosSeleccionados, forKey: "Precios")
        userDefaults.set(productoSeleccionado, forKey: "Productos")
        tableView.reloadData()
    }

    // Configuracion Table View
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return productoSeleccionado.count
        case 1:
            return 1
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 80
        case 1:
            return 10
        case 2:
            return 80
        default:
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Ticket", for: indexPath) as! TicketTableViewCell
            cell.producto.text = productoSeleccionado[indexPath.row]
            cell.precio.text = preciosSeleccionados[indexPath.row]
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Suma", for: indexPath)
            cell.backgroundColor = UIColor.orange
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Total", for: indexPath) as! TotalTableViewCell
            var total = 0.00
            if preciosSeleccionados.count > 0 {
            for precio in preciosSeleccionados {
                total += Double(precio)!
                }
            }
            cell.textoTotal.text = "Total:"
            cell.importeTotal.text = "\(total)"
            importe = total
            return cell
        default:
            return UITableViewCell()
        }
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && !pagado{
            eliminarProducto(preciosSeleccionados[indexPath.row], productoSeleccionado[indexPath.row])
        }
    }
}
