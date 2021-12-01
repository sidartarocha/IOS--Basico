//
//  PaisesCampeos.swift
//  Campeoes
//
//  Created by aluno on 30/11/21.
//

import Foundation


struct PaisesCampeoes : Codable {
    let winner : String
    let campeao : [WorldCup]
    let conquistas :String
    let anos: String
    
    
    static func loadPaisesCampeoes() -> [PaisesCampeoes] {
        var resultado = [PaisesCampeoes]()
        var winners = [String]()
        let copas = loadWorldCupAux()
        
        
        
        copas.forEach{ copa in winners.append(copa.winner)}
        
        
        winners = removeRepetidos(from: winners)
        
        winners.forEach { winner in
            var copaC = [WorldCup]()
            var anosC = ""
            
            copas.forEach { copa in
                if (winner == copa.winner) {
                    copaC.append(copa);
                    anosC +=  String(copa.year) + " "
                }
            }
            resultado.append(PaisesCampeoes(winner: winner, campeao: copaC, conquistas: String(copaC.count) , anos: anosC))
        }
        
        return resultado
    }
    
    static func removeRepetidos(from items: [String]) -> [String] {
        let uniqueItems = NSOrderedSet(array: items)
        return (uniqueItems.array as? [String]) ?? []
    }
    static func loadWorldCupAux() -> [WorldCup] {
        let fileURL = Bundle.main.url(forResource: "winners", withExtension: ".json")!
        let jsonData = try! Data(contentsOf: fileURL)
        
        do {
            return try JSONDecoder().decode([WorldCup].self, from: jsonData)
            
        } catch  {
            print(error.localizedDescription)
        }
        
        return []
    }
}
