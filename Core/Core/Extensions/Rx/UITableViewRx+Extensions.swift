//
//  UITableViewRx+Extensions.swift
//  Core
//
//  Created by Oguz Parlak on 27.11.2019.
//  Copyright © 2019 Oguz Parlak. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

public extension Reactive where Base: UITableView {
    
    func items<Sequence: Swift.Sequence, Cell: UITableViewCell, Source: ObservableType>
            (cellType: Cell.Type = Cell.self)
            -> (_ source: Source)
            -> (_ configureCell: @escaping (Int, Sequence.Element, Cell) -> Void)
            -> Disposable
            where Source.Element == Sequence {
                let identifier: String = String(describing: cellType)
           return items(cellIdentifier: identifier, cellType: cellType)
       }
    
}
