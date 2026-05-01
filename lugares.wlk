import camion.*
import cosas.*

object almacen {
    const property cosas = #{}

    method cargar(unaCosa){
        cosas.add(unaCosa)
    }

    method almacenar(){
        cosas.addAll(camion.cosas())
    }
}
object ruta9{
    method verificarCamino(){
        if(not camion.puedeCircularEnRutaConPeligroLimite(20)){
            self.error("No puede pasar por aca she")
        }
        
    }
}

object caminosVecinales{
    var property pesoLimite = 0
    method verificarCamino(){
        if (camion.peso()> pesoLimite){
            self.error("Superas el pesito :c")
        }

    }

}
