class RemeraLisa {

	var talle //NUMERO ENTRE 32 Y 48
	var color //STRING
	
	method talle() = talle
	
	method color() = color
	
	method costoBaseTalleChico() = 80
	
	method costoBaseTalleGrande() = 100 
	//ESTE METHOD ME QUEDO MUY FEO.
	method costo(){
		if(self.esColorBasico() and self.esTalleChico()){
			return self.costoBaseTalleChico()
		}else if(self.esColorBasico() and self.esTalleGrande()){
			return self.costoBaseTalleGrande()
		}else if(not self.esColorBasico() and self.esTalleChico()){
			return self.costoBaseTalleChico() * 1.10
		}else 
			return self.costoBaseTalleGrande() * 1.10
	}
	
	method esTalleChico() = talle.between(32,40)
	  
	method esTalleGrande() = talle.between(41,48)
	
	method esColorBasico() = ["blanco","negro","gris"].contains(color)
	
	method porcentajeDescuento() = 0.10
}

class RemeraBordada inherits RemeraLisa {

	var cantColoresBordado
	
	method cantColoresBordado() = cantColoresBordado
	
	method costoBordado() {
		if (cantColoresBordado * 10 > 20){ 
			return cantColoresBordado * 10
		}else {
			return 20
		}
	}
	
	override method porcentajeDescuento() = 0.02
	
	override method costo() = super() + self.costoBordado()
	
	

}

class RemeraSublimada inherits RemeraLisa {

	var altoDibujo
	var anchoDibujo
	var empresaPropietaria //UNA EMPRESA
	
	method altoDibujo() = altoDibujo
	
	method anchoDibujo() = anchoDibujo
	
	method empresaPropietaria() = empresaPropietaria
	
	method esPropiedaDeEmpresa() = empresaPropietaria != null
	
	method cmsCuadrados() = altoDibujo * anchoDibujo
	
	method costoSublimado(){
		if(self.esPropiedaDeEmpresa()){
			return self.cmsCuadrados() * 0.5 + empresaPropietaria.derechoDeAutor()
		}else
			return self.cmsCuadrados() * 0.5
	}
		
	override method costo() = super() + self.costoSublimado()
	
	override method porcentajeDescuento(){
		if(empresaPropietaria.tieneConvenio()){
			return 0.2
		}else{
			return super()
		}	
	}
}
class Empresa {
	var property derechoDeAutor
	var property tieneConvenio
}
