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
        return 0
    }
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"PedidoTableViewCell", for: indexPath)
        let pedidoCell = cell as! PedidoTableViewCell
        
//        let detalle = D
//        pedidoCell.detalle = detalle
        
        return pedidoCell
    }
}
