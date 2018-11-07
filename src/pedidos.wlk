class Pedido {

	var sucursal
	var remera
	var cantRemeras
	
	method sucursal() = sucursal
	
	method remera() = remera
	
	method cantRemeras() = cantRemeras
	
	method precioBase() = remera.costo() * cantRemeras

	method precio() {
		if (self.tieneDescuento()) {
			return self.precioBase() - self.descuentoAplicado()
		}else{
			return self.precioBase()
		}
	}

	method descuentoAplicado() = self.precioBase() * remera.porcentajeDescuento()
	
	method tieneDescuento() = sucursal.cantMinDescuento() >= cantRemeras	
}

class Sucursal {
	var pedidosRegistrados
	var cantMinDescuento //CANTIDAD MINIMA DE REMERAS PARA HACER DESCUENTO
	
	method pedidosRegistrados() = pedidosRegistrados
	
	method registrarPedido(unaRemera, unaCantRemeras){
		pedidosRegistrados.add(new Pedido(
			sucursal = self,
			remera = unaRemera, 
			cantRemeras = unaCantRemeras
			))
	}
	method totalFacturado() = 
		pedidosRegistrados.sum{ pedido => pedido.precio() }
}


