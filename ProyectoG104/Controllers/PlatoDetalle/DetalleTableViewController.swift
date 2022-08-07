//
//  DetalleTableViewController.swift
//  ProyectoG104
//
//  Created by fredyM1 on 1/08/22.
//

import UIKit
let COLOR = UIColor(red: 0.76, green: 0.04, blue: 0.10, alpha: 1.00)


class DetalleTableViewController: UITableViewController {
    @IBOutlet var contedorDialogo: UIView!
    var paramObjetoPlato:[String:String]?
    
    @IBOutlet weak var btnPreferidos: UIButton!
    @IBOutlet weak var btnOrdenar: UIButton!
    @IBOutlet var fondoBlur: UIVisualEffectView!
    @IBOutlet weak var imageDetalle: UIImageView!
    @IBOutlet weak var precionDetalle: UILabel!
    @IBOutlet weak var nombreDetalle: UILabel!
    @IBOutlet weak var descripcionDetalle: UILabel!
    
    @IBOutlet weak var cantidadLbl: UILabel!
    var cantidad = 1
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //recuperar el id desde el objeto
        print("plato:",paramObjetoPlato)
       
        //se consulta a la base de datos para traer los datos del plato
        mostrandoDatos()
        //
        btnPreferidos.backgroundColor = COLOR
        btnOrdenar.backgroundColor = COLOR
        
    }
    func mostrandoDatos(){
        guard  let plato = paramObjetoPlato else {return}
//        let platoId = plato["id_plato"]
        let imagePlato = plato["archivo_plato"] ?? ""
        imageDetalle.image = UIImage(named:imagePlato )
        let nombrePlato = plato["nombre_plato"]
        nombreDetalle.text =  nombrePlato
        let descripcion = plato["descripcion_plato"]
        descripcionDetalle.text = descripcion
    }
    @IBAction func logicaCantidad(_ sender: Any) {
        let btn = sender as! UIButton
        if  btn.tag == 0 {
            //restar
            if cantidad > 1 {
                cantidad -= 1
            }
        }
        if  btn.tag == 1 {
            //suma
            cantidad += 1
        }
        cantidadLbl.text = "\(cantidad)"
        print("cantidad:",cantidad)
    }
    
    @IBAction func agregandoPreferidos(_ sender: Any) {
    }
    @IBAction func agregandoCarrito(_ sender: Any) {
        let anchoScreen = UIScreen.main.bounds.width
        let altoScreen = UIScreen.main.bounds.height
        
        fondoBlur.frame = CGRect(x: 0, y: 0, width: anchoScreen, height: altoScreen)
        fondoBlur.alpha = 0.5
        self.tableView.addSubview(fondoBlur)
        
        print("ancho,alto:",anchoScreen,altoScreen)
        contedorDialogo.layer.position =  CGPoint(x: anchoScreen/2, y: altoScreen/2 - 200)
        self.tableView.addSubview(contedorDialogo)
        
    }
    
    @IBAction func AgregandoItem(_ sender: Any) {
        // insert a la tabla con los datos de orden, plato_id, nombre_plato, cantidad
        guard  let plato = paramObjetoPlato else {return}
        let platoId = plato["id_plato"] ?? ""
        let platoPrecio = plato["precio_plato"] ?? ""
        let nombrePlato = plato["nombre_plato"] ?? ""
        
      
        
        let queryInsert = "INSERT INTO pedidos (plato_id, plato_nombre, cantidad, plato_precio) VALUES ('\(platoId)', '\(nombrePlato)', '\(cantidad)', '\(platoPrecio)')"
//        DataBase.shared().ejecutarInsert(queryInsert)
        performSegue(withIdentifier: "seguePedidos", sender: nil)
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("")
//        contedorDialogo.removeFromSuperview()
//        fondoBlur.removeFromSuperview()
//
//    }
}

