/*
* @description CC_WrapperUtils wrapper util class
* @author Ismael
* @version 1.0
*/
public with sharing class CC_WrapperUtils {

    public class CC_AdjustmentRequest{
        public String accountId;
        public CC_Amount amount;
        public String adjustmentStatus;
        
    }
    
    public class CC_Amount{
        public String amount;
        public String currency_str;
    }

    public class CC_AdjustmentResponse{
        public String adjustmentId;
    }

    public class CC_AdjustmentsPatchResponse{
        public String authorizationGroup;
    }
}