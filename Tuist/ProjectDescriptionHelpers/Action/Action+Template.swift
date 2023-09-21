import ProjectDescription

/// 쉘 스크립트 관리
public extension TargetScript {
    static let swiftLint = TargetScript.pre(
        path: Path.relativeToRoot("Scripts/SwiftLintRunScript.sh"),
        name: "SwiftLint"
    )
  
  static let needleScript = TargetScript.pre(
      path: Path.relativeToRoot("Scripts/NeedleRunScript.sh"),
      name: "Needle"
  )
}
