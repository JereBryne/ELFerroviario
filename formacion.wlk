import vagones.*

class Formacion {
    const property vagones = []
    const property locomotoras = []

    method agregarVagon(unVagon) {
      vagones.add(unVagon)
    }

    method agregarLocomotora(unaLocomotora) {
      locomotoras.add(unaLocomotora)
    }

    method pasajerosMax() {
      return vagones.sum({v=>v.pasajerosMax()})
    }

    method esPopular(unVagon) {
      return unVagon.pasajerosMax() > 50
    }

    method cantidadPopulares() {
      return vagones.count({v=>self.esPopular(v)})
    }

    method esCarguera() {
      return vagones.all({v=>v.cargaMax() >= 1000})
    }

    method vagonMasPesado() {
      return vagones.max({v=>v.pesoMax()})
    }

    method vagonMasLiviano() {
      return vagones.min({v=>v.pesoMax()})
    }

    method dispersionDePesos() {
      return self.vagonMasPesado().pesoMax() - self.vagonMasLiviano().pesoMax()
    }

    method cantidadDeBanios() {
      return vagones.count({v=>v.tieneBanio()})
    }

    method realizarMantenimiento() {
      vagones.forEach({v=>v.mantenimiento()})
    }

    method vagonesDePasajeros() {
      return vagones.filter({v=>v.pasajerosMax()>0})
    }

    method estaEquilibrada() {
        return (self.vagonesDePasajeros().max({v=>v.pasajerosMax()}).pasajerosMax() - self.vagonesDePasajeros().min({v=>v.pasajerosMax()}).pasajerosMax()) <= 20
    }

    method estaOrganizada() {
        const hayVagonSinPasajerosDespues = vagones.find({v => v.pasajerosMax() == 0})
        return vagones.all({v => v.pasajerosMax() > 0}) || vagones.all({v => v.pasajerosMax() == 0}) ||
            !hayVagonSinPasajerosDespues || !vagones.drop(vagones.indexOf(hayVagonSinPasajerosDespues)).any({v => v.pasajerosMax() > 0})
    }

    method velocidadMax() {
      return locomotoras.min({l=>l.velocidadMax()}).velocidadMax()
      // return locomotoras.map({l=>l.velocidadMax()}).min()
    }

    method esEficiente() {
      return locomotoras.all({l=>l.esEficiente()})
    }

    method arrastreTotal() {
      return locomotoras.sum({l=>l.arrastre()})
    }

    method pesoVagones() {
      return vagones.sum({v=>v.pesoMax()})
    }

    method pesoLocomotoras() {
      return locomotoras.sum({l=>l.peso()})
    }

    method pesoTotal() {
      return self.pesoLocomotoras() + self.pesoVagones()
    }

    method puedeMoverse() {
      return self.arrastreTotal() >= self.pesoTotal()
    }

    method kilosParaMoverse() {
      return 0.max(self.pesoTotal() - self.arrastreTotal())
    }

    method cantidadUnidades() {
      return vagones.size() + locomotoras.size()
    }

    method esCompleja() {
      return self.cantidadUnidades() > 8 || self.pesoTotal() > 80000
    }
}