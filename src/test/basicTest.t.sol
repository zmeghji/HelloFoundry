import "ds-test/test.sol";

contract BasicTest is DSTest {
    uint256 testNumber;

    function setUp() public {
        testNumber = 42;
    }

    function testNumberIs42() public {
        assertEq(testNumber, 42);
    }

    function testFailUnderflow() public {
        testNumber -= 43;
    }
}
