package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PopularTagData
   {
       
      
      private var var_1576:int;
      
      private var var_1700:String;
      
      public function PopularTagData(param1:IMessageDataWrapper)
      {
         super();
         var_1700 = param1.readString();
         var_1576 = param1.readInteger();
      }
      
      public function get tagName() : String
      {
         return var_1700;
      }
      
      public function get userCount() : int
      {
         return var_1576;
      }
   }
}
