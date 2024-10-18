//pasajerosMax()
//cargaMax()
//pesoMax()
//tieneBanio()
//mantenimiento()

class VagonDePasajeros {
  const ancho
  const largo
  const property tieneBanios
  var property estaOrdenado

  method pasajerosMax()  {
    var pasajeros = 0
    if (estaOrdenado){
      if (ancho.between(0, 3)){
        pasajeros = largo * 8
      } else { 
        pasajeros = largo * 10
      }
    } else {
      if (ancho.between(0, 3)){
        pasajeros = 0.max(largo * 8 -15)
      } else { 
        pasajeros = 0.max(largo * 10 -15)
      }
    }
    return pasajeros
  }

  method cargaMax() {
    if (tieneBanios){
      return 300
    } else {
      return 800
    }
  }

  method pesoMax() {
    return 2000 + 80*self.pasajerosMax() + self.cargaMax()
  }

  method mantenimiento() {
    estaOrdenado = true
  }
}

class VagonDeCarga{
  const cargaMaxIdeal 
  var maderasSueltas
  const property tieneBanios = false 
  const property pasajerosMax = 0

  method cargaMax(){
    return 0.max(cargaMaxIdeal - 400 * maderasSueltas)
  }

  method pesoMax() = 1500 + self.cargaMax()
  
  method mantenimiento() {
    maderasSueltas = 0.max(maderasSueltas-2)
  }
}

class VagonDormitorio {
  const property compartimientos
  const property camasPorCompartimiento
  const property tieneBanios = true
  const property cargaMax = 1200 

  method pasajerosMax() = compartimientos * camasPorCompartimiento

  method pesoMax() {
    return 4000 + self.pasajerosMax()*80 + cargaMax
  }

  method mantenimiento() {}
}


