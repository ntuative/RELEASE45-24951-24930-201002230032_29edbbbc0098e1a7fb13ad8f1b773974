package com.sulake.core.localization
{
   public class LocalizationDefinition implements ILocalizationDefinition
   {
       
      
      private var _name:String;
      
      private var var_1373:String;
      
      private var var_891:String;
      
      private var var_1375:String;
      
      private var var_1374:String;
      
      public function LocalizationDefinition(param1:String, param2:String, param3:String)
      {
         super();
         var _loc4_:Array = param1.split("_");
         var_1374 = _loc4_[0];
         var _loc5_:Array = String(_loc4_[1]).split(".");
         var_1373 = _loc5_[0];
         var_1375 = _loc5_[1];
         _name = param2;
         var_891 = param3;
      }
      
      public function get countryCode() : String
      {
         return var_1373;
      }
      
      public function get languageCode() : String
      {
         return var_1374;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get url() : String
      {
         return var_891;
      }
      
      public function get encoding() : String
      {
         return var_1375;
      }
      
      public function get id() : String
      {
         return var_1374 + "_" + var_1373 + "." + var_1375;
      }
   }
}
