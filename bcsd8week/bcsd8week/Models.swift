//
//  Models.swift
//  bcsd8week
//
//  Created by 김성민 on 5/15/25.
//

import Foundation
import UIKit

struct Models {
    let name: String
}

extension Models {
    static func info1() -> [Models] {
        return [
        Models(name: "프로필"),
        Models(name: "비밀번호 변경"),
        Models(name: "알림"),
        ]
    }
}

extension Models {
    static func info2() -> [Models] {
        return [
        Models(name: "개인정보 처리방침"),
        Models(name: "코인 이용약관"),
        Models(name: "마케팅 수신 동의 약관"),
        Models(name: "오픈소스 라이선스"),
        ]
    }
}

extension Models {
    static func info3() -> [Models] {
        return [
        Models(name: "앱 버전"),
        ]
    }
}
