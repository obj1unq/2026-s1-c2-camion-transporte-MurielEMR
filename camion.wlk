import cosas.*

object camion {
	const property cosas = #{}

	method cargar(unaCosa) {
		self.verificarCarga(unaCosa)
		cosas.add(unaCosa)
	}
	method descargar(unaCosa){
		self.verificarDescarga(unaCosa)
		cosas.remove(unaCosa)
	}
	method verificarCarga(unaCosa){
		if (self.estaEnCosas(unaCosa)){
			self.error("Ya esta en el carrito pà")
		}
	}
	method verificarDescarga(unaCosa){
		if (not (self.estaEnCosas(unaCosa))){
			self.error("Se te cayo del camion")
		}
	}
	method estaEnCosas(unaCosa){
		return cosas.contains(unaCosa) 
	}

	method todosPar(){
		return self.pesoDeTodasLasCosas().all{n => n.even()}
	}

	method pesoDeTodasLasCosas(){
		return cosas.map{cosa => cosa.peso()}
	}
	
	
	method tengoUnaCosaQuePesa(peso){
		return self.cosasConElPeso(peso).size()>0
	}
		//return cosas.any{cosa => cosa.peso()==peso}
	method cosasConElPeso(peso){
		return cosas.filter {c => c.peso() == peso}
	}
	method peso(){
		return 1000 + self.pesoTotalDeCosas()
	}
	method pesoTotalDeCosas(){
		return self.pesoDeTodasLasCosas().sum()
	}
	//return cosas.sum{c => c.peso()}

	method tieneExcesoDePeso(){
		return self.peso() > 2500
	}
	method cosaConPeligro(nivelPeligro){
		return cosas.find {c=>c.nivelPeligrosidad() == nivelPeligro}
	}
	
	method tengoUnaCosaConPeligroMayorA(nivelPeligro){
		return cosas.any{c => c.nivelPeligrosidad()>nivelPeligro}
	}


}
