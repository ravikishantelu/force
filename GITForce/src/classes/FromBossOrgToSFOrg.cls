public class FromBossOrgToSFOrg {

    public Double transaction_fee;
    public Double team_transaction_fee;
    public Integer team_processing_fee;
    public cls_team_fee team_fee;
    public cls_state state;
    public String salesforce_crm_id;
    public Double processing_fee;
    public cls_postal_code postal_code;
    public String name;
    public String country;
    public cls_city city;
    public cls_billing_account_id billing_account_id;
    public cls_address_2 address_2;
    public cls_address_1 address_1;
    
    public class cls_team_fee {
    }
    public class cls_state {
    }
    public class cls_postal_code {
    }
    public class cls_city {
    }
    public class cls_billing_account_id {
    }
    public class cls_address_2 {
    }
    public class cls_address_1 {
    }
    
    public static FromBossOrgToSFOrg parse(String json){
        return (FromBossOrgToSFOrg) System.JSON.deserialize(json, FromBossOrgToSFOrg.class);
    }
}