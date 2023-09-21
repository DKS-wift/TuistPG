import ConfigurationPlugin
import Foundation
import ProjectDescription

public enum GenerateEnvironment: String {
    case ci = "CI"
    case cd = "CD"
    case dev = "DEV"
}

let environment = ProcessInfo.processInfo.environment["TUIST_ENV"] ?? "" //TUIST_ENV 환경변수 값 불러오기
public let generateEnvironment = GenerateEnvironment(rawValue: environment) ?? .dev // 환경변수 값에 따른 환경 만들기

public extension GenerateEnvironment {
    var scripts: [TargetScript] {
        switch self {
        case .ci, .cd: 
            return []

        case .dev: // 개발환경에 필요한 스크립트 들을 넣어준다 .
          return [.swiftLint]
        
        }
    }
}
