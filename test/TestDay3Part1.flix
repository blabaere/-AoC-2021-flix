namespace Day3/Part1 {

    @test
    def diagnosticFromLinesShouldTurnStringsIntoLists(): Bool =
        let lines = "ab"::"cd"::Nil;
        
        diagnosticFromLines(lines) == ('a'::'b'::Nil)::('c'::'d'::Nil)::Nil

    pub def readTestInput(): Result[List[String], String] & Impure =
        File.readLines("input/day3_test.txt")

    @test
    def testPowerConsumption(): Bool & Impure =
        readTestInput() |> Result.map(powerConsumption) == Ok(198)

    @test
    def can_parse_binary(): Bool = 
        import java.lang.Integer:parseInt(String, Int32);
        parseInt("00100", 2) as & Pure  == 4
    
    @test
    def transpose_works_as_expected(): Bool =
        let lines = "aaa"::"bbb"::"ccc"::Nil;
        let rows = lines |> List.map(String.toList);
        let columns = List.transpose(rows);
        let verticals = columns |> List.map(stringFromCharList);

        verticals == "abc"::"abc"::"abc"::Nil

    @test
    def stringFromCharListWorks(): Bool = 
        stringFromCharList('a'::'b'::'z'::Nil) == "abz"

    @test
    def mostCommonBitShouldBeOne(): Bool =
        let bits = String.toList("01110");

        mostCommonBit(bits) == '1'

    @test
    def mostCommonBitShouldBeZero(): Bool =
        let bits = String.toList("01010");

        mostCommonBit(bits) == '0'


    @test
    def gammaRateBitsWork(): Bool & Impure =
        match readTestInput() {
            case Ok(diagnostic) => {
                let rows = diagnostic |> List.map(String.toList);
                let gamma = gammaRateBits(rows);

                gamma == '1'::'0'::'1'::'1'::'0'::Nil
            }
            case Err(msg) => bug!(msg)
        }

    @test
    def flipBitsShouldFlipSingleSetBit(): Bool =
        flipBits('1'::Nil) == '0'::Nil

}
