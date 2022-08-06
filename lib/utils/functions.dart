import 'package:flutter/services.dart';
import 'package:shopblocks_flutter/utils/constants.dart' as constants;
import 'package:web3dart/contracts.dart';
import 'package:web3dart/credentials.dart';
import 'package:web3dart/web3dart.dart';



Future<DeployedContract> loadContract() async {
  String abi = await rootBundle.loadString('assets/abi.json');
  String contractAddress = constants.contractAddress;
  final contract = DeployedContract(ContractAbi.fromJson(abi, 'SpecRead'),
      EthereumAddress.fromHex(contractAddress));
  return contract;
}

Future<String> callFunction(String funcName, List<dynamic> args,
    Web3Client ethClient, String privateKey) async {
  EthPrivateKey credentials = EthPrivateKey.fromHex(privateKey);
  DeployedContract contract = await loadContract();
  final ethFunction = contract.function(funcName);
  final result = await ethClient.sendTransaction(
    credentials,
    Transaction.callContract(
        contract: contract, function: ethFunction, parameters: args),
  );
  return result;
}

Future<String> addProduct(String itemName, String category, String quantity, String pricePerUnit, String location, String time, String description, Web3Client ethClient) async{
  var response = await callFunction('addProduct', [itemName, category, pricePerUnit, location, time, description], ethClient, constants.sellerPrivateKey);
  print(response);
  return response;
}

