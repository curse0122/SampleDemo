//
//  OutputVC.swift
//  SampleDemo
//
//  Created by Nier Liu on 2020/3/2.
//  Copyright © 2020 Nier Liu. All rights reserved.
//

import UIKit

class OutputVC: UIViewController {
    
    var current: (Int, Int) = (0, 0)
    var column: Int!
    var row: Int!
    var timer: Timer!
    var columnViews: [OutputColumn] = []
    
    @IBOutlet weak var outputView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if column == nil || column < 1 {
            column = 1
        }
        
        if row == nil || row < 1 {
            row = 1
        }
        
        setView()
        setTimer()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        timer?.invalidate()
    }
    
    func setView() {
        for i in 0..<column! {
            let columnView: OutputColumn = OutputColumn()
            
            columnView.frame = CGRect(x: outputView.bounds.width / CGFloat(column!) * CGFloat(i), y: 0, width: outputView.bounds.width / CGFloat(column!), height: outputView.bounds.height)
            columnView.row = row
            
            columnViews.append(columnView)
            outputView.addSubview(columnView)
        }
    }
    
    func setTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { _ in
            self.columnViews[self.current.0].clean()
            self.current = (Int.random(in: 0..<self.column), Int.random(in: 0..<self.row))
            self.columnViews[self.current.0].setTitle(text: "random", index: self.current.1)
        })
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
