pragma solidity >0.5.0;

contract Storage {
    bytes4  bytes4data = 0xaabbccdd;
    uint72  uintdata = 0x123456;
    bool    booldata = true;
    address addrdata = 0xdC962cEAb6C926E3a9B133c46c7258c0E371b82b;

    function getData() public view returns (bytes4 output1, uint64 output2, bool output3, address output4) {
        assembly {
            // return the values of bytes4data, uintdata, booldata, addrdata

            let data1 := sload(bytes4data_slot)
            let result1 := shl(224, and(data1, 0xffffffff))
            mstore(0x20, result1)
            output1 := result1


            let data2 := sload(uintdata_slot)
            let result2 := shr(shl(3, uintdata_offset), data2)
            mstore(0x20, result2)
            output2 := result2


            let data3 := sload(booldata_slot)
            mstore(0x20, data3)
            output3 := data3


            let data4 := sload(addrdata_slot)
            mstore(0x20, data4)
            output4 := data4

        }
    }
}

