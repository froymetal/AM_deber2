//
//  MenuViewController.swift
//  ProyectoG104
//
//  Created by fredyM1 on 27/07/22.
//

import UIKit

class MenuViewController: UIViewController {
    var arrayCategorias:[[String:String]] = []
    @IBOutlet weak var menuTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableView.reloadData()
        // Do any additional setup after loading the view.
        cargaDeDatos()
    }
    func cargaDeDatos(){
       arrayCategorias = DataBase.shared().ejecutarSelect("select * from categoria_platos") as! [[String:String]]
        print("array:",arrayCategorias)
    }
    
   
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPathSeleccionado = menuTableView.indexPathForSelectedRow {
        let objPlatos = segue.destination  as! PlatosTableViewController
            let objSelectedId = arrayCategorias[indexPathSeleccionado.row]["id_categoria"]
            objPlatos.paramReceptor = objSelectedId
            
        }
    }
}
extension MenuViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCategorias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaMenu", for: indexPath) as! MenuTableViewCell
       
        //datos
        let objCategoria =  arrayCategorias[indexPath.row]
        let nombreCategoria = objCategoria["nombre_categoria"]
        
        //cell
//        cell.textLabel?.text = nombreCategoria
        cell.nombreCategoriaCell.text = nombreCategoria
        return cell
    }
    
    
    
    
}
