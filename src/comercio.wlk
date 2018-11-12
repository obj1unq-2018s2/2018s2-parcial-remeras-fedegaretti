import pedidos.*
import remeras.*
class Comercio {
	var sucursales 

	method pedidosRegistrados() = sucursales.flatMap{ sucursales.pedidosRegistrados() }
	
	method totalFacturado() =
		self.pedidosRegistrados().sum{ pedido => pedido.precio() }
	
	method pedidosRealizadoDeColor(color) =
		self.pedidosRegistrados().count{ pedido => pedido.remera().color() == color }
		
	method pedidoMasCaro() =
		self.pedidosRegistrados().max{ pedido => pedido.precio() }
		
	method tallesSinPedidos(){
		// TODO Esto no hace lo que pide el enunciado, no cumple el objetivo.
		var rango = new Range(32,48)
		self.pedidosRegistrados().filter{ pedido => !rango.contains(pedido) }
	}
	method sucursalQueMasFacturo()=
		sucursales.max{ sucursal => sucursal.totalFacturado() }

}

