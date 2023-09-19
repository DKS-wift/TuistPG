import ProjectDescription

public extension ConfigurationName {
    static var dev: ConfigurationName { configuration(ProjectDeployTarget.dev.rawValue) }
    static var stage: ConfigurationName { configuration(ProjectDeployTarget.stage.rawValue) }
    static var prod: ConfigurationName { configuration(ProjectDeployTarget.prod.rawValue) }
}

// Configuration(name , xcconfig 경로) , 기본은 3개의 환경
public extension Array where Element == Configuration {
    static let `default`: [Configuration] = [
        .debug(name: .dev, xcconfig: .shared),
        .debug(name: .stage, xcconfig: .shared),
        .release(name: .prod, xcconfig: .shared),
    ]
}
