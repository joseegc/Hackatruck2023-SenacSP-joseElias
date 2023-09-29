//
//  CarroSelecionado.swift
//  Aula1309
//
//  Created by Student10 on 13/09/23.
//

import SwiftUI

struct CarroSelecionado: View {
    var carroSelecionado: Carro
    var body: some View {
        Text(carroSelecionado.modelo!)
    }
}

struct CarroSelecionado_Previews: PreviewProvider {
    static var previews: some View {
        CarroSelecionado(carroSelecionado: Carro(modelo: "Vasco", ano: 2012, cor: "Laranja", preco: 2.50))
    }
}
