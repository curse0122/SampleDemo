//
//  OutputColumn.swift
//  SampleDemo
//
//  Created by Nier Liu on 2020/3/2.
//  Copyright © 2020 Nier Liu. All rights reserved.
//

import UIKit

class OutputColumn: UIView {
    
    let refreshButton: UIButton = UIButton(type: .system)
    let colorSet: [UIColor] = [.red, .green, .orange]
    
    var row: Int!
    var rowLabels: [UILabel] = []

    override func draw(_ rect: CGRect) {
        // Drawing code
        
        for i in 0..<row! {
            let rowLabel: UILabel = UILabel()
            rowLabel.frame = CGRect(x: 1, y: (rect.height - 30) / CGFloat(row!) * CGFloat(i) + 1, width: rect.width - 2, height: (rect.height - 30) / CGFloat(row) - 12)
            rowLabel.backgroundColor = colorSet[i % colorSet.count].withAlphaComponent(0.1)
            rowLabel.numberOfLines = 0
            rowLabel.textAlignment = .center
            
            rowLabels.append(rowLabel)
            self.addSubview(rowLabel)
        }
        
        refreshButton.frame = CGRect(x: 1, y: rect.height - 31, width: rect.width - 2, height: 30)
        refreshButton.setTitle("Clean", for: .normal)
        refreshButton.addTarget(self, action: #selector(clean), for: .touchDown)
        refreshButton.backgroundColor = .clear
        
        self.addSubview(refreshButton)
    }
    
    func setTitle(text: String, index: Int) {
        self.layer.borderWidth = 1
        refreshButton.backgroundColor = .purple
        refreshButton.isHighlighted = true
        rowLabels[index].text = text
    }
    
    @objc func clean() {
        if refreshButton.isHighlighted {
            self.layer.borderWidth = 0
            refreshButton.backgroundColor = .clear
            refreshButton.isHighlighted = false
            rowLabels.forEach { (label) in
                label.text = ""
            }
        }
    }

}
