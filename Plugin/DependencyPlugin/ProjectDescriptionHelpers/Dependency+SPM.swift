import ProjectDescription

public extension TargetDependency {
    struct SPM {}
}

/// Tuist + SPM 패키지 의존성 주입시 실질적으로 사용하는 변수
public extension TargetDependency.SPM {
    // static let Lottie = TargetDependency.external(name: "Lottie")
  static let Needle = TargetDependency.external(name: "NeedleFoundation")
}

public extension Package {
}
