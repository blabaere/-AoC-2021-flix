use Day2.{Direction, parseDirection};
use Day2.Direction.{Forward, Up, Down};

namespace Day2/Part2 {

    @test
    def executeDownCommandShouldIncreaseAim(): Bool =
        let cmd = (Direction.Down, 50);
        let state = (0, 0, 0);
        let newState = state |> execute(cmd);

        newState == (0, 0, 50)

    @test
    def executeUpCommandShouldIncreaseAim(): Bool =
        let cmd = (Up, 25);
        let state = (0, 0, 0);
        let newState = state |> execute(cmd);

        newState == (0, 0, -25)

    @test
    def executeForwardShouldMoveHorizontalAndDepth(): Bool =
        let state = (0, 0, 0);
        let downCmd = (Down, 2);
        let forwardCmd = (Forward, 100);
        let newState = state |> execute(downCmd) |> execute(forwardCmd);

        newState == (100, 200, 2)

}