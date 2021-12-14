use Day2.{Direction, parseDirection};
use Day2.Direction.{Forward, Up, Down};

namespace Day2/Part2 {
    def initial(): State = (0, 0, 0)

    @test
    def executeDownCommandShouldIncreaseAim(): Bool =
        execute(initial(), (Down, 50)) == (0, 0, 50)

    @test
    def executeUpCommandShouldIncreaseAim(): Bool =
        execute(initial(), (Up, 25)) == (0, 0, -25)

    @test
    def executeForwardShouldMoveHorizontalAndDepth(): Bool =
        executeAll((Down, 2)::(Forward, 100)::Nil) == (100, 200, 2)

}