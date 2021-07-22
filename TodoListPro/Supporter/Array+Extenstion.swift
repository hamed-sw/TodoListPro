//
//  Array+Extenstion.swift
//  TodoListPro
//
//  Created by Hamed Amiry on 22.07.2021.
//

import Foundation

extension Array {
    public func object(at index: Int) -> Element? {
        guard index < self.count, index >= 0 else {
            return nil
        }
        return self[index]
    }
}
