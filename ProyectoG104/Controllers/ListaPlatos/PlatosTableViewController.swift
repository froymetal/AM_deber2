//
//  PlatosTableViewController.swift
//  ProyectoG104
//
//  Created by fredyM1 on 27/07/22.
//

import UIKit

class PlatosTableViewController: UITableViewController {
    var paramReceptor:String?
    var arrayPlatos:[[String:String]] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        guard let paramIdC = paramReceptor else{ return}
        cargarDatosPlatos(idC: paramIdC)
    }
    func cargarDatosPlatos(idC:String){
        let query = "select * from platos_comidas where id_categoria = '\(idC)'"
       arrayPlatos  =  DataBase.shared().ejecutarSelect(query) as! [[String:String]]
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayPlatos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaPlato", for: indexPath) as! CustomPlatoTableViewCell
        //datos
        let objPlato =  arrayPlatos[indexPath.row]
        let nombre = objPlato["nombre_plato"]
        let descripcion = objPlato["descripcion_plato"]
        let precio = objPlato["precio_plato"]
        let nombreImagen = objPlato["archivo_plato"] ?? "avatar"
        
//        cell.textLabel?.text = nombre
        cell.nombreCell.text = nombre
        cell.descripcionCell.text = descripcion
        cell.precioCell.text =  precio
        cell.imagenCell.image = UIImage(named: nombreImagen )
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("celda:",indexPath.row,indexPath.section)
        guard  let detalleObj = storyboard?.instantiateViewController(withIdentifier: "DetalleTableViewController") as? DetalleTableViewController  else {return}
        //cual objeto a seleccionado
        let objSelected = arrayPlatos[indexPath.row]
        detalleObj.paramObjetoPlato = objSelected
        self.navigationController?.pushViewController(detalleObj, animated: true)
        //present modal
//        self.present(detalleObj, animated: true)

    }
   

}
