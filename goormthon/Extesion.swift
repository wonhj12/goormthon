import Foundation

extension String {
  func extractKeywords() -> [String] {
    var keywords: [String] = []
    
    // Regular expression for hashtags
    let pattern = #"\#\w+"#
    let regex = try! NSRegularExpression(pattern: pattern)
    let matches = regex.matches(in: self, range: NSRange(location: 0, length: self.utf16.count))
    
    // Extract all hashtags, up to a maximum of 3
    for match in matches {
      if let range = Range(match.range, in: self) {
        let keyword = String(self[range])
        keywords.append("#\(keyword)")
      }
      
      // Break after extracting 3 keywords
      if keywords.count == 3 {
        break
      }
    }
    
    return keywords
  }
}
