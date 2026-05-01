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
	method  cosasQueSuperanElNivelDePeligrosidad(nivelPeligro){
		return cosas.filter {c=>c.nivelPeligrosidad() > nivelPeligro}
	}
	method cosasMasPeligrosasQue(unaCosa){
		return cosas.filter {c=>c.nivelPeligrosidad() > unaCosa.nivelPeligrosidad() }
	}
	method puedeCircularEnRutaConPeligroLimite(nivelPeligro){
		return (not self.tieneExcesoDePeso()) && self.cosasQueSuperanElNivelDePeligrosidad(nivelPeligro).isEmpty()
	}
	//TIENE ALGO QUE PESA ENTRE DOS VALORES. TE QUEDASTE HASTA AHI, MASO LA MITAD DEL TP
	method tieneAlgoQuePesaEntre(peso1,peso2){
		return cosas.any({c => c.peso().between(peso1,peso2)})
	}
	method laCosaMasPesada(){
		self.verificarQueHayCosas()
		return cosas.max{cosa => cosa.peso()}
	}
	method verificarQueHayCosas(){
		if (cosas.isEmpty()){
			self.error("Tenes el camion vacio che")
		}
	}
	method totalDeBultosTransportados(){
		return cosas.sum({cosas => cosas.cantidadDeBultos()})
	}
	method accidente(){
		cosas.forEach({cosa => cosa.accidente()})
	}


	method transportar(destino, camino){
		camino.verificarCamino()
		destino.almacenar()
		cosas.clear()
	}
}
	
