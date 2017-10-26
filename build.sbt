
name := "try-http4s"

version := "0.1"

scalaVersion := "2.12.4"

val Http4sVersion = "0.17.5"

libraryDependencies ++= Seq(
  "org.http4s"     %% "http4s-blaze-server" % Http4sVersion,
  "org.http4s"     %% "http4s-dsl"          % Http4sVersion
)

fork := true

enablePlugins(JavaServerAppPackaging)
