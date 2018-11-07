import pedidos.*
import remeras.*
class Comercio {
	var sucursales 
	var pedidosRegistrados = sucursales.flatMap{ sucursales.pedidosRegistrados() }
	
	
	method totalFacturado() =
		pedidosRegistrados.sum{ pedido => pedido.precio() }
	
	method pedidosRealizadoDeColor(color) =
		pedidosRegistrados.count{ pedido => pedido.remera().color() == color }
		
	method pedidoMasCaro() =
		pedidosRegistrados.max{ pedido => pedido.precio() }
		
	method tallesSinPedidos(){
		var rango = new Range(32,48)
		pedidosRegistrados.filter{ pedido => !rango.contains(pedido) }
	}
	method sucursalQueMasFacturo()=
		sucursales.max{ sucursal => sucursal.totalFacturado() }

//	method vendieromTodosLosTalles(){
//		var rango = new Range(32,48)
//		sucursales.filter{ sucursal => sucursal.pedidosRegistrados(). }
//	}
}

