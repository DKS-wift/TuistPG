import Foundation
import ProjectDescription


/// 개발환경 이름(문자열)
/// 각 enum -> ConfigurationName -> debug, release , 3 * 2 = 6 개
public enum ProjectDeployTarget: String {
    case dev = "DEV" // 개발
    case stage = "STAGE" //
    case prod = "PROD" // 릴리즈

    public var configurationName: ConfigurationName {
        ConfigurationName.configuration(self.rawValue)
    }
}
