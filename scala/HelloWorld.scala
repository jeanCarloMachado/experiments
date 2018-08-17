object HelloWorld {
  def main(args: Array[String]): Unit = {
    val foo: (Option[String], Option[String]) = (None,  Some("def"));

    val data = ((1,2), (3,4))
    val result = getFoo(data)
    println(result)
  }


  def getFoo(data:((Int, Int), (Int,Int)) ) : Int {
      val ((a,b), (c,d)) = data
      return a+b+c+d
  }
}
