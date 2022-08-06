// SPDX-License-Identifier: SPECKART
pragma solidity ^0.6.8;


library SpecEnums {
    enum UserType {noUser, buyer, seller}
}


library SupplyLibrary {
    using SpecEnums for SpecEnums.UserType;
    struct User {
        string userName;
        uint64 userContact;
        uint8 userGender;
        string userEmail;
        string userAddr;
        uint32[] orders;
        SpecEnums.UserType userType;
    }
    struct Item {
        string itemName;
        string itemType;
        uint256 itemPrice;
        string location;
        string timeOfAvailability;
        string description;
        string imageId;
        uint32 availableCount;
        address payable seller;
    }
    struct Order {
        address payable BuyerAddr;
        uint256 timeStamp;
        string orderDetails;
        uint256 totalPrice;
        mapping(uint32 => bool) isOrdered;
        mapping(uint32 => bool) isConfirmed;
        mapping(uint32 => bool) isRejected;
        mapping(uint32 => bool) isPaid;
        mapping(uint32 => bool) confirmDelivery;
        mapping(uint32 => bool) isCancelled;
    }
    struct SpecModel {
        uint32 P_ID;
        uint32 O_ID;
        uint256 MIN_TIME;
        uint256 size_product;
        mapping(address => User) Users;
        mapping(uint32 => Item) Product;
        mapping(uint32 => Order) MarketOrder;
        mapping(address => uint32[]) orderList;
        mapping(address => mapping(uint32 => uint32[])) prodList;
        mapping(uint32 => mapping(uint32 => uint32)) prodTotal;
    }
}

