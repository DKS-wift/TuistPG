import ConfigurationPlugin
import EnvironmentPlugin
import ProjectDescription

public struct TargetSpec: Configurable {
    public var name: String
    public var platform: Platform
    public var product: Product
    public var productName: String?
    public var bundleId: String?
    public var deploymentTarget: DeploymentTarget?
    public var infoPlist: InfoPlist?
    public var sources: SourceFilesList?
    public var resources: ResourceFileElements?
    public var copyFiles: [CopyFilesAction]?
    public var headers: Headers?
    public var entitlements: Path?
    public var scripts: [TargetScript]
    public var dependencies: [TargetDependency]
    public var settings: Settings?
    public var coreDataModels: [CoreDataModel]
    public var environment: [String : String]
    public var launchArguments: [LaunchArgument]
    public var additionalFiles: [FileElement]
    public var buildRules: [BuildRule]

    public init(
        name: String = "", // 타겟 이름
        platform: Platform = env.platform, // 플랫폼 ,iOS , watchOS ..
        product: Product = .staticLibrary, // framework , library
        productName: String? = nil, // 빌드 후 이름 없을 경우 타겟이름과 같음
        bundleId: String? = nil, // 번들 아이디
        deploymentTarget: DeploymentTarget? = env.deploymentTarget, // 배포 타겟 iOS, watchOS (지원하는 기기) ??
        infoPlist: InfoPlist = .default, // 기본 또는 커스텀
        sources: SourceFilesList? = .sources, // 소스 경로
        resources: ResourceFileElements? = nil, // 리소스 경로
        copyFiles: [CopyFilesAction]? = nil, // Build Phase 관련
        headers: Headers? = nil, // Target Header
        entitlements: Path? = nil, // apple Login 등 사용하는 서비스에 대한 자격 증명 명시 ,  ex )Capabilities 설정
        scripts: [TargetScript] = generateEnvironment.scripts, // 스크립트
        dependencies: [TargetDependency] = [], // 모듈 or 외부 라이브러리 의존성
        settings: Settings? = nil, // Target의 BuildSettings
        coreDataModels: [CoreDataModel] = [], // 코어 데이터 모델 경로와 버전
        environment: [String: String] = [:], // 환경 변수
        launchArguments: [LaunchArgument] = [],
        additionalFiles: [FileElement] = [],
        buildRules: [BuildRule] = [] // 특정 빌드 방식 정의 ??
    ) {
        self.name = name
        self.platform = platform
        self.product = product
        self.productName = productName
        self.bundleId = bundleId
        self.deploymentTarget = deploymentTarget
        self.infoPlist = infoPlist
        self.sources = sources
        self.resources = resources
        self.copyFiles = copyFiles
        self.headers = headers
        self.entitlements = entitlements
        self.scripts = scripts
        self.dependencies = dependencies
        self.settings = settings
        self.coreDataModels = coreDataModels
        self.environment = environment
        self.launchArguments = launchArguments
        self.additionalFiles = additionalFiles
        self.buildRules = buildRules
    }

    func toTarget() -> Target {
        self.toTarget(with: self.name)
    }

    func toTarget(with name: String, product: Product? = nil) -> Target {  // default 값으로 셋팅함
        Target(
            name: name,
            platform: platform,
            product: product ?? self.product,
            productName: productName,
            bundleId: bundleId ?? "\(env.organizationName).\(name)",
            deploymentTarget: deploymentTarget,
            infoPlist: infoPlist,
            sources: sources,
            resources: resources,
            copyFiles: copyFiles,
            headers: headers,
            entitlements: entitlements,
            scripts: scripts,
            dependencies: dependencies,
            settings: settings ?? .settings(
                base: env.baseSetting
                    .merging((product ?? self.product) == .framework ? .allLoadLDFlages : .ldFlages),
                configurations: .default,
                defaultSettings: .recommended
            ),
            coreDataModels: coreDataModels,
            environment: environment,
            launchArguments: launchArguments,
            additionalFiles: additionalFiles,
            buildRules: buildRules
        )
    }
}
