import ProjectDescription

public extension ProjectDescription.Path {
    
    /// 특정 Name XCconfig 파일 경로
    /// - Parameters:
    ///     -   param1:  개발환경
    ///     -   param2:  파일명
    /// - Returns: Path
    static func relativeToXCConfig(type: ProjectDeployTarget, name: String) -> Self {
        return .relativeToRoot("XCConfig/\(name)/\(type.rawValue).xcconfig")
    }
    
    /// Shared.xcconfig 파일경로
    static var shared: Self {
        return .relativeToRoot("XCConfig/Shared.xcconfig")
    }
}
