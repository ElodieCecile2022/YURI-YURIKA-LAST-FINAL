//
//  get_points.swift
//  Yuri Yurika FinalP
//
//  Created by Pavel Boubel on 26/01/23.
//

import Foundation

func get_cur_points(yuriYurikaVM: YuriYurikaViewModel, index: Int) -> String {
    let del = String(yuriYurikaVM.lessons[index].currentProgress * 10)
    let axe = Array(del)
    var cnt = 0
    for index in 0...del.count - 1 where axe[index] == "e" {
        cnt += 1
    }
    if cnt != 0 {return "0"}
    return String(format: "%g", yuriYurikaVM.lessons[index].currentProgress * 10)
    // return String(Int(x))
}
