namespace Day2 {

    @test
    def parseForwardDirection(): Bool =
        parseDirection("forward") == Ok(Forward)

    @test
    def parseUpDirection(): Bool =
        parseDirection("up") == Ok(Up)
    
    @test
    def parseDownDirection(): Bool =
        parseDirection("down") == Ok(Down)

    @test
    def parseOneDirection(): Bool =
        Result.isErr(parseDirection("one"))

    @test
    def parseCommand1(): Bool = 
        parseCommand("forward 10") == Ok(Forward, 10)

}