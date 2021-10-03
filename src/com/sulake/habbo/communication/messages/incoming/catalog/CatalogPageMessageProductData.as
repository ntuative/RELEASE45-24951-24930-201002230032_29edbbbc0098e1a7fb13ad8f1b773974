package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_199:String = "e";
      
      public static const const_56:String = "i";
      
      public static const const_58:String = "s";
       
      
      private var var_980:String;
      
      private var var_1188:String;
      
      private var var_1189:int;
      
      private var var_2067:int;
      
      private var var_979:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         var_1188 = param1.readString();
         var_2067 = param1.readInteger();
         var_980 = param1.readString();
         var_979 = param1.readInteger();
         var_1189 = param1.readInteger();
      }
      
      public function get productCount() : int
      {
         return var_979;
      }
      
      public function get productType() : String
      {
         return var_1188;
      }
      
      public function get expiration() : int
      {
         return var_1189;
      }
      
      public function get furniClassId() : int
      {
         return var_2067;
      }
      
      public function get extraParam() : String
      {
         return var_980;
      }
   }
}
