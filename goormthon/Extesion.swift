//
//  Extesion.swift
//  goormthon
//
//  Created by dasoya on 2/29/24.
//

import Foundation

extension String {
    func extractKeywords() -> [String] {
        var keywords: [String] = []
        
        // 주어진 문자열에서 #으로 시작하는 문자열을 정규표현식을 사용하여 추출합니다.
        let pattern = #"\#\w+"#
        let regex = try! NSRegularExpression(pattern: pattern)
        let matches = regex.matches(in: self, range: NSRange(location: 0, length: self.utf16.count))
        
        // 추출된 문자열을 배열에 추가합니다.
        for match in matches {
            if let range = Range(match.range, in: self) {
                let keyword = String(self[range])
                keywords.append(keyword)
            }
        }
        
        return keywords
    }
}
