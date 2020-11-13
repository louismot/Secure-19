pragma solidity >=0.4.22 <0.7.0;

/**
 * @title CST
 * @dev 
 */
contract CST {

    struct PatientInfo {
        bytes32 patientID;
        bytes32 requestID; 
        int     prog;
        uint  statusMsg;
        bool    result;
        uint  resultMsg;
    }
    mapping (address=>PatientInfo) patients;
    
    //should this address be private?
    address public patient; 
    PatientInfo public info;
    bytes32 pid;
    
    address public testAdmin; 
    bytes32 testerID;
    
    address public lab; 
    bool    infected;
    
    address public permitted;
    bytes32 permittedID;
    bytes32 rid;
    
    modifier onlyPatient()
    { require(msg.sender == patient); 
          _;
    }
   
    modifier onlyTestAdmin()
    { require(msg.sender == testAdmin); 
          _;
    }
   
    modifier onlyLab()
    { require(msg.sender == lab); 
          _;
    }

    constructor( ) public{
        patient = msg.sender;
        info.statusMsg = 400;
        // "Shouldn't be seeing this";
        info.prog = 0;
    }
    
    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
     *                                                                                   *
     *   The following function creates the patientID by hashing the patients address    *
     *                                                                                   *
     *   (Patient Only)                                                                  *
     *                                                                                   *
     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
    function getPatientID( address from, bytes32 password) public returns (bytes32 pid) {
        
            require(
                msg.sender == patient,
                "Only the patient can perform that function"
            );
            from = msg.sender;
            info.patientID = keccak256(abi.encodePacked(from, password)); 
            info.prog = 1;
            info.statusMsg = 100;
            // "Just registered";
            return info.patientID;
        }
        
    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
     *                                                                                   *
     *   The following function creates the requestID by hashing the patientID           *
     *                                                                                   *
     *   (Patient Only)                                                                  *
     *                                                                                   *
     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
    function getRequestID( bytes32 patientID, bytes32 password) public returns (bytes32 rid) {
            require(
                msg.sender == patient,
                "Only the patient can perform that function"
            );
            info.requestID = keccak256(abi.encodePacked(patientID, password));
            return info.requestID;
        }
        
    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
     *                                                                                   *
     *   The following function uses the prog variable to determine the current status.  *
     *                                                                                   *
     *   Key:                                                                            *
     *   0 == unregistered           3 == sample shipped to lab                          *
     *   1 == registered             4 == lab recieved sample                            *
     *   2 == sample collected       5 == testing complete/result available              *
     *                                                                                   *
     *   (Patient Only)                                                                  *
     *                                                                                   *
     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
    function getStatus( bytes32 patientID, bytes32 password) public returns (uint smsg){
            require(
                msg.sender == patient,
                "Only the patient can perform that function"
            );
            
            ///use uint instead of messages
            
            if(info.prog==0){
                info.statusMsg = 0;
                // "Please generate a PatientID before continuing.";
            }
            else if(info.prog==1){
                info.statusMsg = 1;
                // "Thank you for registering. This message will be once you have been tested.";
            }
            else if(info.prog==2){
                info.statusMsg = 2;
                // "Thank you for getting tested. This message will be once your test is shipped to the lab.";
            }
            else if(info.prog==3){
                info.statusMsg = 3;
                // "Your test sample has been shipped to the lab. This message will be once the lab recieves your sample.";
            }
            else if(info.prog==4){
                info.statusMsg = 4;
                // "The lab has recieved your sample, and is currently testing it. This message will be once a result is found.";
            }
            else if(info.prog==5){
                info.statusMsg = 5;
                // "Your result is ready to view. Thank you for using Secure-19.";
            }
            else{
                info.statusMsg = 6;
                // "Something went wrong. Please contact support.";
            }
            return info.statusMsg;
        }
    
    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
     *                                                                   *
     *   The following function displays a message detailing the reults, *
     *   or a seperate message if no result is available.                *
     *                                                                   *
     *   (true)     == positive                                          *
     *   (false)    == negative                                          *
     *   (prog < 4) == unavailable                                       *
     *                                                                   *
     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
    function accessResult(bytes32 requestID) public returns (uint rmsg){
        
            if(info.prog < 4){
                info.resultMsg = 0;
                // "A test result for your sample is not ready yet. Please check back later.";
            }
            else if(info.result==false){
                info.resultMsg = 1;
                // "Your sample tested negative.";
            }
            else if(info.result==true){
                info.resultMsg = 2;
                // "Your sample tested positive.";
            }
            return info.resultMsg;
        }
        
        
    function distPatientID(address tester, address labAddr, bytes32 password) public{
        require(
            msg.sender == patient,
            "Only the patient can perform that function"
        );
    /*************will be handled outside as part of phase 4**************/            
            
    }
        
        
    function distRequestID(address permitted, bytes32 password) public{
        require(
            msg.sender == patient,
            "Only the patient can perform that function"
        );
    /*************will be handled outside as part of phase 4**************/    
    }
        
        
    function regTester(address tester) public returns (bytes32 tid){
            require(
                msg.sender == testAdmin,
                "Only the the test facility can perform that function"
            );
            tester = msg.sender;
            tid = keccak256(abi.encodePacked(tester));
            testerID = tid;
            return tid;
    }
    
    function cSampleTaken(bytes32 patientID, bytes32 testerID)public {
        //change patient prog number to indicate status change
        //return confirmation message
    /*************will be handled outside as part of phase 4**************/ 
    }
    
    function cSampleShipped(bytes32 patientID, bytes32 testerID)public {
        //change patient prog number to indicate status change
        //return confirmation message
        //will be handled outside as part of phase 4 
    }
        
    function cSampleTesting(bytes32 patientID, bytes32 labID)public {
        //change patient prog number to indicate status change
        //return confirmation message
    /*************will be handled outside as part of phase 4**************/ 
    }
        
    function cResultUpload(bytes32 patientID, bytes32 testerID)public {
        //change patient prog number to indicate status change
        //return confirmation message
    /*************will be handled outside as part of phase 4**************/ 
    }
    
}


/*************
STRINGS SHOULD BE REPLACED WITH UNIQUE NUMBERS
THOSE NUMBERS CAN THEN  BE USED TO OUTPUT MESSAGES IN A WEB APP
**************/ 



//Password
//0x4265260000000000000000000000000000000000000000000000000000000000
