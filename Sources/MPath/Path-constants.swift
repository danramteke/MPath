extension Path {

  public static var current: Path {
    .init(Self.fileManager.currentDirectoryPath)
  }

  public static var home: Path {
    .init(url: Self.fileManager.homeDirectoryForCurrentUser)
  }
}
