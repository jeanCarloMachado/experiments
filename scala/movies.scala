val movies = <movies>
  <movie>The incredibles</movie>
  <movie>WALL E</movie>
  <movie>Jack Jack Attack</movie>
  <short>Geri's Game</short>
</movies>

(movies \ "_").foreach { movie =>
  movie match {
    case <movie>{movieName}</movie> => println(movieName)
    case <short>{shortName}</short> => println(shortName + " (short)" )
  }
}
