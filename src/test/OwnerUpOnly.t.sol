import "ds-test/test.sol";
import "../OwnerUpOnly.sol";

interface CheatCodes {
  function prank(address) external;
  function expectRevert(bytes calldata) external;
}

contract OwnerUpOnlyTest is DSTest {
  CheatCodes cheats = CheatCodes(HEVM_ADDRESS);
  OwnerUpOnly upOnly;

  function setUp() public {
    upOnly = new OwnerUpOnly();
  }

  function testIncrementAsOwner() public {
    assertEq(upOnly.count(), 0);
    upOnly.increment();
    assertEq(upOnly.count(), 1);
  }

  function testFailIncrementAsNotOwner() public {
    cheats.prank(address(0));
    upOnly.increment();
  }
  function testIncrementAsNotOwner() public {
    cheats.expectRevert(
      bytes("only the owner can increment the count")
    );
    cheats.prank(address(0));
    upOnly.increment();
  }
}