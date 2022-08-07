//
//  PedidosViewController.swift
//  G102ProyectoCursoiOS
//
//  Created by Fredy asencios on 21/04/22.
//

import UIKit
import KeychainSwift

class PedidosViewController: UIViewController {
    var arrayPedidos:[[String:String]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        cargarDatosPedidos()
        // Do any additional setup after loading the view.
    }
    func cargarDatosPedidos(){
        let query = "select * from pedidos"
        arrayPedidos  =  DataBase.shared().ejecutarSelect(query) as! [[String:String]]
    }
    override func viewWillAppear(_ animated: Bool) {
        let token = KeychainSwift().get("tokenRec")
        if token != "" {
            print("ya token o sesion ")
        }
    }

    
    @IBAction func realizarPedido(_ sender: Any) {
        let token = KeychainSwift().get("tokenRec")
        if token != "" {
            print("ya hay token o sesion ya no pide login  ")
            self.navigationController?.popToRootViewController(animated: true)
        }else{
            performSegue(withIdentifier: "toLogin", sender: self)
        }
    }
}

// MARK: - UITableViewDataSource
extension PedidosViewController: UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayPedidos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier:"PedidoTableViewCell", for: indexPath)
        let pedidoCell = cell as! PedidoTableViewCell
        
        //datos
        let objPlato = arrayPedidos[indexPath.row]
        let plato_nombre = objPlato["plato_nombre"]
        let cantidad = objPlato["cantidad"]
        let plato_precio = objPlato["plato_precio"]
        let totalPlato = ((Float(cantidad ?? "0") ?? 0)) * (Float(plato_precio ?? "0") ?? 0)
        
//        cell.textLabel?.text = nombre
        pedidoCell.cantidadLabel.text = cantidad
        pedidoCell.platoLabel.text = plato_nombre
        pedidoCell.precioUnitarioLabel.text =  plato_precio
        pedidoCell.precioTotalLabel.text = String(format: "%.2f", totalPlato )
        
        return pedidoCell
    }
}
