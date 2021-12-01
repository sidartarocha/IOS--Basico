//
//  PaisesViewController.swift
//  Campeoes
//
//  Created by aluno on 30/11/21.
//

import UIKit

class PaisesViewController: UIViewController {

    
    @IBOutlet weak var imBandeira: UIImageView!
    @IBOutlet weak var lbXcampeao: UILabel!
    @IBOutlet weak var lbConquistas: UILabel!
    @IBOutlet weak var lbFinais: UILabel!
    
    var paisCampeao: PaisesCampeoes?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let paisCampeao = paisCampeao {
            title = "Campeão"
            imBandeira.image = UIImage(named: paisCampeao.winner)
            lbXcampeao.text = paisCampeao.winner
            lbConquistas.text = "Conquistas: \(paisCampeao.conquistas)"
            
            var finais = ""
            paisCampeao.campeao.forEach{ copa in
                finais.append("- \(copa.country), \(copa.year) (\(copa.winner) \(copa.winnerScore) x \(copa.viceScore) \(copa.vice)) \n")
            }
            
            lbFinais.text = finais
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
