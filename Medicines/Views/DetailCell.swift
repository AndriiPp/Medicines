//
//  DetailCell.swift
//  Medicines
//
//  Created by Nutella on 22.02.2022.
//

import UIKit

class DetailCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UITextView!
    @IBOutlet weak var manufacturerName: UITextView!
    @IBOutlet weak var packagingDescription: UITextView!
    @IBOutlet weak var compositionDescription: UITextView!
    @IBOutlet weak var compositionInn: UITextView!
    @IBOutlet weak var pharmForm: UITextView!
    
    
    var result: Result? {
        didSet {
            if let tradeName = result?.trade_label?.name,
               let manufacturerName = result?.manufacturer?.name {
                descriptionLabel.text = tradeName
                self.manufacturerName.text = manufacturerName
            }
            if let packgingName = result?.packaging?.description {
                packagingDescription.text = packgingName
            }
            if let compositionDescript = result?.composition?.description {
                compositionDescription.text = compositionDescript
            }
            if let compositInn = result?.composition?.inn?.name {
                compositionInn.text = compositInn
            }
            if let pharForm = result?.composition?.pharm_form?.name {
                pharmForm.text = pharForm
            }
            
        }
    }
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
