package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ClubGiftSelectedParser implements IMessageParser
   {
       
      
      private var var_1899:String;
      
      private var var_812:String;
      
      private var var_1189:int;
      
      private var var_1123:int;
      
      private var var_1313:String;
      
      public function ClubGiftSelectedParser()
      {
         super();
      }
      
      public function get classId() : int
      {
         return var_1123;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1313 = param1.readString();
         var_1899 = param1.readString();
         var_1123 = param1.readInteger();
         var_812 = param1.readString();
         var_1189 = param1.readInteger();
         return true;
      }
      
      public function get contentType() : String
      {
         return var_1899;
      }
      
      public function get productCode() : String
      {
         return var_1313;
      }
   }
}
