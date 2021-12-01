//
//  PaisesTableViewCell.swift
//  Campeoes
//
//  Created by aluno on 29/11/21.
//

import UIKit

class PaisesTableViewCell: UITableViewCell {

    @IBOutlet weak var imPaisCell: UIImageView!
    @IBOutlet weak var lPais:UILabel!
    
    @IBOutlet weak var lPaisConquistas:UILabel!
    @IBOutlet weak var lPaisAnosConq:UILabel!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepare(with paisesCampeoes : PaisesCampeoes) {
        imPaisCell.image = UIImage(named: paisesCampeoes.winner)
        lPais.text = paisesCampeoes.winner
        lPaisConquistas.text = "Conquistas: \(paisesCampeoes.conquistas)"
        lPaisAnosConq.text = "Anos: \(paisesCampeoes.anos)"
    }

}
