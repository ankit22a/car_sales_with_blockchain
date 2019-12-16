pragma solidity ^0.5.12;
contract SimpleStore {

    string value;
    event NewValueAssigned(string value);

    function set(string memory _value) public {
        value = _value;
        emit NewValueAssigned(_value);
    }

    function get()  public view returns (string memory) {
        return value;
    }
}