//
//  MedicineCell.swift
//  Medicines
//
//  Created by Nutella on 22.02.2022.
//
import UIKit

class MedicineCell: UITableViewCell {

//    @IBOutlet weak var tradeLabel: UITextView!
//    @IBOutlet weak var manufacturerNameLabel: UITextView!
    
    lazy var tradeLabel: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.contentInsetAdjustmentBehavior = .automatic
        textView.textAlignment = NSTextAlignment.left
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = UIColor.clear
        textView.textColor = UIColor.black
        textView.font = UIFont.systemFont(ofSize: 21, weight: .bold)
        textView.text = ""
        return textView
    }()
    
    lazy var manufacturerNameLabel: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.contentInsetAdjustmentBehavior = .automatic
        textView.textAlignment = NSTextAlignment.left
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.isSelectable = false
        textView.backgroundColor = UIColor.clear
        textView.textColor = UIColor.black
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.text = ""
        return textView
    }()
    var result: Result? {
        didSet {
            guard let tradeName = result?.trade_label?.name,
                  let manufacturerName = result?.manufacturer?.name
            else { return }
            
            tradeLabel.text = tradeName
            manufacturerNameLabel.text = manufacturerName
        }
    }
  
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        addSubview(tradeLabel)
        addSubview(manufacturerNameLabel)
        
        tradeLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tradeLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tradeLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        manufacturerNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        manufacturerNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        manufacturerNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        manufacturerNameLabel.topAnchor.constraint(equalTo: tradeLabel.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        backgroundColor = .white
        selectionStyle = .none
    }
    
}
