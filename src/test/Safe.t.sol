import "ds-test/test.sol";
import "../Safe.sol";

contract SafeTest is DSTest {
  Safe safe;

  // Needed so the test contract itself can receive ether
  receive() external payable {}

  function setUp() public {
    safe = new Safe();
  }

  function testWithdraw() public {
    payable(address(safe)).transfer(1 ether);
    uint256 preBalance = address(this).balance;
    safe.withdraw();
    uint256 postBalance = address(this).balance;
    assertEq(preBalance + 1 ether, postBalance);
  }
  function testWithdrawFuzz(uint96 amount) public {
    payable(address(safe)).transfer(amount);
    uint256 preBalance = address(this).balance;
    safe.withdraw();
    uint256 postBalance = address(this).balance;
    assertEq(preBalance + amount, postBalance);
  }
}