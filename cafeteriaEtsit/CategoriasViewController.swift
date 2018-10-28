//
//  CategoriasViewController.swift
//  cafeteriaEtsit
//
//  Created by Mario on 20/09/2018.
//  Copyright © 2018 Mario. All rights reserved.
//

import UIKit

class CategoriasViewController: UIViewController, UITabBarDelegate, UITableViewDataSource {
    
    var menus =  ["Primero y segundo","2 Primeros","2 Segundos","Vegetariano","Especial"]
    var bocatasCalientes =  ["Hamburguesa","Hamburguesa Teleco","Francesa Bacon","Bacon Queso","Mixto","Mixto Huevo","Pepito de Ternera","Lomo con Queso"]
    var bocatasFrios =  ["Vegetal","Tortilla de Patatas","Chorizo","Jamon Serrano","Salchichón"]
    var bebidas =  ["Cocacola 33cl","Coca Cola 50cl","Agua 30cl","Agua 50cl","Cocacola Zero 33cl","Fanta de Naranha 33cl"]
    var alcohol =  ["Mahou 5 33cl","Mahou 5 25cl","Mahou Clásica 25cl","Mahou Clásica 33cl"]
    
    var precioMenus =  ["4.95","4.95","4.95","4.95","6.95"]
    var precioCalientes =  ["2.50","3.00","1.90","1.75","1.20","1.50","2.20","2.15"]
    var precioFrios =  ["1.50","1.40","1.20","1.35","1.20"]
    var precioBebidas =  ["0.80","1.10","0.50","0.70","0.80","0.80"]
    var precioAlcohol =  ["1.00","0.80","0.80","1.00"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController?.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    @IBOutlet weak var tableView: UITableView!
    
    // Configuracion Table View
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if VariablesGlobales.publicaciones {
            return 3
        }
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Categoria", for: indexPath) as! CategoriaTableViewCell
        cell.nombre.layer.masksToBounds = true
        cell.nombre.layer.cornerRadius = 20.0
        switch indexPath.row {
        case 0:
            if VariablesGlobales.publicaciones{
                cell.nombre.text = "IMPRESIONES"
                cell.imagen.image = UIImage(named:"imprimir")
            }else{
                cell.nombre.text = "Menús"
                cell.imagen.image = UIImage(named:"menu")
            }
            let tap = UITapGestureRecognizer(target:self, action:  #selector(self.viewPulsadaMenu(_:)))
            cell.imagen.addGestureRecognizer(tap)
            cell.imagen.isUserInteractionEnabled = true
        case 1:
            if VariablesGlobales.publicaciones{
                cell.nombre.text = "FOTOCOPIAS"
                cell.imagen.image = UIImage(named:"fotocopia")
            }else{
                cell.nombre.text = "Bocatas Calientes y Hamburguesas"
                cell.imagen.image = UIImage(named:"sandwich")
            }
            let tap = UITapGestureRecognizer(target:self, action:  #selector(self.viewPulsadaCalientes(_:)))
            cell.imagen.addGestureRecognizer(tap)
            cell.imagen.isUserInteractionEnabled = true
        case 2:
            if VariablesGlobales.publicaciones{
                cell.nombre.text = "COMPONENTES"
                cell.imagen.image = UIImage(named:"componentes")
            }else{
                cell.nombre.text = "Bocatas Fríos"
                cell.imagen.image = UIImage(named:"vegetal")
            }
            let tap = UITapGestureRecognizer(target:self, action:  #selector(self.viewPulsadaFrios(_:)))
            cell.imagen.addGestureRecognizer(tap)
            cell.imagen.isUserInteractionEnabled = true
        case 3:
            cell.nombre.text = "Refrescos y Zumos"
            cell.imagen.image = UIImage(named:"bebidas")
            let tap = UITapGestureRecognizer(target:self, action:  #selector(self.viewPulsadaBebidas(_:)))
            cell.imagen.addGestureRecognizer(tap)
            cell.imagen.isUserInteractionEnabled = true
        case 4:
            cell.nombre.text = "Bebidas Alcohólicas"
            cell.imagen.image = UIImage(named:"alcohol")
            let tap = UITapGestureRecognizer(target:self, action:  #selector(self.viewPulsadaAlcohol(_:)))
            cell.imagen.addGestureRecognizer(tap)
            cell.imagen.isUserInteractionEnabled = true
        default:
            return UITableViewCell()
        }
        
        return cell
    }
    
    @objc func viewPulsadaMenu(_ sender: UITapGestureRecognizer) {
        let productos =  self.storyboard?.instantiateViewController(withIdentifier: "Productos") as! ProductosViewController
        productos.lista = menus
        productos.precios = precioMenus
        productos.titulo = "MENÚS"
    
        self.navigationController?.pushViewController(productos, animated: true)
    }
    
    @objc func viewPulsadaCalientes(_ sender: UITapGestureRecognizer) {
        let productos =  self.storyboard?.instantiateViewController(withIdentifier: "Productos") as! ProductosViewController
        productos.lista = bocatasCalientes
        productos.precios = precioCalientes
        productos.titulo = "BOCADILLOS CALIENTES Y HAMBURGUESAS"
        
        self.navigationController?.pushViewController(productos, animated: true)
    }
    
    @objc func viewPulsadaFrios(_ sender: UITapGestureRecognizer) {
        let productos =  self.storyboard?.instantiateViewController(withIdentifier: "Productos") as! ProductosViewController
        productos.lista = bocatasFrios
        productos.precios = precioFrios
        productos.titulo = "BOCADILLOS FRÍOS"
        
        self.navigationController?.pushViewController(productos, animated: true)
    }
    
    @objc func viewPulsadaBebidas(_ sender: UITapGestureRecognizer) {
        let productos =  self.storyboard?.instantiateViewController(withIdentifier: "Productos") as! ProductosViewController
        productos.lista = bebidas
        productos.precios = precioBebidas
        productos.titulo = "BEBIDAS Y REFRESCOS"
        
        self.navigationController?.pushViewController(productos, animated: true)
    }
    
    @objc func viewPulsadaAlcohol(_ sender: UITapGestureRecognizer) {
        let productos =  self.storyboard?.instantiateViewController(withIdentifier: "Productos") as! ProductosViewController
        productos.lista = alcohol
        productos.precios = precioAlcohol
        productos.titulo = "ALCOHOL"
        self.navigationController?.pushViewController(productos, animated: true)
    }
}
