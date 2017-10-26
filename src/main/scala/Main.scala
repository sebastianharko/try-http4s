package app

import org.http4s._
import org.http4s.dsl._
import org.http4s.server.blaze.BlazeBuilder

object Main extends App {

  val service = HttpService {
    case GET -> Root / "ping" =>
      Ok("pong")
  }

  BlazeBuilder.bindHttp(8080, "0.0.0.0")
      .mountService(service, "/")
      .run
      .awaitShutdown()
}
