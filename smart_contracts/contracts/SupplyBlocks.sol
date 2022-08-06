// SPDX-License-Identifier: SPECKART
pragma solidity ^0.6.8;
import "./SafeMath.sol";
import "./SupplyLibrary.sol";


contract SpecRead {
    using SupplyLibrary for SupplyLibrary.SpecModel;
    SupplyLibrary.SpecModel SPEC;
    modifier onlySeller() {
        require(uint256(SPEC.Users[msg.sender].userType) == 2, "only seller");
        _;
    }
    modifier onlyBuyer() {
        require(uint256(SPEC.Users[msg.sender].userType) == 1, "only buyer");
        _;
    }


    function totalProductID() external view returns (uint256) {
        return SPEC.P_ID;
    }

    function currentOrderID() external view returns (uint256) {
        return SPEC.O_ID;
    }

    function Orders(address _seller)
        external
        view
        returns (uint32[] memory orderId)
    {
        return (SPEC.orderList[_seller]);
    }

    function productsList(address _seller, uint32 _o_id)
        external
        view
        returns (uint32[] memory prodId)
    {
        return (SPEC.prodList[_seller][_o_id]);
    }



    function product(uint32 _id)
        public
        view
        returns (
            string memory itemName,
            uint256 itemPrice,
            string memory imageId,
            uint32 availableCount,
            string memory description,
            string memory timeOfAvailability,
            address seller
        )
    {
        return (
            SPEC.Product[_id].itemName,
            SPEC.Product[_id].itemPrice,
            SPEC.Product[_id].imageId,
            SPEC.Product[_id].availableCount,
            SPEC.Product[_id].description,
            SPEC.Product[_id].timeOfAvailability,
            SPEC.Product[_id].seller
        );
    }

    function productCount(uint32 _o_id, uint32 _p_id)
        external
        view
        returns (uint32 count)
    {
        return (SPEC.prodTotal[_o_id][_p_id]);
    }

    function userOrderDetails(address _addr)
        external
        view
        returns (
            string memory userName,
            uint256 userContact,
            string memory userEmail,
            string memory userAddr
        )
    {
        return (
            SPEC.Users[_addr].userName,
            SPEC.Users[_addr].userContact,
            SPEC.Users[_addr].userEmail,
            SPEC.Users[_addr].userAddr
        );
    }

    function userDetails()
        external
        view
        returns (
            string memory userName,
            uint64 userContact,
            uint8 userGender,
            string memory userEmail,
            string memory userAddr,
            uint32[] memory orders,
            uint8 userType
        )
    {
        return (
            SPEC.Users[msg.sender].userName,
            SPEC.Users[msg.sender].userContact,
            SPEC.Users[msg.sender].userGender,
            SPEC.Users[msg.sender].userEmail,
            SPEC.Users[msg.sender].userAddr,
            SPEC.Users[msg.sender].orders,
            uint8(SPEC.Users[msg.sender].userType)
        );
    }

    function marketOrder(uint32 _id)
        external
        view
        returns (
            address BuyerAddr,
            uint256 timeStamp,
            string memory orderDetails,
            uint256 totalPrice
        )
    {
        return (
            SPEC.MarketOrder[_id].BuyerAddr,
            SPEC.MarketOrder[_id].timeStamp,
            SPEC.MarketOrder[_id].orderDetails,
            SPEC.MarketOrder[_id].totalPrice
        );
    }

    function productOrder(uint32 _o_id, uint32 _p_id)
        external
        view
        returns (
            bool isConfirmed,
            bool isRejected,
            bool isCancelled,
            bool confirmDelivery
        )
    {
        return (
            SPEC.MarketOrder[_o_id].isConfirmed[_p_id],
            SPEC.MarketOrder[_o_id].isRejected[_p_id],
            SPEC.MarketOrder[_o_id].isCancelled[_p_id],
            SPEC.MarketOrder[_o_id].confirmDelivery[_p_id]
        );
    }

    event SignUp(address indexed user, string name);
    event addItem(string user, uint256 product_id);
    event order(address indexed user, uint256 id);
}


contract SupplyBlocks is SpecRead {
    using SafeMath for uint256;
    address TOKEN;
    uint32 feePercent; 

    event Transfer(address indexed sender, address indexed receiver, uint256 amount, string remark, uint256 timestamp);

    struct TransferStruct {
        address sender;
        address receiver;
        uint256 amount;
        string remark;
        uint256 timestamp;
    }
    
    TransferStruct[] transactions;

    constructor(address _token, uint32 _feePercent) public {
        SPEC.P_ID = 0;
        SPEC.O_ID = 0;
        SPEC.MIN_TIME = 3 minutes;
        feePercent = _feePercent;
        TOKEN = _token;
    }

    function checkUser() public view returns (uint256 status) {
        if (uint256(SPEC.Users[msg.sender].userType) == 2) {
            return 2;
        } else if (uint256(SPEC.Users[msg.sender].userType) == 1) {
            return 1;
        }
        return 0;
    }

    modifier newUser() {
        require(checkUser() == 0, "Not A New User");
        _;
    }


    function userSignUp(
        string memory _userName,
        uint64 _userContact,
        uint8 _userGender,
        string memory _userEmail,
        string calldata _userAddr,
        uint8 _type
    ) external newUser() {
        SPEC.Users[msg.sender].userName = _userName;
        SPEC.Users[msg.sender].userContact = _userContact;
        SPEC.Users[msg.sender].userGender = _userGender;
        SPEC.Users[msg.sender].userEmail = _userEmail;
        SPEC.Users[msg.sender].userAddr = _userAddr;
        SPEC.Users[msg.sender].userType = SpecEnums.UserType(_type);
        emit SignUp(msg.sender, _userName);

    }

    function addProduct(
        uint32 _pid,
        string memory _itemName,
        string memory _itemType,
        uint256 _itemPrice,
        string memory _location,
        uint32 _availableCount,
        string memory _description,
        string memory _timeOfAvailability,
        string memory _imageId
    ) public returns (uint32 id){
        SPEC.P_ID = _pid;
        SPEC.Product[SPEC.P_ID].itemName = _itemName;
        SPEC.Product[SPEC.P_ID].itemType = _itemType;
        SPEC.Product[SPEC.P_ID].itemPrice = _itemPrice.mul(100);
        SPEC.Product[SPEC.P_ID].description = _description;
        SPEC.Product[SPEC.P_ID].location = _location;
        SPEC.Product[SPEC.P_ID].availableCount = _availableCount;
        SPEC.Product[SPEC.P_ID].timeOfAvailability = _timeOfAvailability;
        SPEC.Product[SPEC.P_ID].imageId = _imageId;
        SPEC.Product[SPEC.P_ID].seller = msg.sender;
        SPEC.P_ID++;
        SPEC.size_product++;
        emit addItem(_itemName, SPEC.P_ID); 
        return id;
    }

    function createOrder(
        string calldata _orderDetails,
        uint32[] calldata _prodIds,
        uint32[] calldata _prodCounts
    ) public {
        for (uint32 i = 0; i < _prodIds.length; i++) {
            require(
                SPEC.MarketOrder[SPEC.O_ID].isOrdered[_prodIds[i]] == false,
                "Product Already Ordered"
            );
            require(
                SPEC.Product[_prodIds[i]].availableCount >= _prodCounts[i],
                "Insufficient quantity of products to purchase"
            );
        }
        uint256 total = 0;
        for (uint32 i = 0; i < _prodIds.length; i++) {
            SPEC.orderList[SPEC.Product[_prodIds[i]].seller].push(SPEC.O_ID);
            SPEC.prodList[SPEC.Product[_prodIds[i]].seller][SPEC.O_ID].push(
                _prodIds[i]
            );
            SPEC.prodTotal[SPEC.O_ID][_prodIds[i]] = _prodCounts[i];
            total += (SPEC.Product[_prodIds[i]].itemPrice).mul(_prodCounts[i]);
            SPEC.Product[_prodIds[i]].availableCount -= _prodCounts[i];
            SPEC.MarketOrder[SPEC.O_ID].isOrdered[_prodIds[i]] = true;
        }

        SPEC.MarketOrder[SPEC.O_ID].BuyerAddr = msg.sender;
        SPEC.MarketOrder[SPEC.O_ID].timeStamp = now;
        SPEC.MarketOrder[SPEC.O_ID].orderDetails = _orderDetails;
        SPEC.MarketOrder[SPEC.O_ID].totalPrice = total;
        SPEC.Users[msg.sender].orders.push(SPEC.O_ID);
        SPEC.O_ID++;
    }

    function confirmPayment(uint32 _o_Id, uint32 _p_Id) public {
        require(
            SPEC.MarketOrder[_o_Id].isOrdered[_p_Id] == true &&
                SPEC.MarketOrder[_o_Id].isConfirmed[_p_Id] == true &&
                SPEC.MarketOrder[_o_Id].isPaid[_p_Id] == false &&
                SPEC.MarketOrder[_o_Id].isRejected[_p_Id] == false &&
                SPEC.MarketOrder[_o_Id].isCancelled[_p_Id] == false,
            "Conditions not satisfied"
        );
        SPEC.MarketOrder[_o_Id].isPaid[_p_Id] = true;
        emit order(msg.sender, _o_Id);
    }
    
    function confirmOrder(uint32 _o_Id, uint32 _p_Id) public {
        require(
                SPEC.MarketOrder[_o_Id].isOrdered[_p_Id] == true &&
                SPEC.MarketOrder[_o_Id].isPaid[_p_Id] == false &&
                SPEC.MarketOrder[_o_Id].isConfirmed[_p_Id] == false &&
                SPEC.MarketOrder[_o_Id].isRejected[_p_Id] == false &&
                SPEC.MarketOrder[_o_Id].isCancelled[_p_Id] == false,
            "Conditions not satisfied"
        );
        SPEC.MarketOrder[_o_Id].isConfirmed[_p_Id] = true;
    }


    function sendMoney(address payable receiver, address payable sender, string memory remark) public returns(bool success) {
        
        uint256 amount = SPEC.MarketOrder[SPEC.O_ID].totalPrice;
        transactions.push(
            TransferStruct(
                sender,
                receiver,
                amount,
                remark,
                block.timestamp
            )
        );

        emit Transfer(sender, receiver, amount, remark, block.timestamp);
        return true;
    }



    function confirmDelivery(uint32 _o_Id, uint32 _p_Id, address payable seller, string memory remark) public {
        require(
                SPEC.MarketOrder[_o_Id].confirmDelivery[_p_Id] == false &&
                SPEC.MarketOrder[_o_Id].isCancelled[_p_Id] == false,
            "Conditions not satisfied"
        );
        SPEC.MarketOrder[_o_Id].confirmDelivery[_p_Id] = true;
        sendMoney(seller, msg.sender, remark);
        SPEC.MarketOrder[_o_Id].isPaid[_p_Id] = true;
        emit order(msg.sender, _o_Id);
    }

    function rejectOrder(uint32 _o_Id, uint32 _p_Id) public {
        require(
                SPEC.MarketOrder[_o_Id].isOrdered[_p_Id] == true &&
                SPEC.MarketOrder[_o_Id].isConfirmed[_p_Id] == true &&
                SPEC.MarketOrder[_o_Id].isPaid[_p_Id] == false &&
                SPEC.MarketOrder[_o_Id].isRejected[_p_Id] == false &&
                SPEC.MarketOrder[_o_Id].isCancelled[_p_Id] == false
        );
        cancel(_o_Id,_p_Id);
    }


    function cancel(uint32 _o_Id, uint32 _p_Id) private {
        SPEC.MarketOrder[_o_Id].isCancelled[_p_Id] = true;
        SPEC.MarketOrder[_o_Id].isRejected[_p_Id] = true;
        SPEC.Product[_p_Id].availableCount += SPEC.prodTotal[_o_Id][_p_Id];
    }
}
