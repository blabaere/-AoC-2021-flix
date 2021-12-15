use Day3/Part1.readTestInput;

namespace Day3/Part2 {

    @test
    def testMostCommonBitOrElse(): Bool & Impure =
        Result.map(lines -> mostCommonBitAt(lines, 0), readTestInput()) == Ok('1')

    @test
    def testOxigenRating(): Bool & Impure=
        Result.map(oxigenRating, readTestInput()) == Ok("10111")
  
    @test
    def testCo2Rating(): Bool & Impure=
        Result.map(co2Rating, readTestInput()) == Ok("01010")
      
    @test
    def testLifeSupportRating(): Bool & Impure =
        Result.flatMap(lifeSupportRating, readTestInput()) == Ok(230)

}