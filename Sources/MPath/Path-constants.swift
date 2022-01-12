extension Path {

  public static var current: Path {
    .init(Self.fileManager.currentDirectoryPath)
  }

#if targetEnvironment(macCatalyst)
  
#else
  public static var home: Path {
    .init(url: Self.fileManager.homeDirectoryForCurrentUser)
  }
#endif

}
